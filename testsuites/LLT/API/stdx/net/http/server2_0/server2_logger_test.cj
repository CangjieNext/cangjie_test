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
// ASSERT: scan [thread#
// ASSERT: scan [conn#

package tests.server2_0

import stdx.net.http.*
import std.net.*
import std.time.*
import std.sync.*
import stdx.log.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import {asan.*, tlsconfig.*}

@Test
class TestH2Logger {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    @TestCase
    func testLogger(): Unit {
        startServer()
        sleep(Duration.second)
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.ALL
        let req = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/hello").version(HTTP2_0).build()
        client.close()
        server.close()
    }

    func startServer(): Unit {
        server.logger.level = LogLevel.ALL
        server.distributor.register("/hello", {
            ctx => ctx.responseBuilder.body("OK")
        })
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
