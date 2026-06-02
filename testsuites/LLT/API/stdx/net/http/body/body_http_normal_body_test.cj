/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      HttpNormalBodyProvider
 * Test API:
 *      public func read(dst: Array<Byte>): Int64
 */

package tests.body

import stdx.net.http.*
import std.net.*
import std.time.*
import std.sync.*
import stdx.log.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestNormalBodyProvider {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func testChunkedBodyProviderReadLineClient(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/a")
        let buf = Array<UInt8>(500, repeat: 0)
        var len = 0
        do {
            len = resp.body.read(buf)
            if (len != 0) {
                @Expect(String.fromUtf8(buf[..len]), "1234")
            }
        } while (len != 0)
        fut.get()
        client.close()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nContent-Length: 20\r\n\r\n".toArray())
        var num = 5
        while (num > 0) {
            num--
            server.write("1234".toArray())
            sleep(Duration.millisecond * 200)
        }
        server.close()
    }

    @TestCase
    func testChunkedBodyProviderReadLineClient2(): Unit {
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/a")
        let buf = Array<UInt8>(500, repeat: 0)
        var len = 0
        len = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[..len]), "12341234123412341234")
        fut.get()
        client.close()
    }
    func serverPacketCapture2() {
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nConnection: close\r\nContent-Length: 20\r\n\r\n".toArray())
        var num = 5
        while (num > 0) {
            num--
            server.write("1234".toArray())
            sleep(Duration.millisecond * 200)
        }
        server.close()
    }

    @TestCase
    func testChunkedBodyProviderReadLineClient3(): Unit {
        let fut = spawn {serverPacketCapture3()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/a")
        let buf = Array<UInt8>(4, repeat: 0)
        var len = 0
        do {
            len = resp.body.read(buf)
            if (len != 0) {
                @Expect(String.fromUtf8(buf[..len]), "1234")
            }
        } while (len != 0)
        fut.get()
        client.close()
    }
    func serverPacketCapture3() {
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nConnection: close\r\nContent-Length: 20\r\n\r\n".toArray())
        var num = 5
        while (num > 0) {
            num--
            server.write("1234".toArray())
        }
        server.close()
        serverSocket.close()
    }
}
