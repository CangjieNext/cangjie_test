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
 * Test description: get server push
 *
 * Test API: getPush()
 *
 */

package tests.client2_0

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.log.*
import std.io.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestServerPush {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func pushDisable(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).enablePush(false).build()
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/push").build()
        let response = client.send(request)
        let buf = Array<UInt8>(10, repeat: 0)
        var len = response.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "push")

        let pushResponses = response.getPush()
        match (pushResponses) {
            case None => ()
            case Some(_) => throw Exception("push is not enabled")
        }
        client.close()
    }

    @TestCase
    func push(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/push").build()
        let response = client.send(request)
        let buf = Array<UInt8>(10, repeat: 0)
        var len = response.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "push")

        let pushResponses = response.getPush().getOrThrow()
        @Assert(pushResponses.size, 1)
        len = pushResponses[0].body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "push ok")
        let pushOfPush = pushResponses[0].getPush().getOrThrow()
        @Assert(pushOfPush.size, 0)
        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server
            .distributor
            .register(
                "/push",
                {
                    ctx =>
                    let pusher = HttpResponsePusher.getPusher(ctx)
                    pusher?.push("/", "GET", HttpHeaders())
                    ctx.responseBuilder.body("push")
                }
            )
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("push ok")
        })

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
