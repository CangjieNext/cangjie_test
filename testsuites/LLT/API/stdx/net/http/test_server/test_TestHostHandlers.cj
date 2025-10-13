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
 * Check whether the handle can correctly process the path in the URL.
 */

package tests.go_server

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class HostHandlers {
    var count = 0
    var stringArray: Array<(String, String)> = [
        ("/", "Default"),
        ("/someDir/", "someDir"),
        ("/中/", "hash")
    ]
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func doTest(): Unit {
        startServer()
        sleep(Duration.second * 1)
        port = server.port
        sendContentRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        for ((k, v) in stringArray) {
            server.distributor.register(
                k,
                {
                    httpContext => httpContext.responseBuilder.header("Result", v)
                }
            )
        }
        spawn {
            server.serve()
        }
    }

    func sendContentRequest() {
        var ok = 0
        let client = ClientBuilder().build()
        for ((k, v) in stringArray) {
            let resp = client.get("http://127.0.0.1:${port}${k}")
            if (resp.headers.getFirst("result") != Some(v)) {
                ok++
            }
        }
        @Expect(ok, 0)
        client.close()
    }
}
