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
 *     test that server with handler writing 204 will keep alive when recieving request from 1.0 client with keep-alive header
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestHandlersCanSetConnectionClose10 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("Connection", "close")
    }

    func serve() {
        server.distributor.register("/", handler)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port

        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        let req = "GET / HTTP/1.0\r\n" + "Host: cangjie\r\n" + "Connection: keep-alive\r\n" +
            "Keep-Alive: timeout=5\r\n\r\n"

        client.write(req.toArray())
        sleep(Duration.second)
        var respbuff1 = Array<UInt8>(1000, repeat: 0)
        let len1 = client.read(respbuff1)
        var resp1 = String.fromUtf8(respbuff1.slice(0, len1))
        @Expect(resp1.contains("200 OK"))
        client.write(req.toArray())
        sleep(Duration.second)
        var respbuff2 = Array<UInt8>(1000, repeat: 0)
        let len2 = client.read(respbuff2)
        var resp2 = String.fromUtf8(respbuff1.slice(0, len2))
        @Expect(resp2.contains("200 OK"))
        server.close()
        sleep(Duration.second)

        client.close()
    }
}
