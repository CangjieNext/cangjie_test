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
 *      Test Client1_1#readStatusLine
 * Test API:
 *      private func readStatusLine(): (String, UInt16)
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
class TestClient1_1ReadStatusLine {
    let serverSocket = TcpServerSocket(bindAt: 0)

    let client = ClientBuilder().build()

    @TestCase
    func client1_1ReadStatusLine(): Unit {
        spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "5")
            .body("hello".toArray())
            .build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid response status line.")
        }
    }
    func serverPacketCapture() {
        serverSocket.bind()
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        var i = server.read(buf)
        var read = String.fromUtf8(buf[0..i])
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        @Expect(read.contains("GET /a HTTP/1.1\r\nhost: huawei.com\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("content-length: 5\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        @Expect(read.contains("hello"))
        server.write("\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func client1_1ReadStatusLine2(): Unit {
        spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "5")
            .body("hello".toArray())
            .build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid response status line.")
        }
    }
    func serverPacketCapture2() {
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func client1_1ReadStatusLine3(): Unit {
        spawn {serverPacketCapture3()}
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "5")
            .body("hello".toArray())
            .build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid response status code.")
        }
    }
    func serverPacketCapture3() {
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 700\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func client1_1ReadStatusLine4(): Unit {
        spawn {serverPacketCapture4()}
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "5")
            .body("hello".toArray())
            .build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "Invalid response status line.")
        }
    }
    func serverPacketCapture4() {
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 r00\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }

    @TestCase
    func client1_1ReadStatusLine5(): Unit {
        spawn {serverPacketCapture5()}
        sleep(Duration.millisecond * 100)
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder()
            .url(u)
            .header("Host", "huawei.com")
            .header("content-length", "5")
            .body("hello".toArray())
            .build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "The status line or header section can not contain raw CR.")
        }
        client.close()
        serverSocket.close()
        println("readStatusLine_test_ok")
        asanGC()
    }
    func serverPacketCapture5() {
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200\r\r\nconnection: close\r\n\r\n".toArray())
        server.close()
    }
}

/* SCAN-IN
readStatusLine_test_ok
 */
