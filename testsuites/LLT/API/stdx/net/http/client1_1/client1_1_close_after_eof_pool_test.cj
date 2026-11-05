/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      MC-4: when a response body is fully consumed (read to EOF), the H1
 *      connection is returned to the engine idle pool. A subsequent close()
 *      on the response must NOT close that pooled connection. The next
 *      request (non-idempotent POST, which is never transparently retried)
 *      must succeed on the pooled keep-alive connection instead of failing
 *      with "Socket is already closed".
 * Test API:
 *      public func send(request: HttpRequest): HttpResponse
 *      public func close(): Unit (HttpResponse body Resource)
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import stdx.log.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestClient1_1CloseAfterEofPool {
    // ---- normal (Content-Length) response body ----
    @TestCase
    func normalBodyCloseAfterEofKeepsConnPooled(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).logger(NoopLogger()).build()
        server.distributor.register("a", { ctx =>
            if (ctx.request.method == "GET") {
                ctx.responseBuilder.status(200).body("hello")
            } else {
                ctx.responseBuilder.status(200).body("post-ok")
            }
        })
        let fut = spawn { server.serve() }
        sleep(Duration.millisecond * 500)
        let client = ClientBuilder().build()
        let u = URL.parse("http://127.0.0.1:${server.port}/a")
        let buf = Array<Byte>(256, repeat: 0)

        // GET: consume the body to EOF, then close (documented idiom)
        let resp1 = client.send(HttpRequestBuilder().url(u).version(HTTP1_1).build())
        let body1 = StringBuilder()
        while (true) {
            let n = resp1.body.read(buf)
            if (n == 0) {
                break
            }
            body1.append(String.fromUtf8(buf[..n]))
        }
        resp1.close()
        @Expect(body1.toString(), "hello")

        // POST is non-idempotent: no transparent reconnect on failure;
        // it must reuse the pooled keep-alive connection
        let resp2 = client.send(HttpRequestBuilder().url(u).version(HTTP1_1).method("POST").body("abc").build())
        @Expect(resp2.status == 200, true)
        let n2 = resp2.body.read(buf)
        @Expect(String.fromUtf8(buf[..n2]), "post-ok")
        resp2.close()

        client.close()
        server.close()
        fut.get()
        println("normal_body_ok")
        asanGC()
    }

    // ---- chunked response body ----
    @TestCase
    func chunkedBodyCloseAfterEofKeepsConnPooled(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).logger(NoopLogger()).build()
        server.distributor.register("a", { ctx =>
            if (ctx.request.method == "GET") {
                // no content-length: the server writes the body with chunked encoding
                ctx.responseBuilder.status(200).header("transfer-encoding", "chunked").body("hello")
            } else {
                ctx.responseBuilder.status(200).body("post-ok")
            }
        })
        let fut = spawn { server.serve() }
        sleep(Duration.millisecond * 500)
        let client = ClientBuilder().build()
        let u = URL.parse("http://127.0.0.1:${server.port}/a")
        let buf = Array<Byte>(256, repeat: 0)

        // GET with chunked body: read to EOF (last chunk returns the conn
        // to the pool), then close
        let resp1 = client.send(HttpRequestBuilder().url(u).version(HTTP1_1).build())
        let body1 = StringBuilder()
        while (true) {
            let n = resp1.body.read(buf)
            if (n == 0) {
                break
            }
            body1.append(String.fromUtf8(buf[..n]))
        }
        resp1.close()
        @Expect(body1.toString(), "hello")

        // POST must reuse the pooled connection
        let resp2 = client.send(HttpRequestBuilder().url(u).version(HTTP1_1).method("POST").body("abc").build())
        @Expect(resp2.status == 200, true)
        let n2 = resp2.body.read(buf)
        @Expect(String.fromUtf8(buf[..n2]), "post-ok")
        resp2.close()

        client.close()
        server.close()
        fut.get()
        println("chunked_body_ok")
        asanGC()
    }
}

/* SCAN-IN
normal_body_ok
chunked_body_ok
 */
