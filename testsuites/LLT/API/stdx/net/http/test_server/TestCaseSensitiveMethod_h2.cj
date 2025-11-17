/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description: test that GET method with empty body will success
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestCaseSensitiveMethod_h2 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).tlsConfig(serverConfig()).build()
    var pass = false

    func handler(ctx: HttpContext): Unit {
        if (ctx.request.method == "GET") {
            pass = true
        }
    }

    func serve() {
        server.distributor.register("/", handler)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let req = HttpRequestBuilder().method("GET").version(HTTP2_0).url("https://127.0.0.1:${port}").build()
        client.send(req)
        sleep(Duration.second)
        @Expect(pass, true)
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
        asanGC()
    }
}
