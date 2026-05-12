/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test clear method
 * Test API: public func clear(): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.collection.*
import std.sync.*
import std.time.*
import stdx.encoding.url.*

@Test
class Test_CookieJar_Clear_01 {
    @TestCase
    func test_01(): Unit {
        var cookie1 = Cookie("name", "value")
        var cookie2 = Cookie("12", "34", maxAge: 1)
        var cookie3 = Cookie("AC", "BD", secure: true)
        var cookie4 = Cookie("Ac", "BD", httpOnly: false)
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["cn", "com"]), false)
        var cookies = ArrayList<Cookie>([cookie1, cookie2, cookie3, cookie4])
        cookiejar.storeCookies(URL.parse("wss://test.org/a"), cookies)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("wss://test.org/a"))
        @Expect(cookiesfromjar.size, 4)

        cookiejar.clear()

        var cookiesfromjar_01 = cookiejar.getCookies(URL.parse("wss://test.org/a"))
        @Expect(cookiesfromjar_01.size, 0)
    }

    @TestCase
    func test_02(): Unit {
        var cookies = ArrayList<Cookie>()
        for (i in 0..3000) {
            cookies.add(Cookie("${i}", "qww"))
        }
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        cookiejar.storeCookies(URL.parse("http://test.org/a"), cookies)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://test.org/a"))
        @Expect(cookiesfromjar.size, 3000)

        cookiejar.clear()

        var cookiesfromjar_01 = cookiejar.getCookies(URL.parse("http://test.org/a"))
        @Expect(cookiesfromjar_01.size, 0)
    }
}
