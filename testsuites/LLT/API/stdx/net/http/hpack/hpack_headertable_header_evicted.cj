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
 *      Test the hpack header table when header eviction occurs.
 * Test API:
 *      HeaderTable#insert
 *		HeaderTable#indexOf
 */

package tests.hpack

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.random.*
import stdx.log.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import {asan.*, tlsconfig.*}

@Test
class TestHpackHeaderTableWhenHeaderEvictionOccurs {
    private let r = Random()
    private let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testHpackHeaderTableWhenHeaderEvictionOccurs(): Unit {
        spawn {
            startServer()
        }
        sleep(Duration.millisecond * 100)
        let port = server.port

        let c = ClientBuilder().tlsConfig(clientConfig()).build()
        for (_ in 0..100) {
            c.get("https://127.0.0.1:${port}/")
        }
        println("success")
    }

    private func startServer(): Unit {
        server
            .distributor
            .register(
                "/",
                {
                    ctx =>
                    ctx.responseBuilder.status(201)
                    ctx.responseBuilder.header("h1", "${r.nextUInt64()}")
                    ctx.responseBuilder.header("h2", "${r.nextUInt64()}")
                }
            )
        server.logger.level = LogLevel.TRACE
        server.serve()
    }
}
