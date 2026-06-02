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
 *       Test CookieJar#removeExcessCookies
 * Test API:
 *       public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 */
package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestCookieJarRemoveExcessCookies2 {
    @TestCase
    func cookieJarRemoveExcessCookies2(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        let cookies2 = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        for (i in 1..60) {
            cookieJar.storeCookies(URL.parse("https://example${i}.com/hello/a/b/"), cookies)
        }
        for (i in 0..50) {
            cookies2.add(Cookie("21_${i}", "${i}"))
        }
        cookieJar.storeCookies(URL.parse("https://example21.com/hello/a/"), cookies2)

        var cookiesFromJar21 = cookieJar.getCookies(URL.parse("https://example21.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookiesFromJar21).split(";").size == 100)

        let cookie4 = Cookie("wow", "wow")
        cookieJar.storeCookies(URL.parse("https://example100.com/hello/a/"), ArrayList<Cookie>([cookie4]))

        var cookiesFromJar19 = cookieJar.getCookies(URL.parse("https://example19.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookiesFromJar19).isEmpty())
        cookiesFromJar21 = cookieJar.getCookies(URL.parse("https://example21.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookiesFromJar21).split(";").size == 50)

        println("ok")
    }
}

/* SCAN-IN
ok
 */
