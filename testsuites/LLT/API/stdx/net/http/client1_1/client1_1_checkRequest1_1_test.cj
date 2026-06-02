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
 *      Test Client1_1#checkRequest1_1
 * Test API:
 *      func checkRequest1_1(request: HttpRequest)
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
import std.io.*

@Test
class TestClient1_1CheckRequest1_1 {
    let client = ClientBuilder().build()
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1HttpEmptyBody(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("Host", "huawei.com").build()
        client.logger.level = LogLevel.DEBUG
        client.send(r)
        fut.get()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 0\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func client1_1HttpEmptyBodyWrongLength(): Unit {
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("http://127.0.0.1:80/a")
        let r = HttpRequestBuilder().url(u).header("content-length", "22").build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "The content-length is wrong.")
        }
    }

    @TestCase
    func client1_1HttpRawBody(): Unit {
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("Host", "huawei.com").body("hello".toArray()).build()

        client.logger.level = LogLevel.DEBUG
        client.send(r)
        fut.get()
    }
    func serverPacketCapture2() {
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 5\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        @Expect(read.contains("hello"))
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func client1_1HttpRawBodyWrongLength(): Unit {
        let u = URL.parse("http://127.0.0.1:80/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "7")
            .body("hello".toArray())
            .build()

        client.logger.level = LogLevel.DEBUG
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "The content-length is wrong.")
        }
    }

    @TestCase
    func client1_1HttpRawBody2(): Unit {
        let fut = spawn {serverPacketCapture3()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).header("content-length", "3").body("hello".toArray()).build()
        client.logger.level = LogLevel.DEBUG
        client.send(r)
        fut.get()
    }
    func serverPacketCapture3() {
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        var server = serverSocket.accept()

        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("GET /a HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 3\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        @Expect(read.contains("lo"), false)
        @Expect(read.contains("hel"), true)
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func client1_1HttpBodyNoContentLength(): Unit {
        let u = URL.parse("http://127.0.0.1:80/a")
        let r = HttpRequestBuilder().url(u).body(HttpBodyNull()).build()
        client.logger.level = LogLevel.DEBUG
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "The content-length or transfer-encoding should be set if there is a body.")
        }
        client.close()
        serverSocket.close()
        println("checkRequest_test_ok")
        asanGC()
    }
}

class HttpBodyNull <: InputStream {
    init() {}
    public func read(buf: Array<Byte>): Int64 {
        return buf.size
    }
}

/* SCAN-IN
checkRequest_test_ok
 */
