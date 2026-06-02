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
 *            cookies with the same name can be deleted correctly
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
class TestCookieJarStoreCookiesSameName {
    @TestCase
    func cookieJarStoreCookiesSameName(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        for (i in 0..2999) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        cookies.add(Cookie("0", "_0"))
        cookies.add(Cookie("3000", "3000"))
        @Expect(cookies.size, 3001)
        cookieJar.storeCookies(URL.parse("https://example.com/hello/a"), cookies)
        let cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example.com/hello/a"))

        @Expect(CookieJar.toCookieString(cookiesFromJar1).split(";").size == 3000 )

        let cookieJar2 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies2 = ArrayList<Cookie>()
        for (i in 0..2999) {
            cookies2.add(Cookie("${i}", "${i}"))
        }
        cookies2.add(Cookie("_0", "_0")) // the deffrence is here
        cookies2.add(Cookie("3000", "3000"))
        @Expect(cookies2.size, 3001)
        cookieJar2.storeCookies(URL.parse("https://example.com/hello/a"), cookies2)
        let cookiesFromJar2 = cookieJar2.getCookies(URL.parse("https://example.com/hello/a"))

        @Expect(CookieJar.toCookieString(cookiesFromJar2).split(";").size == 51)

        println("ok")
    }
}

/* SCAN-IN
ok
 */
