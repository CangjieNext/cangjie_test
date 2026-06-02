/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test that secure cookies are rejected from non-https origins per RFC 6265bis Section 5.4
 * Test API:
 *       public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 *       public func getCookies(url: URL): ArrayList<Cookie>
 */
package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestCookieJarSecureScheme {
    @BeforeAll
    func setup() {
        asanGC()
    }

    @AfterAll
    func cleanup() {
        asanGC()
    }

    @TestCase
    func secureCookieRejectedFromHttp(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let secureCookie = Cookie("secure_cookie", "value1", secure: true)
        let normalCookie = Cookie("normal_cookie", "value2", secure: false)
        let cookies = ArrayList<Cookie>()
        cookies.add(secureCookie)
        cookies.add(normalCookie)

        cookieJar.storeCookies(URL.parse("http://example.com/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://example.com/path"))
        @Assert(retrievedCookies.size, 1)
        @Expect(retrievedCookies[0].cookieName == "normal_cookie")
        println("secure_cookie_rejected_from_http ok")
    }

    @TestCase
    func secureCookieAcceptedFromHttps(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let secureCookie = Cookie("secure_cookie", "value1", secure: true)
        let normalCookie = Cookie("normal_cookie", "value2", secure: false)
        let cookies = ArrayList<Cookie>()
        cookies.add(secureCookie)
        cookies.add(normalCookie)

        cookieJar.storeCookies(URL.parse("https://example.com/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("https://example.com/path"))
        @Assert(retrievedCookies.size, 2)
        println("secure_cookie_accepted_from_https ok")
    }

    @TestCase
    func secureCookieNotReturnedOverHttp(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let secureCookie = Cookie("secure_cookie", "value1", secure: true)
        let cookies = ArrayList<Cookie>()
        cookies.add(secureCookie)

        cookieJar.storeCookies(URL.parse("https://example.com/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://example.com/path"))
        @Assert(retrievedCookies.size, 0)
        println("secure_cookie_not_returned_over_http ok")
    }
}

/* SCAN-IN
secure_cookie_rejected_from_http ok
secure_cookie_accepted_from_https ok
secure_cookie_not_returned_over_http ok
 */
