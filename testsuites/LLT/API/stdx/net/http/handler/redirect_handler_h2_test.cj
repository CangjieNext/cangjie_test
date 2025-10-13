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
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.sync.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestRedirectHandler2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testRedirect_1(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).autoRedirect(false).build()
        let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/a").build()
        let response = client.send(req)
        let buf = Array<UInt8>(64, repeat: 0)
        let len = response.body.read(buf)
        @Assert("<a href=\"/b\">Permanent Redirect</a>", String.fromUtf8(buf[0..len]))
        println("h2 case 1 ok")
        client.close()
    }

    @TestCase
    func testRedirect_2(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/a").build()
        let response = client.send(req)
        let buf = Array<UInt8>(64, repeat: 0)
        let len = response.body.read(buf)
        @Assert("redirect complete", String.fromUtf8(buf[0..len]))
        println("h2 case 2 ok")
    }

    @TestCase
    func testRedirect_3(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()

        server.distributor.register("/c", RedirectHandler("https://127.0.0.1:${server.port}/d", 308))
        server
            .distributor
            .register(
                "/d",
                {
                    ctx =>
                    ctx.responseBuilder.header("content-type", "text/plain; charset=utf-8")
                    ctx.responseBuilder.header("connection", "close")
                    ctx.responseBuilder.body("redirect complete")
                }
            )
        let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/c").build()
        let response = client.send(req)
        let buf = Array<UInt8>(64, repeat: 0)
        let len = response.body.read(buf)
        @Assert("redirect complete", String.fromUtf8(buf[0..len]))
        client.close()
        server.close()
        println("h2 case 3 ok")
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/a", RedirectHandler("/b", 308))
        server
            .distributor
            .register(
                "/b",
                {
                    ctx =>
                    ctx.responseBuilder.header("content-type", "text/plain; charset=utf-8")
                    ctx.responseBuilder.header("connection", "close")
                    ctx.responseBuilder.body("redirect complete")
                }
            )
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
