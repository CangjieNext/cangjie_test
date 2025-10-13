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
 * Whether redirection can be correctly configured on the server
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ServeWithSlashRedirectForHostPatterns {
    var count = 0
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    var port = 0u16

    @TestCase
    func doTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendContentRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.distributor.register("/a", RedirectHandler("/b", 308))
        server
            .distributor
            .register(
                "/b",
                {
                    ctx =>
                    ctx.responseBuilder.header("content-type", "text/plain; charset=utf-8")
                    ctx.responseBuilder.header("connection", "closssse")
                    ctx.responseBuilder.body("redirect complete")
                }
            )
        spawn {
            server.serve()
        }
    }

    func sendContentRequest() {
        let client = ClientBuilder().build()
        let resp = client.send(HttpRequestBuilder().get().url("http://127.0.0.1:${port}/a").build())
        var a = resp.headers.getFirst("connection")
        if (let Some(v) <- a) {
            @Expect(v, "closssse,keep-alive")
        }
        client.close()
    }
}
