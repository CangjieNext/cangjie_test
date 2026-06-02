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
package tests.client1_1

import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.net.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import stdx.encoding.url.*
import stdx.log.*
import {asan.*, tlsconfig.*}

@Test
class TestClient1_1HTTPs4 {
    var serverGlobal: ?Server = None
    func startHttpsServer() {
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/a", handler1)
        serverGlobal = server
        server.serve()
    }
    func startHttpServer() {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/a", handler1)
        serverGlobal = server
        server.serve()
    }
    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("content-length", "5").header("connection", "close").body("hello")
    }
    @TestCase
    func testHTTPs4(): Unit {
        // https
        spawn {
            startHttpsServer()
        }
        sleep(Duration.second)
        var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(cfg).build()
        client.logger.level = LogLevel.DEBUG
        // send a http request
        var u = URL.parse("https://127.0.0.1:${(serverGlobal?.port).getOrThrow()}/a")
        var r = HttpRequestBuilder().url(u).build()

        var resp = client.send(r)
        println(resp.toString())
        let buf = Array<UInt8>(500, repeat: 0)
        var i = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello")
        serverGlobal?.close()

        // http
        spawn {
            startHttpServer()
        }
        sleep(Duration.second)
        u = URL.parse("http://127.0.0.1:${(serverGlobal?.port).getOrThrow()}/a")
        r = HttpRequestBuilder().url(u).build()
        resp = client.send(r)
        println(resp.toString())
        i = resp.body.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]), "hello")
        serverGlobal?.close()
        client.close()
        asanGC()
        println("ok")
    }
}

/* SCAN-IN
ok
 */
