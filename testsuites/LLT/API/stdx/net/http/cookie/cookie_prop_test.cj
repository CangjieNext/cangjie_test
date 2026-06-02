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
 *       Test Cookie#prop
 * Test API:
 *       prop
 */
package tests.cookie

import stdx.net.http.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class TestCookieProp {
    @TestCase
    func cookieProp(): Unit {
        let time1 = DateTime.of(year: 2022, month: 2, dayOfMonth: 10)
        let cookie = Cookie("0123456789", "0123456789", path: "/0123456789", domain: ".hua.com", expires: time1,
            maxAge: 22, secure: true)
        @Expect(cookie.cookieName, "0123456789")
        @Expect(cookie.cookieValue, "0123456789")
        @Expect(cookie.expires.getOrThrow().format(DateTimeFormat.RFC1123).contains("Thu, 10 Feb 2022 00:00:00"))
        @Expect(cookie.maxAge.getOrThrow(), 22)
        @Expect(cookie.domain, ".hua.com")
        @Expect(cookie.path, "/0123456789")
        @Expect(cookie.secure, true)
        @Expect(cookie.httpOnly, false)
        println("ok")
    }
}

/* SCAN-IN
ok
 */
