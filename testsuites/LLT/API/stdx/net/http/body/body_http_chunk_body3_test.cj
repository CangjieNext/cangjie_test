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
 *      HttpChunkedBodyProvider
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
class TestChunkedBodyProvider3 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func testChunkedBodyProviderRead(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().readTimeout(Duration.minute * 15).build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/hello")
        let buf0 = Array<UInt8>()
        var i = resp.body.read(buf0)
        @Expect(i, 0)
        let buf = Array<UInt8>(6, repeat: 0)
        i = resp.body.read(buf)
        @Expect(i, 6)
        i = resp.body.read(buf)
        @Expect(i, 2)
        i = resp.body.read(buf)
        @Expect(i, 4)
        i = resp.body.read(buf)
        @Expect(i, 4)
        i = resp.body.read(buf)
        @Expect(i, 4)
        i = resp.body.read(buf)
        @Expect(i, 0)

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
        server.write("HTTP/1.1 200 ok\r\nconnection: close\r\ntransfer-encoding: chunked\r\n\r\n".toArray())
        server.write("1\r\n1\r\n1\r\n1\r\n1\r\n1\r\n1\r\n1\r\n10\r\n1234".toArray())
        sleep(Duration.second)
        server.write("1234".toArray())
        sleep(Duration.second)
        server.write("1234".toArray())
        sleep(Duration.second)
        server.write("1234\r\n".toArray())
        server.write("0\r\n\r\n".toArray())
        server.close()
    }
}
