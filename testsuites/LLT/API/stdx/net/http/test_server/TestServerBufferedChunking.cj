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
 * Test description: Test client will merge chunked body when handler writes many times.
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import bodyReadUtil.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServerBufferedChunking {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("transfer-encoding", "chunked")
        let writer = HttpResponseWriter(ctx)
        writer.write("x".toArray())
        writer.write("y".toArray())
        writer.write("z".toArray())
    }

    func serve() {
        server.distributor.register("/", handler)
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        var req = HttpRequestBuilder().url("http://127.0.0.1:${port}/").build()
        var resp = client.send(req)
        let respStr = readAll(1000, resp)
        @Expect(respStr.contains("xyz"), true)
        client.close()
        sleep(Duration.millisecond * 100)
        server.close()
    }
}
