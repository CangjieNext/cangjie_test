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
 *       Test CookieJar#getCookies
 * Test API:
 *       public func getCookies(url: URL): ArrayList<Cookie>
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
class TestCookieJarGetCookies4 {
    @TestCase
    func cookieJarGetCookiesIsHttpFalse(): Unit {

        // no http
        let cookie1 = Cookie("1", "1", domain: "example.com")
        let cookie2 = Cookie("2", "2", domain: "foo.example.com")
        let cookie3 = Cookie("3", "3")

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let resultCookies = ArrayList<Cookie>([cookie1, cookie2, cookie3])
        cookieJar.storeCookies(URL.parse("http://foo.example.com/hello/a/b"), resultCookies)
        let cookies = cookieJar.getCookies(URL.parse("ws://foo.example.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookies).isEmpty())

        let cookieJar2 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), false)
        cookieJar2.storeCookies(URL.parse("ws://foo.example.com/hello/a/b"), resultCookies)
        let cookies2 = cookieJar2.getCookies(URL.parse("ws://foo.example.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookies2), "1=1; 2=2; 3=3")
        let cookies3 = cookieJar2.getCookies(URL.parse("http://foo.example.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookies3).isEmpty())
    }

    @TestCase
    func cookieJarGetCookiesExpired(): Unit {

        // expired
        let cookie1 = Cookie("1", "1", maxAge: 1)
        let cookie2 = Cookie("2", "2", maxAge: 2)

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let resultCookies = ArrayList<Cookie>([cookie1, cookie2])
        cookieJar.storeCookies(URL.parse("http://foo.example.com/hello/a/b"), resultCookies)

        // not expired
        var cookies = cookieJar.getCookies(URL.parse("https://foo.example.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookies), "1=1; 2=2")

        // expired
        sleep(Duration.second)
        cookies = cookieJar.getCookies(URL.parse("https://foo.example.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookies), "2=2")
    }

    @TestCase
    func cookieJarGetCookiesSort(): Unit {
        let cookie1 = Cookie("1", "1", path: "/hello")
        let cookie2 = Cookie("2", "2", path: "/hello/a/")
        let cookie3 = Cookie("3", "3", path: "/hello/a")
        let cookie4 = Cookie("4", "4", path: "/hello/a/")
        let resultCookies = ArrayList<Cookie>([cookie1, cookie2, cookie3, cookie4])

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        cookieJar.storeCookies(URL.parse("http://foo.example.com/hello/a/b"), resultCookies)

        var cookies = cookieJar.getCookies(URL.parse("https://foo.example.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookies), "2=2; 4=4; 3=3; 1=1")
        println("ok")
    }
}

/* SCAN-IN
ok
 */
