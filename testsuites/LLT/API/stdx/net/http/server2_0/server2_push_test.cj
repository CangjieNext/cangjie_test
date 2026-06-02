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
 *      1. Server should correctly process push, which is called once in handler
 *      2. Server should correctly process push, which is called twice in one handler
 *
 * Test API: public class HttpResponsePusher {
 *      public static func getPusher(ctx: HttpContext): ?HttpResponsePusher
 *      public func push(path: String, method: String, header: HttpHeaders): Unit
 * }
 */

package tests.server2_0

import stdx.net.http.*
import stdx.log.*
import std.io.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.log.*
import {asan.*, tlsconfig.*}

@Test
class TestServerPush {
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    var client = ClientBuilder().tlsConfig(clientConfig()).readTimeout(Duration.Max).build()

    @TestCase
    func pushOnce(): Unit {
        startServer()

        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/pushOnce").build()
        let response = client.send(request)

        let buf = Array<UInt8>(50, repeat: 0)
        var len = response.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "initial response body")

        let pushResponses = response.getPush().getOrThrow()
        @Assert(pushResponses.size, 1)
        len = pushResponses[0].body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "first push response body")
    }

    @TestCase
    func pushTwice(): Unit {
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/pushTwice").build()
        let response = client.send(request)

        let buf = Array<UInt8>(50, repeat: 0)
        var len = response.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "initial response body")

        let pushResponses = response.getPush().getOrThrow()
        @Assert(pushResponses.size, 2)
        len = pushResponses[0].body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "first push response body")
        len = pushResponses[1].body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "second push response body")
    }

    @TestCase
    func nestingPush(): Unit {
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/nestingPush").build()
        let response = client.send(request)

        let pushResponses = response.getPush().getOrThrow()
        @Assert(pushResponses.size, 1)

        let pushPushResponses = pushResponses[0].getPush().getOrThrow()
        @Assert(pushPushResponses.size, 0)

        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server.distributor.register("/pushOnce", pushOnce)
        server.distributor.register("/firstPush", firstPush)
        server.distributor.register("/pushTwice", pushTwice)
        server.distributor.register("/secondPush", secondPush)
        server.distributor.register("/nestingPush", nestingPush)
        server.logger.level = LogLevel.TRACE
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }

    func pushOnce(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.body("initial response body")
        let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
        pusher.push("/firstPush", "GET", HttpHeaders())
    }

    func pushTwice(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.body("initial response body")
        let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
        pusher.push("/firstPush", "GET", HttpHeaders())
        pusher.push("/secondPush", "GET", HttpHeaders())
    }

    func nestingPush(ctx: HttpContext): Unit {
        let pusher = HttpResponsePusher.getPusher(ctx).getOrThrow()
        pusher.push("/pushOnce", "GET", HttpHeaders())
    }

    func firstPush(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.body("first push response body")
    }

    func secondPush(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.body("second push response body")
    }
}
