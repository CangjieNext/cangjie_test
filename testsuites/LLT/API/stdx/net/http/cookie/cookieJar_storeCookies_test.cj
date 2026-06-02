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

@Test
class TestCookieJarStoreCookies {
    @TestCase
    func cookieJarStoreCookies(): Unit {
        let httpRequest = HttpRequestBuilder()
            .url(URL.parse("https://foo.example.com/hello/a"))
            .method("GET")
            .version(HTTP1_1)
            .build()
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        let cookie1 = Cookie("4P_JAR", "4")
        let cookie2 = Cookie("3P_JAR", "5", path: "/hello")
        let cookie3 = Cookie("6P_JAR", "6", path: "/hello", domain: "baz.example.com")
        let cookie4 = Cookie("7P_JAR", "7", path: "/abc", domain: "example.com")
        httpResponseBuilder.header("Set-Cookie", "1P_JAR=1; path=/; domain=; Secure")
        httpResponseBuilder.header("Set-Cookie", "2P_JAR=2; path=; domain=com; Secure")
        httpResponseBuilder.header("Set-Cookie", "3P_JAR=3; path=/hello; domain=; Secure")
        httpResponseBuilder.header("Set-Cookie", cookie1.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie2.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie3.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie4.toSetCookieString())

        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        cookieJar.storeCookies(URL.parse("https://foo.example.com/hello/a"), resultCookies)
        println("ok")
    }
}

/* SCAN-IN
ok
 */
