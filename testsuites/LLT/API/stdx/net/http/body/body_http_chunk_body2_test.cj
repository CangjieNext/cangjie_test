/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      HttpChunkedBodyProvider
 * Test API:
 *      public func read(dst: Array<Byte>): Int64
 */

package tests.body

import std.net.*
import std.time.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls
import stdx.log.*
import stdx.encoding.url.*

@Test
class TestChunkedBodyProvider2 {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func testChunkedBodyProviderRead(): Unit {
        startServer()
        sleep(Duration.millisecond * 100)
        let port = server.port
        let client = ClientBuilder().readTimeout(Duration.minute * 15).build()
        client.logger.level = LogLevel.DEBUG
        let resp = client.get("http://127.0.0.1:${port}/hello")
        let buf = Array<UInt8>(500, repeat: 0)
        var len = 0
        do {
            len = resp.body.read(buf)
            if (len != 0) {
                @Expect(String.fromUtf8(buf[..len]), "hello")
            }
        } while (len != 0)
        @Expect(resp.headers.getFirst("content-length"), Some("25"))
        client.close()
        server.close()
    }

    func startServer(): Unit {
        server
            .distributor
            .register(
                "/hello",
                {
                    httpContext =>
                    let w = httpContext.responseBuilder
                    w.header("transfer-encoding", "chunked")
                    w.status(200)
                    let writer = HttpResponseWriter(httpContext)
                    var num = 5
                    while (num > 0) {
                        num--
                        writer.write("hello".toArray())
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
