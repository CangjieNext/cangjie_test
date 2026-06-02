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
 *      1. when setting initialWindowSize with an illegal argument, Exception should be thrown
 *      2. when initialWindowSize on server side is set to 5, length of Data Frames received should be 5
 *      3. when initialWindowSize on client side is set to 5, length of Data Frames sent should be 5
 *
 * Test API: public class ServerBuilder {
 *      public func initialWindowSize(size: UInt32): ServerBuilder
 * }
 */
package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.time.*
import stdx.log.*
import stdx.logger.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestInitialWindowSize {
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).initialWindowSize(5).build()

    let bodyStr = "helloworld"

    @TestCase
    func serverInitialWindowSizeInvalid(): Unit {
        try {
            let _ = ServerBuilder().initialWindowSize(UInt32(2 ** 31)).build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("Initial window size should not exceed 2^31-1"))
        }
    }

    @TestCase
    func serverInitialWindowSize(): Unit {
        startServer()

        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.DEBUG

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/serverInitialWindowSize")
            .body(bodyStr)
            .build()

        let _ = client.send(request)
        client.close()
    }

    @TestCase
    func clientInitialWindowSize(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).initialWindowSize(5).build()
        client.logger.level = LogLevel.DEBUG

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/clientInitialWindowSize")
            .build()

        let response = client.send(request)

        let buf = Array<UInt8>(10, repeat: 0)
        while (response.body.read(buf) != 0) {}

        client.close()
        server.close()

        asanGC()
    }

    func startServer() {
        server.logger.level = LogLevel.TRACE
        server
            .distributor
            .register(
                "serverInitialWindowSize",
                {
                    ctx =>
                    let buf = Array<UInt8>(10, repeat: 0)
                    while (ctx.request.body.read(buf) > 0) {}
                }
            )
        server
            .distributor
            .register(
                "clientInitialWindowSize",
                {
                    ctx =>
                    let buf = Array<UInt8>(10, repeat: 0)
                    let _ = ctx.request.body.read(buf)
                    ctx.responseBuilder.body(bodyStr)
                }
            )

        @Assert(server.initialWindowSize, 5)

        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }
}

//ASSERT:scan-2 received frame: Data Frame [Length: 5
//ASSERT:scan-2 write frame: Data Frame [Length: 5
