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
 *       Test CookieJar#removeCookies
 * Test API:
 *       public func removeCookies(domain: String): Unit
 */
package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestCookieJarRemoveCookies {
    @TestCase
    func cookieJarRemoveCookies(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        let cookies2 = ArrayList<Cookie>()
        for (i in 0..2) {
            cookies.add(Cookie("${i}", "${i}"))
            cookies2.add(Cookie("_${i}", "${i}"))
        }
        for (i in 0..2) {
            cookieJar.storeCookies(URL.parse("https://example${i}.com/hello/a/b/"), cookies)
            cookieJar.storeCookies(URL.parse("https://example${i}.com/hello/a/b/c/"), cookies2)
        }

        var cookiesFromJar = cookieJar.getCookies(URL.parse("https://example0.com/hello/a/b/c"))
        println(CookieJar.toCookieString(cookiesFromJar))
        var cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example1.com/hello/a/b/c"))
        println(CookieJar.toCookieString(cookiesFromJar1))

        cookieJar.removeCookies("example0.com")

        cookiesFromJar = cookieJar.getCookies(URL.parse("https://example0.com/hello/a/b/c"))
        println(CookieJar.toCookieString(cookiesFromJar))
        cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example1.com/hello/a/b/c"))
        println(CookieJar.toCookieString(cookiesFromJar1))

        cookieJar.removeCookies("example1.com")

        cookiesFromJar = cookieJar.getCookies(URL.parse("https://example0.com/hello/a/b/c"))
        println(CookieJar.toCookieString(cookiesFromJar))
        cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example1.com/hello/a/b/c"))
        println(CookieJar.toCookieString(cookiesFromJar1))

        try {
            cookieJar.removeCookies("")
        } catch (e: IllegalArgumentException) {
            println(e.message)
        }
        println("ok")
    }
}

/* SCAN-IN
_0=0; _1=1; 0=0; 1=1
_0=0; _1=1; 0=0; 1=1

_0=0; _1=1; 0=0; 1=1


Invalid cookie domain.
ok
 */
