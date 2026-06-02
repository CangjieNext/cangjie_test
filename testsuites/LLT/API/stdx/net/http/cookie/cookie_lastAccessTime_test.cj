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
 *       Test Cookie#lastAccessTimecreationTime
 *            if two cookies have the same removal priority, the user agent must
 *            evict cookies with the earliest last-access date first.
 *            RFC 5.3.
 * Test API:
 *       Cookie :: init()
 *       CookieJar :: public func getCookies(url: URL): ArrayList<Cookie>
 */

package tests.cookie

import stdx.net.http.*
import std.net.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import stdx.log.*
import stdx.encoding.url.*
import std.sync.*

@Test
class TestCookieLastAccessTime {
    @TestCase
    func cookieLastAccessTime(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        for (i in 0..60) {
            cookieJar.storeCookies(URL.parse("https://example${i}.com/hello/a/b/"), cookies)
        }

        // update last access time
        var cookiesFromJar0 = cookieJar.getCookies(URL.parse("https://example0.com/hello/a/b"))
        @Expect(cookiesFromJar0.size, 50)
        var cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example1.com/hello/a/b"))
        @Expect(cookiesFromJar1.size, 50)

        let cookie = Cookie("wow", "wow")
        cookieJar.storeCookies(URL.parse("https://example100.com/hello/a/"), ArrayList<Cookie>([cookie]))

        cookiesFromJar0 = cookieJar.getCookies(URL.parse("https://example0.com/hello/a/b"))
        @Expect(cookiesFromJar0.size, 50)
        cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example1.com/hello/a/b"))
        @Expect(cookiesFromJar1.size, 50)

        for (i in 2..22) {
            let cookiesFromJar = cookieJar.getCookies(URL.parse("https://example${i}.com/hello/a/b"))
            @Expect(cookiesFromJar.size, 0)
        }
        for (i in 22..60) {
            let cookiesFromJar = cookieJar.getCookies(URL.parse("https://example${i}.com/hello/a/b"))
            @Expect(cookiesFromJar.size, 50)
        }

        let cookiesFromJar100 = cookieJar.getCookies(URL.parse("https://example100.com/hello/a/b"))
        @Expect(cookiesFromJar100.size, 1)

        println("ok")
    }
}

/* SCAN-IN
ok
 */
