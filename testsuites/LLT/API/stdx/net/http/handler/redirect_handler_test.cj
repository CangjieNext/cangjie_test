/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 

/*
 * Test description:
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestRedirectHandler {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    func startServe() {
        spawn {
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
            server.serve()
        }
    }

    @TestCase
    func testRedirect_1(): Unit {
        startServe()
        sleep(Duration.second)
        let client = ClientBuilder().autoRedirect(false).build()
        let response = client.get("http://127.0.0.1:${server.port}/a")
        let buf = Array<UInt8>(64, repeat: 0)
        let len = response.body.read(buf)
        @Assert("<a href=\"/b\">Permanent Redirect</a>", String.fromUtf8(buf[0..len]))
        client.close()
        println("h1 case 1 ok")
    }

    @TestCase
    func testRedirect_2(): Unit {
        let client = ClientBuilder().build()
        let response = client.get("http://127.0.0.1:${server.port}/a")
        let buf = Array<UInt8>(64, repeat: 0)
        let len = response.body.read(buf)
        @Assert("redirect complete", String.fromUtf8(buf[0..len]))
        println("h1 case 2 ok")
    }

    @TestCase
    func testRedirect_304(): Unit {
        try {
            server.distributor.register("/", RedirectHandler("/b", 304))
        } catch (e: HttpException) {
            @Assert(e.message, "Status code should be 3xx besides 304.")
        }
    }

    @TestCase
    func testRedirect_3(): Unit {
        let client = ClientBuilder().build()

        server.distributor.register("/c", RedirectHandler("http://127.0.0.1:${server.port}/d", 308))
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
        let response = client.get("http://127.0.0.1:${server.port}/c")
        let buf = Array<UInt8>(64, repeat: 0)
        let len = response.body.read(buf)
        @Assert("redirect complete", String.fromUtf8(buf[0..len]))
        client.close()
        server.close()
        println("h1 case 3 ok")
        asanGC()
    }
}
