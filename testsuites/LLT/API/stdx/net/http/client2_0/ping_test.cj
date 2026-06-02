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
import std.sync.*
import {asan.*, tlsconfig.*}

@Test
class TestSendPing {
    let client = ClientBuilder().tlsConfig(clientConfig()).build()
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testPing(): Unit {
        startServer()
        client.logger.level = LogLevel.TRACE
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hd")
            .body("hello")
            .build()
        let rsp = client.send(req)
        rsp.body.read(Array<UInt8>(5, repeat: 0))
        sleep(Duration.second * 1)
        client.send(req)
    }

    func startServer(): Unit {
        server.distributor.register("/hd", {ctx => ctx.responseBuilder.body("ok")})
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
/* SCAN-IN
receive frame:Ping Frame
 */
