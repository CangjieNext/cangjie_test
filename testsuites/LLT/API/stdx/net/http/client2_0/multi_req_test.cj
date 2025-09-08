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
 *
 * Test API:
 *
 */

package tests.client2_0

import stdx.net.http.*
import stdx.log.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.time.*
import std.collection.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestMultiReq {
    var client = ClientBuilder().tlsConfig(clientConfig()).build()
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testDoReq(): Unit {
        startServer()
        sleep(Duration.second)
        let buf = Array<UInt8>(10, repeat: 0)
        for (i in 0..=10) {
            let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/${i}").build()
            let resp = client.send(req)
            @Assert(resp.status, 200)
            let len = resp.body.read(buf)
            @Assert(String.fromUtf8(buf[..len]), "${i}")
        }
        println("test multi req ok")
    }

    @TestCase
    func testMultiThread(): Unit {
        let futlist = ArrayList<Future<Unit>>(11)
        for (i in 0..=10) {
            let fut = spawn {
                let req = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/${i}").build()
                let resp = client.send(req)
                @Assert(resp.status, 200)
                let buf = Array<UInt8>(10, repeat: 0)
                let len = resp.body.read(buf)
                @Assert(String.fromUtf8(buf[..len]), "${i}")
            }
            futlist.add(fut)
        }
        for (fut in futlist) {
            fut.get()
        }
        client.close()
        server.close()
        println("test multi req in coroutine ok")
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/0", {ctx => ctx.responseBuilder.body("0")})
        server.distributor.register("/1", {ctx => ctx.responseBuilder.body("1")})
        server.distributor.register("/2", {ctx => ctx.responseBuilder.body("2")})
        server.distributor.register("/3", {ctx => ctx.responseBuilder.body("3")})
        server.distributor.register("/4", {ctx => ctx.responseBuilder.body("4")})
        server.distributor.register("/5", {ctx => ctx.responseBuilder.body("5")})
        server.distributor.register("/6", {ctx => ctx.responseBuilder.body("6")})
        server.distributor.register("/7", {ctx => ctx.responseBuilder.body("7")})
        server.distributor.register("/8", {ctx => ctx.responseBuilder.body("8")})
        server.distributor.register("/9", {ctx => ctx.responseBuilder.body("9")})
        server.distributor.register("/10", {ctx => ctx.responseBuilder.body("10")})

        spawn {
            server.serve()
        }
    }
}
