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
 *       Test Cookie#toSetCookieString
 * Test API:
 *       toSetCookieString()
 */

package tests.cookie

import stdx.net.http.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class TestCookieToSetCookieString {
    @TestCase
    func cookieToSetCookieString(): Unit {
        let time1 = DateTime.of(year: 2022, month: 2, dayOfMonth: 10)
        let cookie = Cookie("0123456789", "0123456789", path: "/0123456789", domain: "", expires: time1, secure: true,
            httpOnly: true)
        let cookie1 = Cookie("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", path: "")
        let cookie2 = Cookie("abcdefghijklmnopqrstuvwxyz", "\"abcdefghijklmnopqrstuvwxyz\"",
            path: "abcdefghijklmnopqrstuvwxyz")
        let cookie3 = Cookie("!#$%&*+-.^_`|~", "!#$%&*+-.^_`|~'", path: "/!#$%&*+-.^_`|~'/", domain: "")
        let cookie4 = Cookie("!#$%&*+-.^_`|~", "()<>@:/[]?={}", path: "/\\()<>@:/[]?={}/", domain: ".xinhuanet.com",
            maxAge: 22)
        let cookie5 = Cookie("cookie5", "")
        @Expect(cookie.toSetCookieString().contains("0123456789=0123456789; Expires=Thu, 10 Feb 2022 00:00:00"))
        @Expect(cookie1.toSetCookieString(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ=ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        @Expect(cookie2.toSetCookieString(), "abcdefghijklmnopqrstuvwxyz=\"abcdefghijklmnopqrstuvwxyz\"; Path=abcdefghijklmnopqrstuvwxyz")
        @Expect(cookie3.toSetCookieString(), "!#$%&*+-.^_`|~=!#$%&*+-.^_`|~'; Path=/!#$%&*+-.^_`|~'/")
        @Expect(cookie4.toSetCookieString(), "!#$%&*+-.^_`|~=()<>@:/[]?={}; Max-Age=22; Domain=xinhuanet.com; Path=/\\()<>@:/[]?={}/")
        @Expect(cookie5.toSetCookieString(), "cookie5=")
        println("ok")
    }
}

/* SCAN-IN
ok
 */
