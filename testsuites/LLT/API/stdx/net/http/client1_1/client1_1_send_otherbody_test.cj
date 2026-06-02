/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
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
 *      Test Client1_1#sendhttpbody
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
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
import std.time.*
import stdx.log.*
import std.io.*

@Test
class TestClient1_1SendHttpBody {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let body = HttpBodyImpl()

    @TestCase
    func client1_1SendHttpBodyContentLength(): Unit {
        let fut = spawn {serverPacketCaptureContentLength()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let body = HttpBodyImpl()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "45")
            .body(body)
            .build()
        client.send(r)
        client.close()
        fut.get()
    }

    @TestCase
    func client1_1SendHttpBodyContentLengthLess(): Unit {
        let fut = spawn {serverPacketCaptureContentLengthless()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let body = HttpBodyImpl()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("Host", "huawei.com").header("content-length", "9").body(body)
            .build()
        client.send(r)

        // print the body not be sent
        let buf = Array<UInt8>(500, repeat: 0)
        let i = body.read(buf)
        println(i)
        @Expect(i, 36)
        @Expect(String.fromUtf8(buf[0..i]), "012345678012345678012345678012345678")

        client.close()
        fut.get()
    }

    @TestCase
    func client1_1SendHttpBodyContentLengthMore(): Unit {
        let fut = spawn {serverPacketCaptureContentLengthMore()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let body = HttpBodyImpl()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "49")
            .body(body)
            .build()
        try {
            let response = client.send(r)
            println(response)
        } catch (e: Exception) {
            println(e.message)
            //@Expect(e.message, "The socekt is closed.")
        }
        client.close()
        fut.get()
    }

    @TestCase
    func client1_1SendHttpBodyChunked(): Unit {
        let fut = spawn {serverPacketCaptureChunked()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let body = HttpBodyImpl()
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("host", "huawei.com")
            .header("transfer-encoding", "chunked")
            .header("trailer", "a")
            .header("trailer", "b")
            .body(body)
            .trailer("a", "1")
            .trailer("b", "2")
            .build()
        client.send(r)
        client.close()
        fut.get()
    }

    @TestCase
    func client1_1SendHttpBodyWithOutContentLengthChunked(): Unit {
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let body = HttpBodyImpl()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("Host", "huawei.com").body(body).build()
        try {
            client.send(r)
        } catch (e: Exception) {
            @Expect(e.message, "The content-length or transfer-encoding should be set if there is a body.")
        }
        client.close()
        serverSocket.close()
        println("ok")
        asanGC()
    }

    func serverPacketCaptureContentLength(): Bool {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        let port = (server.localAddress as IPSocketAddress)?.port ?? 0
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 45\r\n"))
        @Expect(read.contains("012345678012345678012345678012345678012345678"))
        server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        server.close()
        return true
    }

    func serverPacketCaptureContentLengthless(): Bool {
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let port = (server.localAddress as IPSocketAddress)?.port ?? 0
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 9\r\n"))
        @Expect(read.contains("012345678"))
        server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        server.close()
        return true
    }

    func serverPacketCaptureContentLengthMore(): Bool {
        let server = serverSocket.accept()
        server.write("HTTP/1.1 400 bad\r\n\r\n".toArray())
        sleep(Duration.millisecond * 200)
        server.close()
        return true
    }

    func serverPacketCaptureChunked(): Bool {
        let server = serverSocket.accept()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect((read).contains("GET /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect((read).contains("transfer-encoding: chunked\r\n"))
        @Expect((read).contains("connection: transfer-encoding,keep-alive\r\n"))
        @Expect((read).contains("trailer: a,b\r\n"))
        @Expect((read).contains("2d\r\n012345678012345678012345678012345678012345678\r\n0\r\na: 1\r\nb: 2\r\n\r\n"))
        server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        server.close()
        return true
    }
}

class HttpBodyImpl <: InputStream {
    let buffer: Array<Byte>
    init() {
        let builder = StringBuilder()
        for (_ in 0..5) {
            builder.append("012345678")
        }
        let size = builder.size
        buffer = unsafe { builder.toString().rawData().slice(0, size) }
    }

    var point = 0
    public func read(buf: Array<Byte>): Int64 {
        if (point == buffer.size) {
            return 0
        }
        if ((point + buf.size) > buffer.size) {
            buf[0..(buffer.size - point)] = buffer[point..buffer.size]
            var last = (buffer.size - point)
            point += last
            return last
        }
        buf[0..buf.size] = buffer[point..point + buf.size]
        point += buf.size
        return buf.size
    }
}

/* SCAN-IN
ok
 */
