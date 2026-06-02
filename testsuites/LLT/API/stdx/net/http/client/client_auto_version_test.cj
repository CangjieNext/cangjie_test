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
 * Test description: when http request version not set, client should try h2 first if h2 enabled in alpn
 *
 */

package tests.client

import stdx.net.http.*
import stdx.log.*
import std.time.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestAutoVersion {
    var client = ClientBuilder().tlsConfig(clientConfig()).build()
    var server: ?Server = None

    @TestCase
    func h2(): Unit {
        startServer(cfg: serverConfig())
        sleep(Duration.second)
        let resp = client.get("https://127.0.0.1:${(server?.port).getOrThrow()}")
        let buf = Array<UInt8>(10, repeat: 0)
        let len = resp.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "ok")
        client.close()
        server?.close()
    }

    @TestCase
    func h1(): Unit {
        startServer()
        client = ClientBuilder().build()
        sleep(Duration.second)
        let resp = client.get("http://127.0.0.1:${(server?.port).getOrThrow()}")
        let buf = Array<UInt8>(10, repeat: 0)
        let len = resp.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "ok")
        client.close()
        server?.close()
    }

    @TestCase
    func h1s(): Unit {
        var servercfg = serverConfig()
        servercfg.supportedAlpnProtocols = ["http/1.1"]
        var clientCfg = clientConfig()
        clientCfg.supportedAlpnProtocols = ["http/1.1"]
        startServer(cfg: servercfg)
        client = ClientBuilder().tlsConfig(clientCfg).build()
        sleep(Duration.second)
        let resp = client.get("https://127.0.0.1:${(server?.port).getOrThrow()}")
        let buf = Array<UInt8>(10, repeat: 0)
        let len = resp.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "ok")
        client.close()
        server?.close()
        asanGC()
    }

    func startServer(cfg!: ?TlsServerConfig = None): Unit {
        let serverBuilder = ServerBuilder().addr("127.0.0.1").port(0)
        if (cfg.isSome()) {
            serverBuilder.tlsConfig(cfg.getOrThrow())
        }
        server = serverBuilder.build()
        server?.distributor.register("/", {
            ctx => ctx.responseBuilder.body("ok")
        })

        spawn {
            server?.serve()
        }
    }
}
