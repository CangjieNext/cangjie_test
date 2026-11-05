/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      MC-4: when a response body is fully consumed (read to EOF), the H1
 *      connection is returned to the engine idle pool. A subsequent close()
 *      on the response must NOT close that pooled connection. The next
 *      request (non-idempotent POST, which is never transparently retried)
 *      must reuse the pooled connection instead of failing with
 *      "Socket is already closed", and the pool must keep serving.
 * Test API:
 *      public func send(request: HttpRequest): HttpResponse
 *      public func close(): Unit (HttpResponse body Resource)
 */

package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

// request head parsed by the fake server
struct Mc4ReqHead {
    Mc4ReqHead(let headStr: String, let bodyGot: Int64) {}
}

@Test
class TestClient1_1CloseAfterEofPool {
    // find the end of the request head ("\r\n\r\n"), -1 if not present
    func findHeadEnd(acc: ArrayList<Byte>): Int64 {
        let size = acc.size
        if (size < 4) {
            return -1
        }
        var i: Int64 = 0
        while (i + 3 < size) {
            if (acc[i] == 13 && acc[i + 1] == 10 && acc[i + 2] == 13 && acc[i + 3] == 10) {
                return i
            }
            i += 1
        }
        return -1
    }

    // case-insensitive parse of "content-length:" from a request head
    func contentLengthOf(headStr: String): Int64 {
        let bytes = headStr.toArray()
        let n = bytes.size
        var i: Int64 = 0
        while (i < n) {
            if (matchContentLengthMarker(bytes, i)) {
                var j = i + 15
                while (j < n && (bytes[j] == 32 || bytes[j] == 9)) {
                    j += 1
                }
                var v: Int64 = 0
                while (j < n && bytes[j] >= 48 && bytes[j] <= 57) {
                    v = v * 10 + Int64(bytes[j] - 48)
                    j += 1
                }
                return v
            }
            i += 1
        }
        return 0
    }

    func matchContentLengthMarker(bytes: Array<Byte>, at: Int64): Bool {
        let m = "content-length:".toArray()
        if (at + m.size > bytes.size) {
            return false
        }
        var k: Int64 = 0
        while (k < m.size) {
            var b = bytes[at + k]
            if (b >= 65 && b <= 90) {
                b += 32
            }
            if (b != m[k]) {
                return false
            }
            k += 1
        }
        return true
    }

    // read one request head from the connection
    func readHead(conn: TcpSocket, buf: Array<Byte>): Mc4ReqHead {
        let acc = ArrayList<Byte>()
        var headEnd: Int64 = -1
        while (headEnd < 0) {
            let n = conn.read(buf)
            if (n <= 0) {
                throw SocketException("peer closed before request head complete")
            }
            var i: Int64 = 0
            while (i < n) {
                acc.add(buf[i])
                i += 1
            }
            headEnd = findHeadEnd(acc)
        }
        let headStr = String.fromUtf8(acc.toArray())
        return Mc4ReqHead(headStr, acc.size - headEnd - 4)
    }

    // serve exactly two keep-alive requests on one connection:
    // GET (Content-Length or chunked body) then POST; then hold until EOF
    func serveConn(conn: TcpSocket, chunkedGet: Bool): Unit {
        let buf = Array<Byte>(8192, repeat: 0)
        try {
            let hi1 = readHead(conn, buf)
            if (!hi1.headStr.startsWith("GET")) {
                throw SocketException("expected GET as first request")
            }
            if (chunkedGet) {
                conn.write("HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\n\r\n".toArray())
            } else {
                conn.write("HTTP/1.1 200 OK\r\nContent-Length: 5\r\n\r\nhello".toArray())
            }
            let hi2 = readHead(conn, buf)
            if (!hi2.headStr.startsWith("POST")) {
                throw SocketException("expected POST as second request")
            }
            let bodyNeed = contentLengthOf(hi2.headStr)
            var consumed: Int64 = hi2.bodyGot
            while (consumed < bodyNeed) {
                let n = conn.read(buf)
                if (n <= 0) {
                    throw SocketException("peer closed before request body complete")
                }
                consumed += n
            }
            conn.write("HTTP/1.1 200 OK\r\nContent-Length: 7\r\n\r\npost-ok".toArray())
            // hold the connection open until the client closes it
            while (true) {
                let n = conn.read(buf)
                if (n <= 0) {
                    break
                }
            }
            conn.close()
        } catch (e: Exception) {
            conn.close()
        }
    }

    func serveGetThenPost(server: TcpServerSocket, acceptCount: AtomicInt64, chunkedGet: Bool): Unit {
        server.bind()
        try {
            while (true) {
                let conn = server.accept()
                acceptCount.fetchAdd(1)
                serveConn(conn, chunkedGet)
            }
        } catch (e: Exception) {
            // server socket closed by the test
        }
    }

    // ---- normal (Content-Length) response body ----
    @TestCase
    func normalBodyCloseAfterEofKeepsConnPooled(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let acceptCount = AtomicInt64(0)
        let fut = spawn { serveGetThenPost(serverSocket, acceptCount, false) }
        sleep(Duration.millisecond * 500)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let buf = Array<Byte>(256, repeat: 0)

        // GET: consume the body to EOF, then close (documented idiom)
        let get = HttpRequestBuilder().url(u).build()
        let resp1 = client.send(get)
        let body1 = StringBuilder()
        while (true) {
            let n = resp1.body.read(buf)
            if (n == 0) {
                break
            }
            body1.append(String.fromUtf8(buf[..n]))
        }
        resp1.close()
        @Expect(body1.toString(), "hello")

        // POST is non-idempotent: no transparent reconnect on failure
        let post = HttpRequestBuilder().url(u).method("POST").body("abc").build()
        let resp2 = client.send(post)
        @Expect(resp2.status == 200, true)
        let n2 = resp2.body.read(buf)
        @Expect(String.fromUtf8(buf[..n2]), "post-ok")
        resp2.close()

        client.close()
        serverSocket.close()
        fut.get()
        // the same keep-alive connection must have served both requests
        @Expect(acceptCount.load() == 1, true)
        println("normal_body_ok")
        asanGC()
    }

    // ---- chunked response body ----
    @TestCase
    func chunkedBodyCloseAfterEofKeepsConnPooled(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let acceptCount = AtomicInt64(0)
        let fut = spawn { serveGetThenPost(serverSocket, acceptCount, true) }
        sleep(Duration.millisecond * 500)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let buf = Array<Byte>(256, repeat: 0)

        // GET with chunked body: read to EOF (last chunk returns the conn
        // to the pool), then close
        let get = HttpRequestBuilder().url(u).build()
        let resp1 = client.send(get)
        let body1 = StringBuilder()
        while (true) {
            let n = resp1.body.read(buf)
            if (n == 0) {
                break
            }
            body1.append(String.fromUtf8(buf[..n]))
        }
        resp1.close()
        @Expect(body1.toString(), "hello")

        // POST must reuse the pooled connection
        let post = HttpRequestBuilder().url(u).method("POST").body("abc").build()
        let resp2 = client.send(post)
        @Expect(resp2.status == 200, true)
        let n2 = resp2.body.read(buf)
        @Expect(String.fromUtf8(buf[..n2]), "post-ok")
        resp2.close()

        client.close()
        serverSocket.close()
        fut.get()
        @Expect(acceptCount.load() == 1, true)
        println("chunked_body_ok")
        asanGC()
    }
}

/* SCAN-IN
normal_body_ok
chunked_body_ok
 */
