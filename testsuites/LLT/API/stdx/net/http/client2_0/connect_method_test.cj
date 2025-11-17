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
import stdx.crypto.x509.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestConnect {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .tlsConfig(serverConfig())
        .enableConnectProtocol(true)
        .build()

    @TestCase
    func testConnect(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.TRACE
        let (resp, conn) = client.connect("https://127.0.0.1:${server.port}", version: HTTP2_0)
        @Expect(resp.status, 200)
        if (let Some(socket) <- conn) {
            println(socket)
            println(socket.localAddress)
            println(socket.remoteAddress)
            @Assert(socket.readTimeout, None)
            @Assert(socket.writeTimeout, None)
            socket.write("hello, server".toArray())
            let buf = Array<UInt8>(50, repeat: 0)
            let len = socket.read(buf)
            @Assert(String.fromUtf8(buf[..len]), "hello, client")
            socket.close()
            @Expect(socket.isClosed())
        } else {
            @Expect(false)
        }
        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server.logger.level = LogLevel.TRACE
        server.distributor.register("", connectHandler)
        spawn {
            server.serve()
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
