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
 *      when readHeaderTimeout is set to Duration.Zero, task of the corresponding timer will be triggered
 *
 * Test API: public class Server {
 *      public func serve(): Unit
 * }
 */
package tests.server2_0

import stdx.net.http.*
import std.time.*
import stdx.log.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.math.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import {asan.*, tlsconfig.*}

@Test
class TestReadHeaderTimeout {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .readHeaderTimeout(Duration.Zero)
        .maxHeaderListSize(UInt32.Max)
        .tlsConfig(serverConfig())
        .build()

    @TestCase
    func readTimeout(): Unit {
        startServer()

        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.OFF

        let bigHeader = HttpHeaders()
        for (i in 0..2000) {
            bigHeader.add("${i}" * (10), "${i}" * (10))
        }

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/header")
            .setHeaders(bigHeader)
            .build()

        try {
            let _ = client.send(request)
        } catch (e: Exception) {
            println("client failed: ${e}")
        }

        client.close()
        server.close()

        asanGC()
    }

    func startServer() {
        server.distributor.register("header", {_ => sleep(Duration.second)})

        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }
}

//ASSERT:scan read request headers timeout on stream 1
