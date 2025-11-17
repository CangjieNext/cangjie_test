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
 *      Test websocket upgrade exception
 * Test API:
 *      public static func upgradeFromServer
 */
package tests.websocket

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*

@Test
class TestServerUpgradeException {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func testServerUpgradeException(): Unit {
        spawn {startServer()}
        sleep(Duration.second)

        var clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        clientSocket.write("GET /w HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())
        sleep(Duration.second * 3)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = clientSocket.read(buf)
        // only one response
        @Expect(String.fromUtf8(buf[..i]).lastIndexOf("HTTP").getOrThrow(), 0)
        @Expect(String.fromUtf8(buf[..i]).contains("HTTP/1.1 400 Bad Request"))
        clientSocket.close()

        server.close()
    }

    func startServer() {
        server.distributor.register("/w", handler1)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        WebSocket.upgradeFromServer(ctx)
        throw Exception()
    }
}
