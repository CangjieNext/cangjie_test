/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class HttpRequestBuilder
 *          Test HttpRequestBuilder Init
 * Test API:
 *       public init(request: HttpRequest)
 */

package tests.request

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls

import std.collection.ArrayList
import asan.*

@Test
class TestHttpRequestBuilderInit {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func requestBuilderInitTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        let request = HttpRequestBuilder()
            .get()
            .header("request", "r1")
            .header("trailer", "t")
            .header("transfer-encoding", "chunked")
            .url("http://127.0.0.1:${port}/content")
            .trailer("t", "t1")
            .body("hello,server")
            .build()
        client.send(request)
        client.close()
        server.close()
    }

    func startServer() {
        server.distributor.register("/content", handler1)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        let req = ctx.request
        var newRequest = HttpRequestBuilder(req).build()
        @Expect(req.bodySize, newRequest.bodySize)
        let buf = Array<Byte>(6, repeat: 0)
        var i = req.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello,")
        i = newRequest.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "server")
        i = req.body.read(buf) // read to end
        @Expect(i, 0)
        // copy again to copy trailers
        newRequest = HttpRequestBuilder(req).build()
        req.headers.add("h", "h")
        req.headers.add("request", "r2")
        req.trailers.add("t", "t2")
        let req1 = req.toString()
        let req2 = newRequest.toString()
        println("req1:")
        println(req1)
        println("req2:")
        println(req2)
        @Expect(req1.contains("request: r1,r2\r\ntrailer: t\r\nh: h\r\n"))
        @Expect(req1.contains("t: t1,t2\r\n"))
        @Expect(req2.contains("request: r1\r\ntrailer: t\r\n"))
        @Expect(req2.contains("t: t1\r\n"))
        @Expect(req.remoteAddr, newRequest.remoteAddr)
        @Expect(req.method, newRequest.method)
        @Expect(req.url.toString(), newRequest.url.toString())
        @Expect(req.version, newRequest.version)
        @Expect(req.bodySize, newRequest.bodySize)
        @Expect(req.form.toEncodeString(), newRequest.form.toEncodeString())
        @Expect(req.close, newRequest.close)
        @Expect(req.readTimeout, newRequest.readTimeout)
        @Expect(req.writeTimeout, newRequest.writeTimeout)
    }
}
