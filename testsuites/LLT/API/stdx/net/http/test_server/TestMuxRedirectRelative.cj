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
 * Test description: test that the Server append "/" when no pattern
 *
 * Expect: statuscode = 200, No Location in header
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*

@Test
class TestMuxRedirectRelative {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()

    func handler(_: HttpContext): Unit {}

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
        let req = HttpRequestBuilder().method("GET").url("http://127.0.0.1:${port}").header("Host", "test").build()
        let resp = client.send(req)
        // we will append "/" in the end to redirect
        @Expect(resp.status, 200)
        @Expect(resp.headers.get("Location").isEmpty())
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}
