/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test toCookieString method
 * Test API: public static func toCookieString(cookies: ArrayList<Cookie>): String
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.net.http.*
import stdx.encoding.url.*

@Test
class Test_CookieJar_ToCookieString_01 {
    @TestCase
    func test_01(): Unit {
        var cookies = ArrayList<Cookie>()
        for (i in 0..5000) {
            cookies.add(Cookie("${i}", "${i}", maxAge: 1))
        }

        @Expect(cookies.size, 5000)
        @Expect(CookieJar.toCookieString(cookies).contains("4999=4999"), true)

        @Expect(cookies.size, 5000)
        @Expect(CookieJar.toCookieString(cookies).contains("0=0"), true)
    }
}
