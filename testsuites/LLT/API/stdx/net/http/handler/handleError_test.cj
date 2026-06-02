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
 * Test description:
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestHandleError {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    func startServe() {
        spawn {
            server.distributor.register("/a", {ctx => handleError(ctx, 499)})
            server.serve()
        }
    }

    @TestCase
    func testHandleError(): Unit {
        startServe()
        sleep(Duration.second)
        let client = ClientBuilder().autoRedirect(false).build()
        let response = client.get("http://127.0.0.1:${server.port}/a")
        @Expect(response.toString().contains("HTTP/1.1 499"))
        let buf = Array<UInt8>(500, repeat: 0)
        let i = response.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "499 ")
        client.close()
        server.close()
    }
}
