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
 * Test description:
 *      1. Server should correctly process requests, which are sent serially
 *      2. Server should correctly process requests, which are sent concurrently
 *
 * Test API: public class Server {
 *      public func serve(): Unit
 * }
 */
package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.time.*
import stdx.log.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import {asan.*, tlsconfig.*}

@Test
class TestMultiRequests {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .readTimeout(Duration.second)
        .tlsConfig(serverConfig())
        .build()
    let client = ClientBuilder().tlsConfig(clientConfig()).build()

    @TestCase
    func multiRequestsInOneThread(): Unit {
        startServer()

        for (_ in 0..100) {
            let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/hd").build()
            let _ = client.send(request)
        }
    }

    @TestCase
    func multiThreads(): Unit {
        let fList = ArrayList<Future<Unit>>()
        for (_ in 0..100) {
            let f = spawn {
                let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/hd").build()
                let _ = client.send(request)
            }
            fList.add(f)
        }

        for (f in fList) {
            f.get()
        }

        client.close()
        server.close()

        asanGC()
    }

    func startServer() {
        server.distributor.register("hd", {ctx => ctx.responseBuilder.body("Hello")})

        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }
}
