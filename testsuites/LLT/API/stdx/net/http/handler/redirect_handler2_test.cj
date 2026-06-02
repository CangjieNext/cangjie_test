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
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestRedirectHandler2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    func startServe() {
        spawn {
            server.distributor.register("/a", RedirectHandler("/b", 309))
            server
                .distributor
                .register(
                    "/b",
                    {
                        ctx =>
                        ctx.responseBuilder.header("content-type", "text/plain; charset=utf-8")
                        ctx.responseBuilder.header("connection", "close")
                        ctx.responseBuilder.body("redirect complete")
                    }
                )
            server.serve()
        }
    }

    @TestCase
    func testRedirect(): Unit {
        startServe()
        sleep(Duration.second)
        let client = ClientBuilder().autoRedirect(false).build()
        let response = client.get("http://127.0.0.1:${server.port}/a")
        let buf = Array<UInt8>(64, repeat: 0)
        let len = response.body.read(buf)
        @Expect(response.toString().contains("HTTP/1.1 309"))
        @Expect(len, 0)
        client.close()
        server.close()
    }
}
