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
 * Check whether the query part in the URL can be correctly parsed.
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ServeMuxHandlerRedirects {
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
        server.distributor.register("/index", handler)
        spawn {
            server.serve()
        }
    }

    func sendContentRequest() {
        var ok = 0
        let client = ClientBuilder().build()
        for (i in stringArray) {
            let resp = client.get("http://127.0.0.1:${port}/index?${i}")
            if (resp.status != 200) {
                ok++
            }
            a++
        }
        @Expect(ok, 0)
        client.close()
    }

    var stringArray: Array<String> = [
        "a=b&c=d",
        "a",
        "a=babc",
        "aaaa=中"
    ]

    var a = 0

    func checkQueryStringHandler(s: String, h: HttpContext) {
        var q = h.request.url.query.getOrThrow()
        if (q == s) {
            h.responseBuilder.status(200)
        } else {
            h.responseBuilder.status(500)
        }
    }

    func handler(h: HttpContext): Unit {
        checkQueryStringHandler(stringArray[a], h)
    }
}
