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
 *       Test server can distinguish multiple requests and respond correctly
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestIssue13893_Expect100 {
    var count = 0
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        if (ctx.request.headers.getFirst("Expect") == Some("100-continue")) {
            ctx.responseBuilder.body("ok")
        }
    }

    func serve() {
        server.distributor.register("/readbody", handler)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        let req = "PUT /readbody HTTP/1.1\r\n" + "User-Agent: PycURL/7.22.0\r\n" + "Host: 127.0.0.1:9000\r\n" +
            "Accept: */*\r\n" + "Expect: 100-continue\r\n" + "Content-Length: 10\r\n\r\n" + "HelloWorld"
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(req.toArray())
        sleep(Duration.second)
        var respbuff = Array<UInt8>(10000, repeat: 0)
        var len = client.read(respbuff)
        let resp = String.fromUtf8(respbuff.slice(0, len))
        @Expect(resp.contains("ok"), true)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
