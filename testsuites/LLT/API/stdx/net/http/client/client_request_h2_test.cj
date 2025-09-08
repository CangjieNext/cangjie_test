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

package tests.client

import stdx.net.http.*
import stdx.log.*
import std.sync.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestClientRequestH2 {
    var client: Client = ClientBuilder().tlsConfig(clientConfig()).build()
    var server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testGet(): Unit {
        startServer()
        let req = HttpRequestBuilder().version(HTTP2_0).get().url("https://127.0.0.1:${server.port}/req").build()
        let resp = client.send(req)
        @Assert(readBody(resp), "GET")
    }

    @TestCase
    func testPost(): Unit {
        let req = HttpRequestBuilder().version(HTTP2_0).post().url("https://127.0.0.1:${server.port}/req").build()
        var resp = client.send(req)
        @Assert(readBody(resp), "POST")
    }

    @TestCase
    func testHead(): Unit {
        let req = HttpRequestBuilder().version(HTTP2_0).head().url("https://127.0.0.1:${server.port}/req").build()
        let resp = client.send(req)
        @Assert(readBody(resp), "")
    }

    @TestCase
    func testPut(): Unit {
        let req = HttpRequestBuilder().version(HTTP2_0).put().url("https://127.0.0.1:${server.port}/req").build()
        var resp = client.send(req)
        @Assert(readBody(resp), "PUT")
    }

    @TestCase
    func testDelete(): Unit {
        let req = HttpRequestBuilder().version(HTTP2_0).delete().url("https://127.0.0.1:${server.port}/req").build()
        var resp = client.send(req)
        @Assert(readBody(resp), "DELETE")
    }

    @TestCase
    func testOptions(): Unit {
        let req = HttpRequestBuilder().version(HTTP2_0).options().url("https://127.0.0.1:${server.port}").build()
        var resp = client.send(req)
        let allow = resp.headers.get("allow")
        @Expect(allow.size > 0)
        client.close()
        server.close()
        asanGC()
    }

    func readBody(resp: HttpResponse): String {
        let buf = Array<UInt8>(10, repeat: 0)
        let len = resp.body.read(buf)
        return String.fromUtf8(buf[..len])
    }

    func startServer(): Unit {
        server.distributor.register("/req", {
            ctx => ctx.responseBuilder.body(ctx.request.method)
        })

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
