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
 *       Test CookieJar#toCookieString
 * Test API:
 *       static func toCookieString(cookies: ArrayList<Cookie>): String
 */

package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestCookieJarToCookieString {
    @TestCase
    func cookieJarToCookieString(): Unit {
        let httpRequest = HttpRequestBuilder()
            .url(URL.parse("https://example.com/hello/a"))
            .method("GET")
            .version(HTTP1_1)
            .build()
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        let cookie1 = Cookie("4P_JAR", "2023-03-24-04")
        let cookie2 = Cookie("5P_JAR", "2023-03-24-04", path: "abcdefghijklmnopqrstuvwxyz")
        let cookie3 = Cookie("6P_JAR", "2023-03-24-04", path: "", domain: "")
        let cookie4 = Cookie("7P_JAR", "2023-03-24-04", path: "/abc", domain: "example.com")
        httpResponseBuilder.header("Set-Cookie",
            "1P_JAR=2023-03-24-04; expires=Sun, 23 Apr 2023 04:12:34 GMT; path=/; domain=; Secure")
        httpResponseBuilder.header("Set-Cookie",
            "2P_JAR=2023-03-24-04; expires=Sun, 23 Apr 2023 04:12:34 GMT; path=; domain=; Secure")
        httpResponseBuilder.header("Set-Cookie",
            "3P_JAR=2023-03-24-04; expires=Sun, 23 Apr 2023 04:12:34 GMT; path=//; domain=; Secure")
        httpResponseBuilder.header("Set-Cookie", cookie1.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie2.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie3.toSetCookieString())
        httpResponseBuilder.header("Set-Cookie", cookie4.toSetCookieString())

        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        println(CookieJar.toCookieString(resultCookies))
        println("ok")
    }
}

/* SCAN-IN
1P_JAR=2023-03-24-04; 2P_JAR=2023-03-24-04; 3P_JAR=2023-03-24-04; 4P_JAR=2023-03-24-04; 5P_JAR=2023-03-24-04; 6P_JAR=2023-03-24-04; 7P_JAR=2023-03-24-04
ok
 */
