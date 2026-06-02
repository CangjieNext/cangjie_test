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
 *       public func getCookies(url: URL, cookies: ArrayList<Cookie>): Unit
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
class TestCookieJarGetCookiesExpired {
    @TestCase
    func cookieJarGetCookiesExpired(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        for (i in 1..3) {
            cookies.add(Cookie("a${i}", "${i}", maxAge: 1))
        }
        cookieJar.storeCookies(URL.parse("https://example.com/hello/a/"), cookies)
        let cookies2 = ArrayList<Cookie>()
        for (i in 1..3) {
            cookies2.add(Cookie("ab${i}", "${i}", maxAge: 2))
        }
        cookieJar.storeCookies(URL.parse("https://example.com/hello/a/b/"), cookies2)
        let cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example.com/hello/a"))
        println(CookieJar.toCookieString(cookiesFromJar1))
        let cookiesFromJar2 = cookieJar.getCookies(URL.parse("https://example.com/hello/a/b"))
        println(CookieJar.toCookieString(cookiesFromJar2))
        sleep(Duration.second)
        let cookiesFromJar1Expired = cookieJar.getCookies(URL.parse("https://example.com/hello/a/b"))
        println(CookieJar.toCookieString(cookiesFromJar1Expired))
        sleep(Duration.second)
        let cookiesFromJar2Expired = cookieJar.getCookies(URL.parse("https://example.com/hello/a/b"))
        println(CookieJar.toCookieString(cookiesFromJar2Expired))
        println("ok")
    }
}

/* SCAN-IN
a1=1; a2=2
ab1=1; ab2=2; a1=1; a2=2
ab1=1; ab2=2

ok
 */
