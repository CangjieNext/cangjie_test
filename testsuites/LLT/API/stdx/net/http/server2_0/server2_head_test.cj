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
 *      Server should response HEAD req with content-length and no exception
 *
 * Test API: public class Server {
 *      public func serve(): Unit
 * }
 */

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

let sc = SyncCounter(1)

@Test
class TestHeadRequest {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).afterBind({=> sc.dec()}).build()
    let client = ClientBuilder().tlsConfig(clientConfig()).build()

    @TestCase
    func head(): Unit {
        startServer()
        sc.waitUntilZero()

        let request = HttpRequestBuilder().version(HTTP2_0).head().url("https://127.0.0.1:${server.port}/hd").build()
        let resp = client.send(request)
        if (let Some(v) <- resp.headers.getFirst("content-length")) {
            @Expect(v == "5")
        } else {
            @Expect(false)
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
    }
}
