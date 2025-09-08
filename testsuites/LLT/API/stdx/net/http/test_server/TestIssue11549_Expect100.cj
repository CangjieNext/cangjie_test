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
 *       test server can distinguish multiple requests and respond correctly
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestIssue11549_Expect100 {
    var count = 0
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler1(httpContext: HttpContext): Unit {
        count++
        let bodyArr = Array<UInt8>(1000, repeat: 0)
        httpContext.request.body.read(bodyArr)
        httpContext.responseBuilder.body("Hellow world!")
    }

    func handler2(httpContext: HttpContext): Unit {
        count++
        httpContext.responseBuilder.body("Hellow world!")
    }

    func serve() {
        server.distributor.register("/readbody", handler1)
        server.distributor.register("/noreadbody", handler2)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        let req1 = "PUT /readbody HTTP/1.1\r\n" + "User-Agent: PycURL/7.22.0\r\n" + "Host: 127.0.0.1:9000\r\n" +
            "Accept: */*\r\n" + "Expect: 100-continue\r\n" + "Content-Length: 10\r\n\r\n" + "HelloWorld"
        let req2 = "PUT /noreadbody HTTP/1.1\r\n" + "User-Agent: PycURL/7.22.0\r\n" + "Host: 127.0.0.1:9000\r\n" +
            "Accept: */*\r\n" + "Expect: 100-continue\r\n" + "Content-Length: 10\r\n\r\n"
        let req3 = "GET /should-be-ignored HTTP/1.1\r\n" + "Host: foo\r\n"
        let req = req1 + req2 + req3
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(req.toArray())
        sleep(Duration.second)
        var respbuff = Array<UInt8>(10000, repeat: 0)
        var len = client.read(respbuff)
        let resp = String.fromUtf8(respbuff.slice(0, len))
        println(resp)
        @Expect(count, 2)
        @Expect(resp.contains("connection: close"), true)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
