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
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import std.sync.*
import stdx.log.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestDistributor {
    let server = ServerBuilder().addr("127.0.0.1").port(0).distributor(MyDistributor()).build()

    @TestCase
    func testNotfound(): Unit {
        spawn {
            server.serve()
        }
        sleep(Duration.second)
        let client = ClientBuilder().build()
        let response = client.get("http://127.0.0.1:${server.port}/notfound")
        @Assert(response.status, UInt16(200))
        var buf = Array<UInt8>(15, repeat: 0)
        var len = response.body.read(buf)
        @Assert("my distributor", String.fromUtf8(buf[0..len]))
        client.close()
        server.close()
        asanGC()
    }
}

class MyDistributor <: HttpRequestDistributor {
    public func register(path: String, handler: HttpRequestHandler): Unit {
        ()
    }

    public func register(path: String, handler: (HttpContext) -> Unit): Unit {
        register(path, FuncHandler(handler))
    }

    public func distribute(path: String): HttpRequestHandler {
        FuncHandler({
            ctx => ctx.responseBuilder.body("my distributor")
        })
    }
}
