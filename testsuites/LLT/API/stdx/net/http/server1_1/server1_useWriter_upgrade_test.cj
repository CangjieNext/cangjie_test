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
 *      Test server upgrade and write
 * Test API:
 *      public func write(buf: Array<Byte>): Unit
 */
package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestUpgradedWrite {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func testUpgradedWrite(): Unit {
        spawn {startServer()}
        sleep(Duration.second)

        var clientSocket = TcpSocket("127.0.0.1", server.port)
        clientSocket.connect()
        clientSocket.write("GET /w HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n".toArray())
        sleep(Duration.second * 3)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = clientSocket.read(buf)
        println(String.fromUtf8(buf[..i]))

        clientSocket.close()

        server.close()
    }

    func startServer() {
        server.distributor.register("/w", handler1)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        let s = upgrade(ctx)
        s.close()
        try {
            let writer = HttpResponseWriter(ctx)
            writer.write("x".toArray())
            @Expect(1, 2)
        } catch (e: Exception) {
            @Expect(e.message, "The connection is upgraded and response cannot be written.")
        }
    }
}
