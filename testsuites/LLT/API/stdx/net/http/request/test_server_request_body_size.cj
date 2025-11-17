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
 *      test server's request.bodySize
 */

package tests.request

import stdx.net.http.*

import stdx.log.*
import asan.*

@Test
class TestServerRequestBodySize {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func serverRequestBodySizeTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        var request = HttpRequestBuilder().get().url("http://127.0.0.1:${port}/content").body("hello,server").build()
        client.send(request)
        request = HttpRequestBuilder()
            .get()
            .url("http://127.0.0.1:${port}/contentChunk")
            .header("Transfer-Encoding", "chunked")
            .body("hello,server")
            .build()
        client.send(request)
        request = HttpRequestBuilder().get().url("http://127.0.0.1:${port}/content0").build()
        client.send(request)
        request = HttpRequestBuilder()
            .get()
            .url("http://127.0.0.1:${port}/expect")
            .header("expect", "100-continue")
            .header("connection", "close")
            .body("hello")
            .build()
        client.send(request)
        client.close()
        server.close()
    }

    func startServer() {
        server.distributor.register("/content", handler1)
        server.distributor.register("/contentChunk", handler2)
        server.distributor.register("/content0", handler3)
        server.distributor.register("/expect", handler4)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        let req = ctx.request
        @Expect(req.bodySize, Some(12))
    }
    func handler2(ctx: HttpContext): Unit {
        let req = ctx.request
        @Expect(req.bodySize, None)
    }
    func handler3(ctx: HttpContext): Unit {
        let req = ctx.request
        @Expect(req.bodySize, Some(0))
    }
    func handler4(ctx: HttpContext): Unit {
        let req = ctx.request
        @Expect(req.bodySize, Some(5))
        let buf = Array<Byte>(6, repeat: 0)
        req.body.read(buf)
    }
}
