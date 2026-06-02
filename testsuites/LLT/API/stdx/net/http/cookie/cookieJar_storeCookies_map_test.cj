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

@Test
class TestCookieJarStoreCookiesMap {
    @TestCase
    func cookieJarStoreCookiesMap(): Unit {

        // maps
        let cookie1 = Cookie("1", "1")
        let cookie2 = Cookie("2", "2")
        let cookie3 = Cookie("1", "3")
        let cookie4 = Cookie("4", "4", path: "/hello")

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let resultCookies = ArrayList<Cookie>([cookie1, cookie2, cookie3, cookie4])
        cookieJar.storeCookies(URL.parse("http://foo.example.com/hello/a/b"), resultCookies)
        let cookies = cookieJar.getCookies(URL.parse("http://foo.example.com/hello/a/b"))
        @Expect(CookieJar.toCookieString(cookies), "1=3; 2=2; 4=4")
        println("ok")
    }
}

/* SCAN-IN
ok
 */
