/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../bodyReadUtil
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt bodyReadUtil/read.cj -o read.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f read.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *       Test class HttpResponseWriter
 *            1、Response body is correctly written after a user invokes the write function.
 *            2、Response trailers is correctly written after a user invokes the write function.
 * Test API:
 *       public func write(buf: Array<Byte>): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import bodyReadUtil.*

@Test
class TestServer11ResponseWriter {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let message = "hello"

    @TestCase
    func chunkTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        sendRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server
            .distributor
            .register(
                "/hello",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("Trailer", "hero").trailer("hero", "GG BOND")
                    httpContext.responseBuilder.header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write("hello".toArray())
                }
            )
        server
            .distributor
            .register(
                "/TEtest",
                {
                    httpContext =>
                    httpContext.responseBuilder.header("Transfer-Encoding", "chunked, default")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write("hello".toArray())
                }
            )
        server
            .distributor
            .register(
                "/headTest",
                {
                    httpContext =>
                    httpContext
                        .responseBuilder
                        .header("transfer-encoding", "chunked") // 设置response头
                        .header("Trailer", "hero")
                        .trailer("hero", "GG BOND")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write(message.toArray())
                }
            )
        server
            .distributor
            .register(
                "/emptyTE",
                {
                    httpContext =>
                    httpContext
                        .responseBuilder
                        .header("transfer-encoding", ",") // 设置response头
                        .header("Trailer", "hero")
                        .trailer("hero", "GG BOND")
                    httpContext.responseBuilder.header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(httpContext)
                    writer.write(message.toArray())
                }
            )
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = ClientBuilder().build()
        let r = HttpRequestBuilder().url("http://127.0.0.1:${port}/hello").header("Connection", "close").build()
        let real = client.send(r)

        let body = readAll(5, real)

        sleep(Duration.millisecond * 100)
        println(real)

        @Expect(body, message)

        var hero = real.trailers.getFirst("hero") ?? ""
        @Expect("GG BOND", hero)

        let u1 = "http://127.0.0.1:${port}/headTest"
        let real1 = client.head(u1)

        sleep(Duration.millisecond * 100)
        @Expect(real1.status == 200)

        let u2 = "http://127.0.0.1:${port}/emptyTE"
        let real2 = client.head(u2)

        sleep(Duration.millisecond * 100)
        var te = real2.headers.getFirst("transfer-encoding") ?? ""
        @Expect(",,chunked", te)

        let resp = client.get("http://127.0.0.1:${port}/TEtest")
        sleep(Duration.millisecond * 100)
        @Expect(resp.status, 500)

        client.close()
    }
}

/* SCAN-IN
HTTP/1.1 200 OK
 */

/* SCAN-IN
trailer: hero
 */

/* SCAN-IN
content-length: 5
 */

/* SCAN-IN
chunked should be the last value and should not be set more than once
 */
