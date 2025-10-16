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
import std.time.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.collection.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestContinuation {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    let sb = StringBuilder().append(Array<Rune>(10000, repeat: r'1'))

    @TestCase
    func testDoReq(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        sleep(Duration.millisecond)

        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hello")
            .header("bigheader", sb.toString())
            .header("anotherbigheader", sb.toString())
            .build()
        let resp = client.send(req)
        @Assert(resp.headers.getFirst("surprise") ?? "", sb.toString())
        @Assert(resp.headers.getFirst("guesswhat") ?? "", sb.toString())
        println("test big header ok")
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server
            .distributor
            .register(
                "/hello",
                {
                    ctx =>
                    ctx.responseBuilder.header("surprise", sb.toString())
                    ctx.responseBuilder.header("guesswhat", sb.toString())
                }
            )

        spawn {
            server.serve()
        }
    }
}
