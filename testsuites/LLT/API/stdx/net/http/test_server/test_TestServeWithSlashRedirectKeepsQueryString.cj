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
 * Check whether the query part in the request is correctly processed.
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ServeWithSlashRedirectKeepsQueryString {
    var count = 0
    let s: Array<String> = ["this=that", "foo=bar", "a=1&b=2&a=3"]
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

    func handler(h: HttpContext): Unit {
        h.responseBuilder.body(h.request.url.query.getOrThrow())
    }

    func sendContentRequest() {
        var ok = 0
        let client = ClientBuilder().build()
        for (i in s) {
            let resp = client.send(HttpRequestBuilder().get().url("http://127.0.0.1:${port}/index?${i}").build())
            let buf = Array<UInt8>(2000, repeat: 0)
            let ii = resp.body.read(buf)
            if (String.fromUtf8(buf.slice(0, ii)) != i) {
                ok++
            }
        }
        @Expect(ok, 0)
        client.close()
    }
}
