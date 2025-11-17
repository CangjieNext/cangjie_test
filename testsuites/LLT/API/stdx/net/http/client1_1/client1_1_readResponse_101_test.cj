/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test ConnNode#readResponse
 * Test API:
 *      private func readResponse(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestConnNodeReadResponse101 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func connNodeReadResponse101(): Unit {
        spawn {startHttpServer()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = server.port
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        for (_ in 0..11) {
            client.send(r)
        }
        let u2 = URL.parse("http://127.0.0.1:${port}/b")
        let r2 = HttpRequestBuilder().url(u2).build()
        let resp = client.send(r2)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = resp.body.read(buf)
        println(String.fromUtf8(buf[..i]))

        client.close()
        server.close()
        println("read_response_101_test")
    }

    func startHttpServer() {
        server.distributor.register("/a", handler1)
        server.distributor.register("/b", handler2)
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(101)
    }
    func handler2(ctx: HttpContext): Unit {
        ctx.responseBuilder.status(200).body("handler2 ok")
    }
}

/* SCAN-IN
read_response_101_test
 */
