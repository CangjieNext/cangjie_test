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
 *      Test Client1_1#close
 * Test API:
 *      public func close()
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestClient1_1Host {
    @TestCase
    func client1_1ReceiveChunkedBody(): Unit {
        let server = ServerBuilder().addr("0.0.0.0").port(0).build()
        server
            .distributor
            .register(
                "/",
                {
                    ctx =>
                    let req = ctx.request
                    let host = req.headers.getFirst("host") ?? ""
                    println(req)
                    @Assert(host, "www.example.com")
                }
            )
        spawn {server.serve()}
        sleep(Duration.second)

        let client = ClientBuilder().build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/").header("host", "www.example.com").build()
        let rsp = client.send(req)
        println(rsp)
        @Assert(rsp.status, 200)
        client.close()
        server.close()
        asanGC()
    }
}
