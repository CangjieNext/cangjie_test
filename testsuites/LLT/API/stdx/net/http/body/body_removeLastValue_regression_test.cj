/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Regression test for HeaderValue.removeLastValue() with multi-value Transfer-Encoding.
 *      Verifies that removeLastValue() correctly removes only the last value when
 *      Transfer-Encoding contains multiple comma-separated values (e.g., "foo,bar,chunked").
 *      Before the fix, indexOf was used instead of lastIndexOf, causing incorrect truncation
 *      to "foo" instead of "foo,bar".
 * Test API:
 *      public func read(dst: Array<Byte>): Int64
 */

package tests.body

import stdx.net.http.*
import stdx.log.*
import std.net.*
import std.time.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestRemoveLastValueMultiValue {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func testRemoveLastValueWithMultiValueTE(): Unit {
        let fut = spawn { serverPacketCapture() }
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().readTimeout(Duration.second * 10).build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/test")

        let buf = Array<UInt8>(500, repeat: 0)
        var totalLen: Int64 = 0
        var len = resp.body.read(buf)
        while (len != 0) {
            totalLen += len
            len = resp.body.read(buf)
        }

        @Expect(totalLen, 5)

        let te = resp.headers.getFirst("transfer-encoding")
        @Assert(te != None)
        let teValue = te as String
        println("Transfer-Encoding after read: '${teValue}'")
        @Expect(teValue, "foo,bar")

        client.close()
        fut.get()
        serverSocket.close()
    }

    @TestCase
    func testRemoveLastValueWithGzipDeflateChunked(): Unit {
        let fut = spawn { serverPacketCaptureGzipDeflate() }
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().readTimeout(Duration.second * 10).build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/test")

        let buf = Array<UInt8>(500, repeat: 0)
        var len = resp.body.read(buf)
        while (len != 0) {
            len = resp.body.read(buf)
        }

        let te = resp.headers.getFirst("transfer-encoding")
        @Assert(te != None)
        let teValue = te as String
        println("Transfer-Encoding after read: '${teValue}'")
        @Expect(teValue, "gzip,deflate")

        client.close()
        fut.get()
        serverSocket.close()
    }

    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nconnection: close\r\ntransfer-encoding: foo,bar,chunked\r\n\r\n".toArray())
        server.write("5\r\nhello\r\n0\r\n\r\n".toArray())
        sleep(Duration.millisecond * 500)
        server.close()
    }

    func serverPacketCaptureGzipDeflate() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\nconnection: close\r\ntransfer-encoding: gzip,deflate,chunked\r\n\r\n".toArray())
        server.write("5\r\nhello\r\n0\r\n\r\n".toArray())
        sleep(Duration.millisecond * 500)
        server.close()
    }
}
