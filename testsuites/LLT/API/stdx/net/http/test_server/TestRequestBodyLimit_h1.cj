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
 * Test description: test server will respond 413 to client when request body exceeds limit
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestRequestBodyLimit_h1 {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).maxRequestBodySize(1000).build()

    func client(): HttpResponse {
        let client = ClientBuilder().build()
        var req = HttpRequestBuilder().post().body("a" * (1001)).url("http://127.0.0.1:${port}/").build()
        var res = client.send(req)
        sleep(Duration.millisecond * 100)
        client.close()
        return res
    }

    func serve() {
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        var resp = client()
        @Expect(resp.status, 413)
        server.close()
    }
}
