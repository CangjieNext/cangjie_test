/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

package tests.server1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*
import std.collection.*

@Test
class TestServerReadTimeoutExpect0 {
    var server: ?Server = None

    @TestCase
    func test0(): Unit {
        startServer(Duration.second * 1)
        let port = server?.port ?? 0
        let client = TcpSocket("127.0.0.1", port)
        client.connect()
        client.write(
            "GET /hello HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nExpect: 100-continue\r\nContent-Length: 0\r\n\r\n"
                .toArray())

        let buf: Array<Byte> = Array<Byte>(1024, repeat: 0)

        sleep(Duration.second * 7)
        let i = client.read(buf)

        // only one response
        @Expect(String.fromUtf8(buf[..i]).lastIndexOf("HTTP").getOrThrow(), 0)
        @Expect(String.fromUtf8(buf[..i]).contains("5\r\nhello\r\n5\r\nhello\r\n5\r\nhello\r\n5\r\nhello\r\n5\r\nhello\r\n0\r\n"))

        client.close()
        server?.close()
    }

    func startServer(timeout: Duration): Unit {
        server = ServerBuilder().addr("127.0.0.1").port(0).readTimeout(timeout).build()
        server?.logger.level = LogLevel.TRACE
        server?
            .distributor
            .register(
                "/hello",
                {
                    httpContext =>
                    let w = httpContext.responseBuilder
                    w.header("Transfer-Encoding", "chunked")
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
            server?.serve()
        }
        sleep(Duration.second)
    }
}
