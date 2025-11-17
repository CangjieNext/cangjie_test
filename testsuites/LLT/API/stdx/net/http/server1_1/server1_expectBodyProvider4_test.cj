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
 *      Test server HttpExpectBodyProvider
 * Test API:
 *      public func read(buf: Array<Byte>): Int64
 */
package tests.server1_1

import stdx.net.http.*
import stdx.encoding.url.URL
import std.unittest.*
import std.unittest.testmacro.*
import stdx.log.*

@Test
class TestExpectBodyProvider4 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func testExpectBodyProvider(): Unit {
        spawn {startServer()}
        sleep(Duration.second)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("http://127.0.0.1:${server.port}/w")
        let r = HttpRequestBuilder().url(u).header("Expect", "100-continue").body("hello").build()
        let rsp = client.send(r)
        @Expect(rsp.toString().contains("HTTP/1.1 200"))
        let buf = Array<UInt8>(500, repeat: 0)
        let i = rsp.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello")
        client.close()
        server.close()
    }

    func startServer() {
        server.distributor.register("/w", handler1)
        server.serve()
    }
    // no 100 response
    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.body("hello")
    }
}
