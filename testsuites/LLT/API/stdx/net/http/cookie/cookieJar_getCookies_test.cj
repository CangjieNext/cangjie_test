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
class TestCookieJarGetCookies {
    @TestCase
    func cookieJarGetCookies(): Unit {
        let time = DateTime.nowUTC() + Duration.second

        let requestUrl = URL.parse("https://foo.example.com/hello/a/b")
        let httpRequest = HttpRequestBuilder().url(requestUrl).method("GET").version(HTTP1_1).build()
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        let cookie1 = Cookie("4P_JAR", "4", expires: time, domain: "foo.example.com")
        let cookie1_1 = Cookie("4P_JAR_1", "4", expires: time + Duration.second * 3, domain: "foo.example.com",
            path: "/hello/a")
        let cookie2 = Cookie("3P_JAR", "5", domain: "foo.example.com", path: "/hello")
        let cookie3 = Cookie("6P_JAR", "6", path: "/hello", domain: "baz.example.com")
        let cookie4 = Cookie("7P_JAR", "7", path: "/abc", domain: "example.com")
        httpResponseBuilder.header("Set-Cookie", "1P_JAR=1; path=/; domain=; Secure")
        httpResponseBuilder.header("Set-Cookie", "2P_JAR=2; path=; domain=com; Secure")
        httpResponseBuilder.header("Set-Cookie", "3P_JAR=3; path=/hello; domain=foo.example.com; Secure")
        httpResponseBuilder.header("Set-Cookie", cookie1.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie1_1.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie2.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie3.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie4.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", "8P_JAR=8; max-age=1; path=/hello; domain=example.com; Secure")
        httpResponseBuilder.header("Set-Cookie", "9P_JAR=9; max-age=3; path=/hello/a/; domain=example.com; Secure")

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        cookieJar.storeCookies(requestUrl, resultCookies)
        sleep(Duration.second * 2)
        let cookiesFromJar = cookieJar.getCookies(URL.parse("https://baz.foo.example.com/hello/a/b/c"))
        println(CookieJar.toCookieString(cookiesFromJar))
        println("ok")
    }
}

/* SCAN-IN
9P_JAR=9; 4P_JAR_1=4; 3P_JAR=5
ok
 */
