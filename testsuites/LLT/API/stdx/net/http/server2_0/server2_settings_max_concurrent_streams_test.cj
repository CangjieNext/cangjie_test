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
 *      1. when maxConcurrentStreams on server side is set to 2, client send 5 request concurrently, which will be blocked in handler, client should throw HttpException
 *      2. when maxConcurrentStreams on client side is set to 1, server send 2 push request concurrently, which will be blocked in handler, server should throw HttpException
 *
 * Test API: public class ServerBuilder {
 *      public func maxConcurrentStreams(size: UInt32): ServerBuilder
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
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import {asan.*, tlsconfig.*}

@Test
class TestSettingsMaxConcurrentStreams {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).maxConcurrentStreams(2).build()

    @TestCase
    func serverMaxConcurrentStreams(): Unit {
        startServer()

        let client = ClientBuilder().tlsConfig(clientConfig()).readTimeout(Duration.second).build()
        client.logger.level = LogLevel.OFF

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/serverMaxConcurrentStreams")
            .build()

        let fList = ArrayList<Future<Unit>>()
        for (_ in 0..5) {
            let f = spawn {
                try {
                    let _ = client.send(request)
                } catch (e: Exception) {
                    println("${e}")
                }
            }
            fList.add(f)
        }
        for (f in fList) {
            f.get()
        }
        client.close()
    }

    @TestCase
    func clientMaxConcurrentStreams(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).maxConcurrentStreams(1).build()
        @Assert(client.maxConcurrentStreams, 1)

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/clientMaxConcurrentStreams")
            .build()

        try {
            let response = client.send(request)
            println(response)
            let _ = response.getPush()
        } catch (e: Exception) {
            println("${e}")
        }

        client.close()
        server.close()

        asanGC()
    }

    func startServer() {
        server.logger.level = LogLevel.OFF
        server.distributor.register("serverMaxConcurrentStreams", {_ => sleep(Duration.hour)})
        server.distributor.register("clientMaxConcurrentStreams", pushHd)
        server.distributor.register("push", {_ => sleep(Duration.second * 3)})

        @Assert(server.maxConcurrentStreams, 2)

        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }

    func pushHd(ctx: HttpContext): Unit {
        let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
        let fList = ArrayList<Future<Unit>>()
        for (_ in 0..2) {
            let f = spawn {
                try {
                    pusher.push("push", "GET", HttpHeaders())
                } catch (e: Exception) {
                    println(e)
                }
            }
            fList.add(f)
        }
        for (f in fList) {
            f.get()
        }
    }
}

//ASSERT:scan HttpException: Active streams reach limit: 2, please wait a second
//ASSERT:scan HttpException: Write push related to stream 4, num of active push streams exceeds SettingsMaxConcurrentStreams, which is set by client
