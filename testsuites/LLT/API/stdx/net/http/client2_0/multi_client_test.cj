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
 *
 * Test API:
 *
 */

package tests.client2_0

import stdx.net.http.*
import stdx.log.*
import std.io.*
import std.time.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.collection.*
import std.net.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestMultiClient {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testDoReq(): Unit {
        startServer()
        sleep(Duration.second)
        for (_ in 0..10) {
            let client = ClientBuilder().tlsConfig(clientConfig()).build()
            let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/hd").build()
            let resp = client.send(req)
            @Assert(resp.status, 200)
            client.close()
        }
        println("test multi client ok")
    }

    @TestCase
    func testReqMultiThread(): Unit {
        let futList = ArrayList<Future<Unit>>()
        for (_ in 0..10) {
            let fut = spawn {
                let client = ClientBuilder().tlsConfig(clientConfig()).build()

                let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/hd").build()
                let resp = client.send(req)
                @Assert(resp.status, 200)
                client.close()
            }
            futList.add(fut)
        }
        for (f in futList) {
            f.get()
        }
        println("test multi client in coroutine ok")
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/hd", {ctx => ctx.responseBuilder.body("ok")})

        spawn {
            server.serve()
        }
    }
}
