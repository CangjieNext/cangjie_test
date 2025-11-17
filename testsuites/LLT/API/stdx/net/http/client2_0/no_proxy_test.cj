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

package tests.client2_0

import stdx.net.http.*
import stdx.log.*
import std.time.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}
import std.process.*

@Test
class TestNoProxy {
    var client: Client = ClientBuilder().tlsConfig(clientConfig()).httpsProxy("http://www.example.com:8080").build()
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func noProxy1(): Unit {
        startServer()
        Process.current.setEnv("no_proxy", "127.0.0.1")
        let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/").body("hello").build()
        let rsp = client.send(req)
        @Assert(rsp.status, 200)
        Process.current.setEnv("no_proxy", "")
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("ok")
        })

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
