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
import stdx.encoding.url.*
import std.net.*
import stdx.log.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestRedirectHandlerException {
    @TestCase
    func testRedirectEx1(): Unit {
        try {
            RedirectHandler("/", 200)
        } catch (e: HttpException) {
            @Assert(e.message, "Status code should be 3xx besides 304.")
        }

        try {
            RedirectHandler("", 300)
        } catch (e: HttpException) {
            @Assert(e.message, "Redirect url cannot be empty.")
        }
    }
}
