/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test storeCookies method deal with cookies from response
 * Test API: public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.collection.*
import stdx.encoding.url.*

@Test
class Test_CookieJar_StoreCookies_02 {
    // 存储从response获取的非法cookie
    @TestCase
    func test_01(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        var rep = HttpRequestBuilder().url(URL.parse("https://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        res.header("Set-Cookie", "1=2; maX-aGe = -98765")
        res.header("Set-Cookie", "1=3; max-age=  0")
        var cookies = CookieJar.parseSetCookieHeader(res.build())
        @Expect(cookies.size, 2)
        cookiejar.storeCookies(URL.parse("https://aa.com/a/b"), cookies)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://aa.com/a/b"))
        @Expect(cookiesfromjar00.size, 0)
    }
}
