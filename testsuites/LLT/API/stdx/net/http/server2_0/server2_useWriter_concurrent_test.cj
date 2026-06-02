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
 *      Test server concurrent write
 * Test API:
 *      public func write(buf: Array<Byte>): Unit
 */
package tests.server2_0

import stdx.net.http.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.*
import {asan.*, tlsconfig.*}
import stdx.log.*

@Test
class TestConcurrentWrite {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testConcurrentWrite(): Unit {
        startServer()
        sleep(Duration.millisecond * 200)
        let client = ClientBuilder().tlsConfig(clientConfig()).build()

        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/header").build()

        let resp = client.send(request)
        println(resp)
        sleep(Duration.second * 3)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = resp.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "x")

        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server.distributor.register("header", handler1)
        server.logger.level = LogLevel.DEBUG
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        let writer = HttpResponseWriter(ctx)
        spawn {
            writer.write("x".toArray())
        }
        writer.write("x".toArray())
    }
}
