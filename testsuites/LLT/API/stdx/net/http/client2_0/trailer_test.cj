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
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.time.*
import std.net.*
import std.random.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.log.*
import {asan.*, tlsconfig.*}

@Test
class TestTrailer {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func trailerSend(): Unit {
        println("start test trailer")
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.TRACE
        sleep(Duration.second)
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/trailer")
            .header("trailer", "t1,t2,t3,t4,t5")
            .body("hello trailer")
            .trailer("t1", "t1")
            .trailer("t2", "t1")
            .trailer("t3", "t1")
            .trailer("t4", "t1")
            .trailer("t5", "t1")
            .trailer("t6", "t1")
            .build()
        let resp = client.send(req)
        @Expect(resp.trailers.isEmpty())
        let buf = Array<UInt8>(64, repeat: 0)
        var len = resp.body.read(buf)
        while (len > 0) {
            len = resp.body.read(buf)
        }
        @Assert(resp.trailers.isEmpty(), false)
        println(resp)
        println("h2 trailer ok")
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.logger.level = LogLevel.TRACE
        server
            .distributor
            .register(
                "/trailer",
                {
                    ctx =>
                    let buf = Array<UInt8>(64, repeat: 0)
                    var len = ctx.request.body.read(buf)
                    if (String.fromUtf8(buf[..len]) != "hello trailer") {
                        throw Exception("body problem")
                    }
                    sleep(Duration.second)
                    if (ctx.request.trailers.isEmpty()) {
                        throw Exception("no trailer")
                    }
                    println(ctx.request)
                    ctx
                        .responseBuilder
                        .header("trailer", "t1,t2,t3,t4,t5")
                        .body("hello trailer".toArray())
                        .trailer("t1", "t1")
                        .trailer("t2", "t1")
                        .trailer("t3", "t1")
                        .trailer("t4", "t1")
                        .trailer("t5", "t1")
                        .trailer("t6", "t1")
                }
            )
        spawn {
            server.serve()
        }
    }
}
