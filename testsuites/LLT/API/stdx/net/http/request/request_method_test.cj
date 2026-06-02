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
 *       Test HttpRequestBuilder
 * Test API:
 */

package tests.request

import std.collection.*
import stdx.net.http.*

@Test
class TestMethod {
    @TestCase
    func methodInvalid(): Unit {
        try {
            let _ = HttpRequestBuilder().method("你好").build()
        } catch (e: HttpException) {
            @Assert(e.toString(), "HttpException: Method should be tokens.")
        }
    }

    @TestCase
    func defaultMethod(): Unit {
        let request = HttpRequestBuilder().method("").build()
        @Assert(request.method, "GET")
    }
}
