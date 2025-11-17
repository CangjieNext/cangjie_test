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
class TestServerReadTimeout0 {
    var server: ?Server = None

    @TestCase
    func test0(): Unit {
        startServer(Duration.second)
        let port = server?.port ?? 0
        let client = ClientBuilder().noProxy().readTimeout(Duration.minute * 15).build()
        let resp = client.get("http://127.0.0.1:${port}/hello")

        let reader = resp.body

        let buf: Array<Byte> = Array<Byte>(1024, repeat: 0)
        let buffer = ArrayList<Byte>()

        try {
            while (true) {
                let num = reader.read(buf)
                if (num == 0) {
                    break
                }
                buffer.add(all: buf[..num])
            }
            @Expect(String.fromUtf8(buffer.toArray()), "hellohellohellohellohello")
            println(String.fromUtf8(buffer.toArray()))
        } catch (e: Exception) {
            e.printStackTrace()
        }

        let resp2 = client.get("http://127.0.0.1:${port}/hello2")
        let reader2 = resp2.body
        let num = reader2.read(buf)
        @Expect(String.fromUtf8(buf[..num].toArray()), "hello")
        client.close()
        server?.close()
    }

    func startServer(timeout: Duration): Unit {
        server = ServerBuilder().addr("127.0.0.1").port(0).readTimeout(timeout).build()
        server?.logger.level = LogLevel.DEBUG
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

        server?.distributor.register("/hello2", {
            httpContext => httpContext.responseBuilder.body("hello")
        })
        spawn {
            server?.serve()
        }
        sleep(Duration.second)
    }
}
