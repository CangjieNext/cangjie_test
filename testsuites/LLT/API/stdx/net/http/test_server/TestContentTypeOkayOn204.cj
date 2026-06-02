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
 *     test that set Content-Length with empty req body, response contains "content-type: foo/bar" and "content-length: 0"
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestContentTypeOkayOn204 {
    var port: UInt16 = 0
    var req = "GET / HTTP/1.1\r\nHost: foo\r\n\r\n"
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("content-length", "0").header("content-type", "foo/bar").status(204)
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
        var respbuff = Array<UInt8>(10000, repeat: 0)
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(req.toArray())
        sleep(Duration.second)
        client.read(respbuff)
        let resp = String.fromUtf8(respbuff)
        @Expect(resp.contains("content-length: 0\r\ncontent-type: foo/bar"), true)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
