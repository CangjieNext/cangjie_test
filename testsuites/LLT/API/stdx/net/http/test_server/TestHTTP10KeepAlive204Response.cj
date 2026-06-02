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
class TestHTTP10KeepAlive204Response {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(204)
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
        let req = "GET / HTTP/1.0\r\n" + "Host: cangjie\r\n" + "Connection: keep-alive\r\n" + "Keep-Alive: timeout=5\r\n" +
            "If-Modified-Since: Mon, 02 Jan 2006 15:04:05 GMT\r\n\r\n"
        for (_ in 0..2) {
            var respbuff = Array<UInt8>(1000, repeat: 0)
            client.write(req.toArray())
            sleep(Duration.second)
            let len = client.read(respbuff)
            var resp = String.fromUtf8(respbuff.slice(0, len))
            @Expect(resp.contains("204 No Content"))
        }
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
