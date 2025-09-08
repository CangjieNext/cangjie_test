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
 * Test description: Test Request can be correctly sent and Response can be read when the request data is empty.
 *
 * Expect: The length of the request body is 0, and the length of the response body is 0.
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestZeroLengthPostAndResponse_h1 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    var req = "Post / HTTP/1.1\r\nHost: foo\r\ncontent-length: 0\r\n\r\n"
    var len = 0

    func handler(ctx: HttpContext): Unit {
        let reqBody = Array<UInt8>(1000, repeat: 0)
        len = ctx.request.body.read(reqBody)
        ctx.responseBuilder.header("content-length", "0")
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
        var resp = String.fromUtf8(respbuff)
        @Expect(resp.contains("content-length: 0"), true)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
