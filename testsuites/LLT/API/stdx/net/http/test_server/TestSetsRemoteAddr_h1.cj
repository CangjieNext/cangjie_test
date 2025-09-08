/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description: Test server will give remote addresses to clients
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestSetsRemoteAddr_h1 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(ctx: HttpContext): Unit {
        ctx.responseBuilder.body(ctx.request.remoteAddr)
    }

    func serve() {
        server.distributor.register("/index", handler)
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
        let req = HttpRequestBuilder().url("http://127.0.0.1:${port}/index").build()
        let resp = client.send(req)
        sleep(Duration.second)
        let buf = Array<UInt8>(100, repeat: 0)
        let len = resp.body.read(buf)
        let remoteAddr = String.fromUtf8(buf.slice(0, len))
        @Expect(remoteAddr.contains("127.0.0.1"))
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
