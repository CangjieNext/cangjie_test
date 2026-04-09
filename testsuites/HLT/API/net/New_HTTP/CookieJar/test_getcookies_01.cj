/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test getcookies method
 * Test API: public func getCookies(url: URL): ArrayList<Cookie>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.net.http.*
import stdx.encoding.url.*

@Test
class Test_CookieJar_GetCookies_01 {
    // host-only-flag = true,domain 需要完全匹配
    @TestCase
    func test_getcookies_01(): Unit {
        var rep = HttpRequestBuilder().build()
        var res = HttpResponseBuilder().request(rep)
        res.header("Set-Cookie", "1=1")
        res.header("Set-Cookie", "2=2; domain=")
        res.header("Set-Cookie", "3=2; domain=.")
        res.header("Set-Cookie", "4=2; domain=?!")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("http://example.test.cn/a/"), cookies)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://example.test.cn/a/"))
        @Expect(cookiesfromjar.size, 4)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("http://example.test.c/a/"))
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("http://test.cn/a/"))
        @Expect(cookiesfromjar00.size, 0)
        @Expect(cookiesfromjar01.size, 0)
    }

    // host-only-flag = false,需要请求的domain规范化后匹配cookie的domain
    @TestCase
    func test_getcookies_02(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        var cookie1 = ArrayList<Cookie>()
        cookie1.add(Cookie("1", "2", domain: "test.cn"))
        cookie1.add(Cookie("2", "2", domain: "cn"))
        cookie1.add(Cookie("3", "2", domain: "e.test.cn")) // 未存入
        cookie1.add(Cookie("4", "2", domain: ".cn"))
        cookiejar.storeCookies(URL.parse("http://example.test.cn/a/"), cookie1)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://example.test.cn/a/"))
        @Expect(cookiesfromjar.size, 3)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://example.test.cn/a/"))
        @Expect(cookiesfromjar00.size, 3)
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("http://e.test.cn/a/"))
        @Expect(cookiesfromjar01.size, 3)
        var cookiesfromjar02 = cookiejar.getCookies(URL.parse("https://est.cn/a/"))
        @Expect(cookiesfromjar02.size, 2)
        var cookiesfromjar03 = cookiejar.getCookies(URL.parse("https://cn/a/"))
        @Expect(cookiesfromjar03.size, 2)
    }

    // path匹配
    @TestCase
    func test_getcookies_03(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        var cookie1 = ArrayList<Cookie>()
        cookie1.add(Cookie("1", "2"))
        cookie1.add(Cookie("2", "2", path: "")) // /a/b
        cookie1.add(Cookie("3", "2", path: "/"))
        cookie1.add(Cookie("4", "2", path: "/a"))
        cookie1.add(Cookie("5", "2", path: "/a/"))
        cookie1.add(Cookie("6", "2", path: "/b/"))
        cookie1.add(Cookie("7", "2", path: "/a/b/"))
        cookie1.add(Cookie("8", "2", path: "/none/"))
        cookiejar.storeCookies(URL.parse("http://example.test.cn/a/b/c"), cookie1)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar.size, 6)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://example.test.cn/a"))
        @Expect(cookiesfromjar00.size, 2)
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("https://example.test.cn/none/"))
        @Expect(cookiesfromjar01.size, 2)
        var cookiesfromjar02 = cookiejar.getCookies(URL.parse("https://example.test.cn/b/"))
        @Expect(cookiesfromjar02.size, 2)
        var cookiesfromjar03 = cookiejar.getCookies(URL.parse("https://example.test.cn/a/"))
        @Expect(cookiesfromjar03.size, 3)
        var cookiesfromjar04 = cookiejar.getCookies(URL.parse("https://example.test.cn/a/b"))
        @Expect(cookiesfromjar04.size, 5)
        var cookiesfromjar05 = cookiejar.getCookies(URL.parse("https://example.test.cn/a/b/"))
        @Expect(cookiesfromjar05.size, 6)
    }

    // secure匹配
    @TestCase
    func test_getcookies_04(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        var cookie1 = ArrayList<Cookie>()
        cookie1.add(Cookie("1", "2"))
        cookie1.add(Cookie("2", "2", secure: false))
        cookie1.add(Cookie("3", "2", secure: true))
        // 存储无限制
        cookiejar.storeCookies(URL.parse("http://example.test.cn/a/b/c"), cookie1)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar.size, 2)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar00.size, 2)
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("wss://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar01.size, 0)

        var cookiejar1 = CookieJar.createDefaultCookieJar(ArrayList<String>(), false)
        cookiejar1.storeCookies(URL.parse("wss://example.test.cn/a/b/c"), cookie1)
        var cookiesfromjar03 = cookiejar1.getCookies(URL.parse("wss://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar03.size, 3)
        var cookiesfromjar04 = cookiejar1.getCookies(URL.parse("https://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar04.size, 0)
    }

    // 过期cookie无法取出
    @TestCase
    func test_getcookies_05(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        var cookie1 = ArrayList<Cookie>()
        cookie1.add(Cookie("1", "2", expires: DateTime.nowUTC()))
        cookie1.add(Cookie("2", "2", maxAge: 1))

        // 存储无限制
        cookiejar.storeCookies(URL.parse("http://example.test.cn/a/b/c"), cookie1)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar.size, 1)
        sleep(Duration.second)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("http://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar00.size, 0)
    }

    // cookie取出时的排序规则：
    // 路径长者优先；等长时，早创建者优先
    @TestCase
    func test_getcookies_06(): Unit {
        var rep = HttpRequestBuilder().build()
        var res = HttpResponseBuilder().request(rep)
        res.header("Set-Cookie", "1=1; path=/")
        res.header("Set-Cookie", "2=2; path=/a")
        res.header("Set-Cookie", "3=3; path=/a/")
        res.header("Set-Cookie", "4=4; path=/a/b/c")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://example.test.cn/a/b/c"), cookies)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("https://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar.size, 4)
        @Expect(CookieJar.toCookieString(cookiesfromjar), "4=4; 3=3; 2=2; 1=1")

        var cookie0 = ArrayList<Cookie>([Cookie("55", "66", path: "/a/")])
        cookiejar.storeCookies(URL.parse("https://example.test.cn/a/b/c"), cookie0)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://example.test.cn/a/b/c"))
        @Expect(cookiesfromjar00.size, 5)
        @Expect(CookieJar.toCookieString(cookiesfromjar00), "4=4; 3=3; 55=66; 2=2; 1=1")
    }
}
