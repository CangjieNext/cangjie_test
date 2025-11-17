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
 *     when closeGracefully in class Server is called, running ProtocolService instance will be closed gracefully
 *
 * Test API: public class Server {
 *     public func closeGracefully(): Unit
 * }
 */

package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.log.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestClose {
    @TestCase
    func closeWhenRunningService(): Unit {
        let server = startServer()
        let f = spawn {
            sleep(Duration.second)
            server.closeGracefully()
        }

        var client: ?Client = None
        try {
            client = ClientBuilder().tlsConfig(clientConfig()).readTimeout(Duration.Max).build()
            let request = HttpRequestBuilder()
                .version(HTTP2_0)
                .url("https://127.0.0.1:${server.port}/closeWhenRunningService")
                .build()
            let _ = client?.send(request)
        } catch (e: Exception) {
            println("${e}")
        } finally {
            client?.close()
        }

        f.get()

        asanGC()
    }

    func startServer(): Server {
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
        server.logger.level = LogLevel.DEBUG
        server.distributor.register("/closeWhenRunningService", {_ => sleep(Duration.second * 10)})
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
        return server
    }
}

//ASSERT:scan closing connection gracefully
