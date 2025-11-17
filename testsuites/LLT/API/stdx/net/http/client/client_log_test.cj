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
 * Test description: test client logger print
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import stdx.log.*
import std.net.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestClientLog {
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func testLog(): Unit {
        startServer()
        sleep(Duration.second)
        var client = ClientBuilder().build()
        client.logger.level = LogLevel.TRACE
        let resp = client.get("http://127.0.0.1:${server.port}/")
        @Assert(resp.status, 200)
        client.close()
        server.close()
        asanGC()
    }

    func startServer() {
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("hello")
        })
        spawn {
            server.serve()
        }
    }
}
/* SCAN-IN
Using HTTP/1.1 client
 */
