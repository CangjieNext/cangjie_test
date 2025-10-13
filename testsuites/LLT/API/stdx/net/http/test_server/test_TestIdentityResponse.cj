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
 * Can the handler reset the header content multiple times based on the received request?
 */

package tests.go_server

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class IdentityResponse {
    var count = 0
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func messageTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendContentRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.distributor.register("/path", handler1)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("aaa", "bbb")
        if (ctx.request.form.get("te") == "identity") {
            var a = HttpHeaders()
            a.add("aaa", "ccc")
            ctx.responseBuilder.setHeaders(a)
        }
    }

    func sendContentRequest() {
        var ok = 0
        let client = ClientBuilder().build()
        let resp = client.send(HttpRequestBuilder().get().url("http://127.0.0.1:${port}/path?te=").build())
        let headerValue = resp.headers.getFirst("aaa")
        if (headerValue.getOrThrow() != "bbb") {
            ok++
        }
        let resp1 = client.send(HttpRequestBuilder().get().url("http://127.0.0.1:${port}/path?te=identity").build())
        let headerValue1 = resp1.headers.getFirst("aaa")
        if (headerValue1.getOrThrow() != "ccc") {
            ok++
        }
        @Expect(ok, 0)
        client.close()
    }
}
