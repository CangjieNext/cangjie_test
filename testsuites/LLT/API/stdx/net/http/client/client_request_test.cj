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
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestClientRequest {
    var client: Client = ClientBuilder().build()
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()
    @TestCase
    func testGet(): Unit {
        startServer()
        let resp = client.get("http://127.0.0.1:${server.port}/req")
        @Assert(readBody(resp), "GET")
    }

    @TestCase
    func testPost(): Unit {
        var resp = client.post("http://127.0.0.1:${server.port}/req", "")
        @Assert(readBody(resp), "POST")
        resp = client.post("http://127.0.0.1:${server.port}/req", "".toArray())
        @Assert(readBody(resp), "POST")
    }

    @TestCase
    func testHead(): Unit {
        let resp = client.head("http://127.0.0.1:${server.port}/req")
        @Assert(readBody(resp), "")
    }

    @TestCase
    func testPut(): Unit {
        var resp = client.put("http://127.0.0.1:${server.port}/req", "")
        @Assert(readBody(resp), "PUT")
        resp = client.put("http://127.0.0.1:${server.port}/req", "".toArray())
        @Assert(readBody(resp), "PUT")
    }

    @TestCase
    func testDelete(): Unit {
        var resp = client.delete("http://127.0.0.1:${server.port}/req")
        @Assert(readBody(resp), "DELETE")
        resp = client.delete("http://127.0.0.1:${server.port}/req")
        @Assert(readBody(resp), "DELETE")
    }

    @TestCase
    func testOptions(): Unit {
        var resp = client.options("http://127.0.0.1:${server.port}")
        let allow = resp.headers.get("allow")
        @Expect(allow.size > 0)
        client.close()
        server.close()
        asanGC()
    }

    func readBody(resp: HttpResponse): String {
        let buf = Array<UInt8>(10, repeat: 0)
        let len = resp.body.read(buf)
        return String.fromUtf8(buf[..len])
    }

    func startServer(): Unit {
        server.distributor.register("/req", {
            ctx => ctx.responseBuilder.body(ctx.request.method)
        })

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
