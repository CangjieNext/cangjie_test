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
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test Client1_1#checkRequest1_1
 * Test API:
 *      func checkClAndTe(headers: HttpHeaders): (?Int64, Bool)
 */
package tests.client

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*
import asan.*

@Test
class TestClientChunk {
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func testChunk(): Unit {
        startServer()
        let client = ClientBuilder().build()
        let resp = client.get("http://127.0.0.1:${server.port}/chunked")
        let te = resp.headers.getFirst("transfer-encoding") ?? ""
        @Assert(te, "chunked")
        let buf = Array<UInt8>(15, repeat: 0)
        let len = resp.body.read(buf)
        @Assert(String.fromUtf8(buf[..len]), "Hello\nworld")
        println("checkClAndTe_test_ok")
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server
            .distributor
            .register(
                "/chunked",
                {
                    ctx =>
                    ctx.responseBuilder.header("transfer-encoding", "chunked")
                    let writer = HttpResponseWriter(ctx)
                    writer.write("Hello\nworld".toArray())
                }
            )
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
/* SCAN-IN
checkClAndTe_test_ok
 */
