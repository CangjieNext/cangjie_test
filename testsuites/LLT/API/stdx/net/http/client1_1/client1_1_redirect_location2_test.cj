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
 *      Test client autoRedirect read Location
 * Test API:
 *      func doRequest(req: HttpRequest): HttpResponse
 */
package tests.client1_1

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
class TestClientReadLocation2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func testClientReadLocation2(): Unit {
        spawn {startServer()}
        sleep(Duration.second)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let u = "http://127.0.0.1:${server.port}/a,c/"
        println(client.get(u))

        let u2 = "http://127.0.0.1:${server.port}/r,c/"
        println(client.get(u2))

        client.close()
        server.close()
    }

    func startServer() {
        server.distributor.register("/a,c/", handler1)
        server.distributor.register("/r,c/", handler2)
        server.serve()
    }

    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(204)
    }
    func handler2(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(304).header("location", "http://127.0.0.1:${server.port}/a,c/")
    }
}
