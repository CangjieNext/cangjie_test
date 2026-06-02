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
 *       Test CookieJar#get remove expired cookies
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
class TestCookieJarGetRemoveExpiredCookies {
    @TestCase
    func cookieJarGetRemoveExpiredCookies(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        for (i in 0..2000) {
            cookies.add(Cookie("${i}", "${i}", maxAge: 1))
        }

        cookieJar.storeCookies(URL.parse("https://example.com/hello/a/b/"), cookies)

        var cookiesFromJar = cookieJar.getCookies(URL.parse("https://example.com/hello/a/b/c"))
        @Expect(cookiesFromJar.size, 2000)
        sleep(Duration.second)
        cookiesFromJar = cookieJar.getCookies(URL.parse("https://example.com/hello/a/b/c"))
        @Expect(cookiesFromJar.size, 0)

        cookieJar.storeCookies(URL.parse("https://example.com/hello/a/b/"), cookies)
        cookiesFromJar = cookieJar.getCookies(URL.parse("https://example.com/hello/a/b/c"))
        @Expect(cookiesFromJar.size, 2000)

        println("ok")
    }
}

/* SCAN-IN
ok
 */
