/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test removecookies method
 * Test API: public func removeCookies(domain: String): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*
import stdx.encoding.url.*

@Test
class Test_CookieJar_RemoveCookies_01 {
    // domain 入参不合法
    @TestCase
    func test_removecookies_01(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        try {
            cookiejar.removeCookies("")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {}
        try {
            cookiejar.removeCookies(".com")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {}
        try {
            cookiejar.removeCookies("..cn")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {}
        var str = String(Array<Rune>(63, repeat: r'a'))
        cookiejar.removeCookies(str)
        try {
            cookiejar.removeCookies(str + "b")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {}
        var label60 = String(Array<Rune>(60, repeat: r'a'))
        var domain256 = label60 + "." + label60 + "." + label60 + "." + label60 + ".123456789123"
        try {
            cookiejar.removeCookies(domain256)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {}
        try {
            cookiejar.removeCookies("仓颉")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {}
    }

    // 测试domain的删除功能正确运行
    @TestCase
    func test_removecookies_02(): Unit {
        var cookies = ArrayList<Cookie>()
        for (i in 0..100) {
            cookies.add(Cookie("${i}", "123", domain: "com"))
        }
        cookies.add(Cookie("100", "100", domain: "org.com"))
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["org", ".com"]), false)
        cookiejar.storeCookies(URL.parse("wss://example.org.com/a"), cookies)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("wss://example.org.com/a"))
        @Expect(cookiesfromjar.size, 101)
        cookiejar.removeCookies("com")
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("wss://example.org.com/a"))
        @Expect(cookiesfromjar00.size, 1)
        cookiejar.removeCookies("example.org.com")
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("wss://example.org.com/a"))
        @Expect(cookiesfromjar01.size, 1)
        cookiejar.removeCookies("org.com")
        var cookiesfromjar02 = cookiejar.getCookies(URL.parse("wss://example.org.com/a"))
        @Expect(cookiesfromjar02.size, 0)
    }
}
