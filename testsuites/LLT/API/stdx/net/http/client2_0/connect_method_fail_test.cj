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
 * Test description: test HTTP/2 connect method
 *
 * Test API: func connect(): (HttpResponse, ?StreamingSocket)
 *
 */

package tests.client2_0

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
class TestConnectFail {
    var server: ?Server = None

    @TestCase
    func testConnectFail(): Unit {
        var config = clientConfig()
        config.supportedAlpnProtocols = ["http/1.1", "h2"]
        startServer()
        let client = ClientBuilder().tlsConfig(config).build()
        var exceptionCaught = false
        try {
            let (_, _) = client.connect("https://127.0.0.1:${(server?.port).getOrThrow()}", version: HTTP2_0)
        } catch (e: HttpException) {
            exceptionCaught = true
        }
        if (!exceptionCaught) {
            @Expect(false)
        }
        client.close()
        server?.close()
        asanGC()
    }

    func startServer() {
        var config = serverConfig()
        config.supportedAlpnProtocols = ["http/1.1"]
        server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(config).build()
        server?.distributor.register("", connectHandler)
        spawn {
            server?.serve()
        }
        sleep(Duration.second)
    }

    func connectHandler(ctx: HttpContext): Unit {
        println(ctx.request)
        let socket = upgrade(ctx)
        let buf = Array<UInt8>(50, repeat: 0)
        let len = socket.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "hello, server")
        socket.write("hello, client".toArray())
        socket.close()
    }
}
