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
class TestCookieJarStoreCookiesMaxAge {
    @TestCase
    func cookieJarStoreCookiesMaxAge(): Unit {
        let httpRequest = HttpRequestBuilder()
            .url(URL.parse("http://example.com/hello/a"))
            .method("GET")
            .version(HTTP1_1)
            .build()
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)

        httpResponseBuilder.header("Set-Cookie", "1=1; Max-Age=-100")
        httpResponseBuilder.header("Set-Cookie", "2=2; Max-Age=100")
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        cookieJar.storeCookies(URL.parse("http://example.com/hello/a"), resultCookies)
        let result = cookieJar.getCookies(URL.parse("http://example.com/hello/a"))
        @Expect(CookieJar.toCookieString(result), "2=2")
        println("ok")
    }
}

/* SCAN-IN
ok
 */
