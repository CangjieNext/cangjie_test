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
 *       Test Cookie#httpOnly
 * Test API:
 *       public func getCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 */

package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestCookieHttpOnly {
    @TestCase
    func cookieHttpOnly(): Unit {
        let requestUrl = URL.parse("ws://foo.example.com/hello/a/b")
        let requestUrl2 = URL.parse("http://foo.example.com/hello/a/b")
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), false)
        let cookieJar2 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), false)
        let cookie1 = Cookie("1", "1", httpOnly: true)
        let cookie2 = Cookie("2", "2")
        let cookies = ArrayList<Cookie>([cookie1, cookie2])
        cookieJar.storeCookies(requestUrl, cookies)
        cookieJar2.storeCookies(requestUrl2, cookies)

        let cookiesFromJar = cookieJar.getCookies(URL.parse("ws://foo.example.com/hello/a/b"))
        let cookiesFromJar2 = cookieJar.getCookies(URL.parse("http://foo.example.com/hello/a/b"))
        let cookiesFromJar3 = cookieJar.getCookies(URL.parse("w://foo.example.com/hello/a/b"))
        println(CookieJar.toCookieString(cookiesFromJar))
        println(CookieJar.toCookieString(cookiesFromJar2))
        println(CookieJar.toCookieString(cookiesFromJar3))

        let cookiesFromJar4 = cookieJar2.getCookies(URL.parse("ws://foo.example.com/hello/a/b"))
        let cookiesFromJar5 = cookieJar2.getCookies(URL.parse("http://foo.example.com/hello/a/b"))
        let cookiesFromJar6 = cookieJar2.getCookies(URL.parse("w://foo.example.com/hello/a/b"))
        println(CookieJar.toCookieString(cookiesFromJar4))
        println(CookieJar.toCookieString(cookiesFromJar5))
        println(CookieJar.toCookieString(cookiesFromJar6))
        println("ok")
    }
}

/* SCAN-IN
2=2

2=2



ok
 */
