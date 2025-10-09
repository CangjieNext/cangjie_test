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
 *      HttpChunkedBodyProvider
 * Test API:
 *      public func read(dst: Array<Byte>): Int64
 */

package tests.body

import stdx.net.http.*
import std.net.*
import std.time.*
import std.sync.*
import stdx.log.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import {asan.*, tlsconfig.*}

@Test
class TestH2BodyProvider {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    @TestCase
    func testBodyProvider1(): Unit {
        startServer()
        sleep(Duration.second)
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let req = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/hello").version(HTTP2_0).build()
        let resp = client.send(req)
        let buf = Array<UInt8>(500, repeat: 0)
        var len = 0
        do {
            len = resp.body.read(buf)
            if (len != 0) {
                @Assert(len, 6)
                @Expect(String.fromUtf8(buf[..len]), "cancan")
            }
        } while (len != 0)
        client.close()
    }

    @TestCase
    func testBodyProvider2(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        client.logger.level = LogLevel.TRACE
        let req = HttpRequestBuilder().url("https://127.0.0.1:${server.port}/hello").version(HTTP2_0).build()
        let resp = client.send(req)
        let buf = Array<UInt8>(3, repeat: 0)
        var len = 0
        do {
            len = resp.body.read(buf)
            if (len != 0) {
                @Assert(len, 3)
                @Expect(String.fromUtf8(buf[..len]), "can")
            }
        } while (len != 0)
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.logger.level = LogLevel.TRACE
        server
            .distributor
            .register(
                "/hello",
                {
                    httpContext =>
                    let w = httpContext.responseBuilder
                    w.status(200)
                    let writer = HttpResponseWriter(httpContext)
                    var num = 5
                    while (num > 0 && !httpContext.isClosed()) {
                        num--
                        writer.write("cancan".toArray())
                        sleep(Duration.second * 1)
                    }
                }
            )
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
