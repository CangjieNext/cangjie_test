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
 *       Test CookieJar#storeCookies
 * Test API:
 *       public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 */
package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

@Test
class TestCookieJarStoreCookies2 {
    @TestCase
    func cookieJarStoreCookiesMaxAgeExpiresDomain(): Unit {

        // maxAge and expires
        let cookie1 = Cookie("1", "1", maxAge: 1)
        let cookie2 = Cookie("2", "2", maxAge: 2)
        let cookie3 = Cookie("3", "3", expires: DateTime.nowUTC())
        let cookie4 = Cookie("4", "4", expires: DateTime.ofUTC(year: 3000, month: Month.of(12), dayOfMonth: 19))
        let cookie5 = Cookie("5", "5")

        // domain
        let cookie6 = Cookie("6", "6", domain: ".example.com")
        let cookie7 = Cookie("7", "7", domain: "com")

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let resultCookies = ArrayList<Cookie>([cookie1, cookie2, cookie3, cookie4, cookie5, cookie6, cookie7])
        cookieJar.storeCookies(URL.parse("http://foo.example.com/hello/a"), resultCookies)
        let cookies = cookieJar.getCookies(URL.parse("http://foo.example.com/hello/a"))
        @Expect(CookieJar.toCookieString(cookies), "1=1; 2=2; 4=4; 5=5; 6=6")

        let cookieJar2 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        cookieJar2.storeCookies(URL.parse("http://com/hello/a"), resultCookies)
        let cookies2 = cookieJar2.getCookies(URL.parse("http://com/hello/a"))
        @Expect(CookieJar.toCookieString(cookies2), "1=1; 2=2; 4=4; 5=5; 7=7")
        sleep(Duration.second)
        let cookies3 = cookieJar2.getCookies(URL.parse("http://com/hello/a"))
        @Expect(CookieJar.toCookieString(cookies3), "2=2; 4=4; 5=5; 7=7")
    }

    @TestCase
    func cookieJarStoreCookiesPathSecureOnlyHttpOnly(): Unit {

        // path
        let cookie1 = Cookie("1", "1", path: "/hello/a/b")
        let cookie2 = Cookie("2", "2", path: "c")

        // secure
        let cookie3 = Cookie("3", "3", secure: true)

        // httpOnly
        let cookie4 = Cookie("4", "4", httpOnly: true)

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let resultCookies = ArrayList<Cookie>([cookie1, cookie2, cookie3, cookie4])
        cookieJar.storeCookies(URL.parse("http://foo.example.com/hello/a/b/c"), resultCookies)
        let cookies = cookieJar.getCookies(URL.parse("http://foo.example.com/hello/a/b/c"))
        @Expect(CookieJar.toCookieString(cookies), "1=1; 2=2; 4=4")

        cookieJar.storeCookies(URL.parse("ws://foo.example.com/hello/a/b/c"), resultCookies)
        let cookies2 = cookieJar.getCookies(URL.parse("ws://foo.example.com/hello/a/b/c"))
        @Expect(CookieJar.toCookieString(cookies2), "")

        let cookieJar2 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), false)
        cookieJar2.storeCookies(URL.parse("wss://foo.example.com/hello/a/b/c"), resultCookies)
        let cookies3 = cookieJar2.getCookies(URL.parse("wss://foo.example.com/hello/a/b/c"))
        @Expect(CookieJar.toCookieString(cookies3), "1=1; 2=2; 3=3")
        println("ok")
    }
}

/* SCAN-IN
ok
 */
