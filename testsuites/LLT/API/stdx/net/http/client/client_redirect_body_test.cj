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
 * Test description: redirect 3xx response when request have body
 * Test API:
 */
package tests.client

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.io.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestClientRedirect2 {
    var client: Client = ClientBuilder().build()
    var server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func testRedirect(): Unit {
        startServer()
        let req = HttpRequestBuilder()
            .url("http://127.0.0.1:${server.port}/hd")
            .header("transfer-encoding", "chunked")
            .body(MyBody())
            .build()
        let resp = client.send(req)
        @Assert(resp.status, 200)
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server
            .distributor
            .register(
                "/",
                {
                    ctx =>
                    let buf = Array<UInt8>(10, repeat: 0)
                    var len = ctx.request.body.read(buf)
                    @Assert(len, 0) // Requests redirected to GET should not include a body
                }
            )
        server.distributor.register("/hd", RedirectHandler("/", 308))

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}

class MyBody <: InputStream {
    var data = "hello".toArray()
    var index = 0
    public func read(buf: Array<UInt8>): Int64 {
        if (index > data.size - 1) {
            return 0
        }
        buf[0] = data[index]
        index++
        return 1
    }
}
