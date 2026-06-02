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
 *      Test Client1_1#sendemptybody
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestClient1_1SendEmptyBody {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1SendEmptyBodyContentLength(): Unit {
        let fut = spawn {serverPacketCaptureEmptyBodyContentLength()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).put().header("Host", "huawei.com").build()
        client.send(r)
        client.close()
        fut.get()
        println("ok")
    }

    @TestCase
    func client1_1SendEmptyBodyChunked(): Unit {
        let fut = spawn {serverPacketCaptureEmptyBodyChunked()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("host", "huawei.com")
            .header("transfer-encoding", "chunked")
            .header("trailer", "a")
            .header("trailer", "b")
            .trailer("a", "1")
            .trailer("b", "2")
            .build()
        client.send(r)
        client.close()
        fut.get()
        serverSocket.close()
        asanGC()
    }

    func serverPacketCaptureEmptyBodyContentLength() {
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("PUT /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        @Expect(read.contains("content-length: 0\r\n"))
        server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        server.close()
    }

    func serverPacketCaptureEmptyBodyChunked() {
        let server = serverSocket.accept()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect(read.contains("connection: transfer-encoding,keep-alive\r\n"))
        @Expect(read.contains("transfer-encoding: chunked\r\n"))
        @Expect(read.contains("trailer: a,b\r\n"))
        @Expect(read.contains("0\r\na: 1\r\nb: 2\r\n\r\n"))
        server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        server.close()
    }
}

/* SCAN-IN
ok
 */
