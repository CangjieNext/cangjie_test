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
 *       Test CookieJar#threadSafety
 * Test API:
 *       public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 *       public func getCookies(url: URL): ArrayList<Cookie>
 *       public func removeCookies(domain: String): Unit
 *       public func clear(): Unit
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
class TestCookieJarThreadSafety {
    @TestCase
    func cookieJarStoreAndGet(): Unit {
        let cookieJar1 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies1 = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies1.add(Cookie("${i}", "${i}"))
        }
        spawn {
            cookieJar1.storeCookies(URL.parse("https://example.com/hello/a"), cookies1)
        }

        let cookiesFromJar1 = cookieJar1.getCookies(URL.parse("https://example.com/hello/a"))
        if (cookiesFromJar1.size != 0 && cookiesFromJar1.size != 50) {
            @Expect(1, 2)
        }
    }

    @TestCase
    func cookieJarGetAndRemove(): Unit {
        let cookieJar2 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies2 = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies2.add(Cookie("${i}", "${i}"))
        }
        cookieJar2.storeCookies(URL.parse("https://example.com/hello/a"), cookies2)

        spawn {
            sleep(Duration.microsecond * 1)
            cookieJar2.removeCookies("example.com")
        }

        let cookiesFromJar2 = cookieJar2.getCookies(URL.parse("https://example.com/hello/a"))
        if (cookiesFromJar2.size != 0 && cookiesFromJar2.size != 50) {
            @Expect(1, 2)
        }
    }

    @TestCase
    func cookieJarRemoveAndGet(): Unit {
        let cookieJar3 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies3 = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies3.add(Cookie("${i}", "${i}"))
        }
        cookieJar3.storeCookies(URL.parse("https://example.com/hello/a"), cookies3)

        spawn {
            cookieJar3.removeCookies("example.com")
        }

        sleep(Duration.microsecond * 1)
        let cookiesFromJar3 = cookieJar3.getCookies(URL.parse("https://example.com/hello/a"))
        if (cookiesFromJar3.size != 0 && cookiesFromJar3.size != 50) {
            @Expect(1, 2)
        }
    }

    @TestCase
    func cookieJarStoreAndRemove(): Unit {
        let cookieJar4 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies4 = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies4.add(Cookie("${i}", "${i}"))
        }

        spawn {
            cookieJar4.storeCookies(URL.parse("https://example.com/hello/a"), cookies4)
        }

        sleep(Duration.microsecond * 1)
        cookieJar4.removeCookies("example.com")
        let cookiesFromJar4 = cookieJar4.getCookies(URL.parse("https://example.com/hello/a"))
        if (cookiesFromJar4.size != 0 && cookiesFromJar4.size != 50) {
            @Expect(1, 2)
        }
    }

    @TestCase
    func cookieJarRemoveAndStore(): Unit {
        let cookieJar5 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies5 = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies5.add(Cookie("${i}", "${i}"))
        }

        spawn {
            cookieJar5.removeCookies("example.com")
        }

        sleep(Duration.microsecond * 1)
        cookieJar5.storeCookies(URL.parse("https://example.com/hello/a"), cookies5)
        let cookiesFromJar5 = cookieJar5.getCookies(URL.parse("https://example.com/hello/a"))
        if (cookiesFromJar5.size != 0 && cookiesFromJar5.size != 50) {
            @Expect(1, 2)
        }
    }

    @TestCase
    func cookieJarStoreAndClear(): Unit {
        let cookieJar6 = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies6 = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies6.add(Cookie("${i}", "${i}"))
        }

        spawn {
            cookieJar6.storeCookies(URL.parse("https://example.com/hello/a"), cookies6)
        }

        sleep(Duration.microsecond * 1)
        cookieJar6.clear()
        let cookiesFromJar6 = cookieJar6.getCookies(URL.parse("https://example.com/hello/a"))
        if (cookiesFromJar6.size != 0 && cookiesFromJar6.size != 50) {
            @Expect(1, 2)
        }
        println("ok")
    }
}

/* SCAN-IN
ok
 */
