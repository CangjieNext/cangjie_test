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
package tests.client

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestClientClose {
    var client = ClientBuilder().build()

    @TestCase
    func testException(): Unit {
        client = ClientBuilder().build()
        client.close()
        try {
            client.get("http://127.0.0.1:80")
        } catch (e: HttpException) {
            @Expect(e.message.contains("This client has already closed."))
        }
    }
}
