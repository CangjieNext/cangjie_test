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
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

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
import stdx.crypto.x509.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestReadTimeout {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testReadTimeout(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).readTimeout(Duration.millisecond).build()
        sleep(Duration.second)
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hd1")
            .body("hello")
            .build()
        try {
            client.send(req)
        } catch (e: HttpTimeoutException) {
            println("caught")
        }
        client.close()
    }

    @TestCase
    func testReadTimeout2(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).readTimeout(Duration.millisecond).build()
        sleep(Duration.second)
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hd1")
            .readTimeout(Duration.millisecond)
            .body("hello")
            .build()
        try {
            client.send(req)
            @Expect(false)
        } catch (e: HttpTimeoutException) {
            @Expect(e.message, "Client2_0 receive response for stream 1 timeout.")
        }
        let req2 = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hd1")
            .readTimeout(Duration.second * 10)
            .body("hello")
            .build()
        client.send(req2)
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server
            .distributor
            .register(
                "/hd1",
                {
                    ctx =>
                    ctx.request.body.read(Array<UInt8>(5, repeat: 0))
                    ctx.responseBuilder.body("ok")
                    sleep(Duration.millisecond * 100)
                }
            )

        spawn {
            server.serve()
        }
    }
}
/* SCAN-IN
caught
 */
