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
 * Whether the path can be normalized and the corresponding partern can be processed when the handle is registered
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class MuxRedirectLeadingSlashes {
    var count = 0
    let s: Array<String> = ["//foo.txt", "////foo.txt", "/../../foo.txt"]
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
        server.distributor.register("/foo.txt", handler)
        spawn {
            server.serve()
        }
    }

    func handler(h: HttpContext): Unit {
        h.responseBuilder.status(200)
    }

    func sendContentRequest() {
        var ok = 0
        let client = ClientBuilder().build()
        for (i in s) {
            let resp = client.send(HttpRequestBuilder().get().url("http://127.0.0.1:${port}${i}").build())
            if (resp.status != 200) {
                ok++
            }
        }
        @Expect(ok, 0)
        client.close()
    }
}
