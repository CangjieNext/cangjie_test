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
 * Can the HTTP/1.1 server disable persistent connection by setting Connection:close in the handler?
 *
 */

package tests.go_server

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class HandlersCanSetConnectionClose11 {
    var count = 0
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func messageTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendContentRequest()
        sleep(Duration.millisecond * 400)
        server.close()
    }

    func startServer() {
        server.distributor.register("/contentTest", handler1)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("Connection", "close")
    }

    func sendContentRequest() {
        let client = ClientBuilder().build()
        let resp = client.send(
            HttpRequestBuilder().get().url("http://127.0.0.1:${port}/contentTest").header("Connection", "close").build())
        var a = resp.headers.getFirst("Connection")
        if (let Some(v) <- a) {
            @Expect(v == "close")
            client.close()
        }
    }
}
