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
 * Test description: test that server recieve empty request body will reuse connections
 *
 * Expect: the two request has same remoteAddr
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestHandlerSetsBodyNil_h1 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.body(ctx.request.remoteAddr)
    }

    func serve() {
        server.distributor.register("/", handler)
        spawn {
            server.serve()
        }
    }

    func doGet(client: Client): String {
        let req = HttpRequestBuilder().method("GET").url("http://127.0.0.1:${port}").header("Host", "test").build()
        let resp = client.send(req)
        let buf = Array<UInt8>(2000, repeat: 0)
        let len = resp.body.read(buf)
        return String.fromUtf8(buf.slice(0, len))
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        let a = doGet(client)
        let b = doGet(client)
        @Expect(a, b)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
