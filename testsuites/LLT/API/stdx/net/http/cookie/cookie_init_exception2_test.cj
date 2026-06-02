/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test Cookie#init
 * Test API:
 *       init()
 */

package tests.cookie

import stdx.net.http.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class TestCookieInitException2 {
    @TestCase
    func cookieInitException2(): Unit {
        let _ = Cookie("1", "1", domain: "123456789012345678901234567890123456789012345678901234567890123.123")
        try {
            let _ = Cookie("1", "1", domain: "1234567890123456789012345678901234567890123456789012345678901234.123")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid cookie domain.")
        }
        let _ = Cookie("1", "1",
            domain: "123456789012345678901234567890123456789012345678901234567890.123456789012345678901234567890123456789012345678901234567890.123456789012345678901234567890123456789012345678901234567890.123456789012345678901234567890123456789012345678901234567890.12345678901")
        try {
            let _ = Cookie("1", "1",
                domain: "123456789012345678901234567890123456789012345678901234567890.123456789012345678901234567890123456789012345678901234567890.123456789012345678901234567890123456789012345678901234567890.123456789012345678901234567890123456789012345678901234567890.123456789012")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid cookie domain.")
        }
        println("ok")
    }
}

/* SCAN-IN
ok
 */
