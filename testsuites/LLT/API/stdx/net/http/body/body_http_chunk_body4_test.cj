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
import std.collection.*

@Test
class TestChunkedBodyProvider4 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func testChunkedBodyProviderRead(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().readTimeout(Duration.minute * 15).build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/hello")
        let buf = Array<UInt8>()
        var i = resp.body.read(buf)
        @Expect(i, 0)
        @Expect(resp.trailers.getFirst("lab"), Some(("a")))
        @Expect(resp.trailers.getFirst("rfc"), Some(("9110")))

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
        server.write(
            "HTTP/1.1 200 ok\r\nTrailer: lab, rfc\r\nconnection: close\r\ntransfer-encoding: chunked\r\n\r\n".toArray())
        sleep(Duration.second)
        server.write("0\r\nlab: a\r\nrfc: 9110\r\n\r\n".toArray())
        sleep(Duration.second)
        server.close()
    }
}
