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
 *      test client's response.bodySize
 */

package tests.response

import stdx.net.http.*

import stdx.log.*
import asan.*

@Test
class TestClientResponseBodySize {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func clientResponseTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let buf = Array<Byte>(6, repeat: 0)
        var rsp = client.get("http://127.0.0.1:${port}/content")
        @Expect(rsp.bodySize, Some(5))
        rsp.body.read(buf)
        rsp = client.get("http://127.0.0.1:${port}/contentChunk")
        @Expect(rsp.bodySize, None)
        rsp.body.read(buf)
        rsp = client.get("http://127.0.0.1:${port}/content0")
        @Expect(rsp.bodySize, Some(0))
        client.close()
        server.close()
    }

    func startServer() {
        server.distributor.register("/content", handler1)
        server.distributor.register("/contentChunk", handler2)
        server.distributor.register("/content0", handler3)
        spawn {
            server.serve()
        }
    }

    func handler1(ctx: HttpContext): Unit {
        ctx.responseBuilder.body("hello")
    }
    func handler2(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("Transfer-Encoding", "chunked").body("hello")
    }
    func handler3(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("connection", "close")
    }
}
