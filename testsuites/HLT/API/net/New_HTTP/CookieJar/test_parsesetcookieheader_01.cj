/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test parseSetCookieHeader method
 * Test API: public static func parseSetCookieHeader(response: HttpResponse): ArrayList<Cookie>
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.time.*
import std.collection.*
import stdx.encoding.url.*

@Test
class Test_CookieJar_ParseSetCookieHeader_01 {
    // 从response获取cookie：正确处理各类属性
    @TestCase
    func test_01(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("http://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        res.header("Set-Cookie",
            "1=2; Expires=Sat, 17 Jun 2023 11:24:22 UTC; Max-Age=6; Domain=com; Path=/a; Secure; HttpOnly")
        var cookies = CookieJar.parseSetCookieHeader(res.build())
        for (cookie in cookies) {
            @Expect(cookie.toSetCookieString(), "1=2; Expires=Sat, 17 Jun 2023 11:24:22 UTC; Max-Age=6; Domain=com; Path=/a; Secure; HttpOnly")
        }
    }

    // 合法cookie 在转字符串和解析处理后保持不变
    @TestCase
    func test_02(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("http://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        var timezone = DateTime.nowUTC()
        var cookie1 = Cookie("a#!|", "{[A]}", expires: timezone, maxAge: 6666, domain: "com", path: "/a", secure: true,
            httpOnly: true)
        res.header("Set-Cookie", cookie1.toSetCookieString())

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        for (cookie in cookies) {
            @Expect(cookie1.toSetCookieString(), cookie.toSetCookieString())
        }
    }

    // set-cookie字段被忽略----name-value中缺少等号; name字段为空; name/value中间含有空格
    @TestCase
    func test_03(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("http://aa.org.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        res.header("Set-Cookie", "1<2; Max-Age=6")
        res.header("Set-Cookie", "=2")
        res.header("Set-Cookie", "1 2= 23 ; Secure")
        res.header("Set-Cookie", "1= 2 3 ; Secure")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        @Expect(cookies.size, 0)
    }

    // 测试各类不会被直接忽略的可解析cookie
    @TestCase
    func test_04(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("https://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        res.header("Set-Cookie", "1=1")
        res.header("Set-Cookie", "1=; HttpOnly")
        // name, value 包含空格字符
        res.header("Set-Cookie", "   1=        ; Secure")
        res.header("Set-Cookie", " \t1= \t; Secure; HttpOnly")
        // ;被忽略
        res.header("Set-Cookie", "1= 23 ;;;")
        // 非法属性被忽略-其中path非法时解析url-path，secure和HTTPOnly不区分大小写,属性不区分大小写
        res.header("Set-Cookie",
            "1=ab-cd ; ExpIres=Sat, 17 Jun 11abc 11:24:22 UTC; Max-age=s; DomaiN=..37; Path=##!@@; secure; httponly")
        // 属性中空格处理首位，中间不处理
        res.header("Set-Cookie",
            "1=ab-cde ; Expires = Sat, 17 Jun 2023 11:24:22 UTC; Max-Age = 37 ; Domain = 37; Path= ##! @@; secu re; http only")
        // 无法被解析的属性被放入others
        res.header("Set-Cookie", "1=ab-345 ; secure;abc= 123;max-age = 666; Asia 888仓颉")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        @Expect(cookies[0].toSetCookieString(), "1=1")
        @Expect(cookies[1].toSetCookieString(), "1=; HttpOnly")
        // parse 处理空格字符
        @Expect(cookies[2].toSetCookieString(), "1=; Secure")
        @Expect(cookies[3].toSetCookieString(), "1=; Secure; HttpOnly")

        @Expect(cookies[4].toSetCookieString(), "1=23")
        @Expect(cookies[5].toSetCookieString(), "1=ab-cd; Path=/a; Secure; HttpOnly")
        @Expect(cookies[6].toSetCookieString(), "1=ab-cde; Expires=Sat, 17 Jun 2023 11:24:22 UTC; Max-Age=37; Domain=37; Path=/a")
        @Expect(cookies[6].others, ArrayList<String>(["secu re", "http only"]))
        @Expect(cookies[7].toSetCookieString(), "1=ab-345; Max-Age=666; Secure")
        @Expect(cookies[7].others, ArrayList<String>(["abc= 123", "Asia 888仓颉"]))
    }

    // 测试expires属性
    @TestCase
    func test_05(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("https://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        // expires不区分大小写
        res.header("Set-Cookie", "1=2; ExpIreS=Mon, 01 Jan 1601 00:00:00 UTC")
        // 小于1601年被忽略
        res.header("Set-Cookie", "1=3; expires=Sun, 31 Dec 1600 23:59:59 UTC")
        // 为空或非法格式被忽略
        res.header("Set-Cookie", "1=4; expires=")
        res.header("Set-Cookie", "1=5; expires=mon, 01 Jan 1601 00:00:00 UTC")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        @Expect(cookies[0].toSetCookieString(), "1=2; Expires=Mon, 01 Jan 1601 00:00:00 UTC")
        @Expect(cookies[1].toSetCookieString(), "1=3")
        @Expect(cookies[2].toSetCookieString(), "1=4")
        @Expect(cookies[3].toSetCookieString(), "1=5")
    }

    // 测试max-age属性
    @TestCase
    func test_06(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("https://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        // max-age不区分大小写
        res.header("Set-Cookie", "1=2; maX-aGe = 98765")
        // 首个字符不为数字或-被忽略
        res.header("Set-Cookie", "1=3; max-age=  .12345")
        // 为空，非法被忽略
        res.header("Set-Cookie", "1=4; max-age=")
        res.header("Set-Cookie", "1=5; max-age=10.0")
        // 0开头
        res.header("Set-Cookie", "1=6; max-age=00123")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        @Expect(cookies[0].toSetCookieString(), "1=2; Max-Age=98765")
        @Expect(cookies[1].toSetCookieString(), "1=3")
        @Expect(cookies[2].toSetCookieString(), "1=4")
        @Expect(cookies[3].toSetCookieString(), "1=5")
        @Expect(cookies[4].toSetCookieString(), "1=6; Max-Age=123")
    }

    // 测试domain属性
    @TestCase
    func test_07(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("https://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        // domain不区分大小写
        res.header("Set-Cookie", "1=2; dOmAiN = com.org")
        // 处理首个为.的符号
        res.header("Set-Cookie", "1=3; domain=  .12345")
        // 多个.被忽略
        res.header("Set-Cookie", "1=4; domain=..com")
        // 为空，非法被忽略
        res.header("Set-Cookie", "1=5; domain=")
        res.header("Set-Cookie", "1=6; domain=%")
        res.header("Set-Cookie", "1=7; domain=123451234512345123451234512345123451234512345123451234512345123")
        res.header("Set-Cookie", "1=8; domain=1234512345123451234512345123451234512345123451234512345123451234")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        @Expect(cookies[0].toSetCookieString(), "1=2; Domain=com.org")
        @Expect(cookies[1].toSetCookieString(), "1=3; Domain=12345")
        @Expect(cookies[2].toSetCookieString(), "1=4")
        @Expect(cookies[3].toSetCookieString(), "1=5")
        @Expect(cookies[4].toSetCookieString(), "1=6")
        @Expect(cookies[5].toSetCookieString(), "1=7; Domain=123451234512345123451234512345123451234512345123451234512345123")
        @Expect(cookies[6].toSetCookieString(), "1=8")
    }

    // 测试path属性
    @TestCase
    func test_08(): Unit {
        var rep = HttpRequestBuilder().url(URL.parse("https://aa.com/a/b")).build()
        var res = HttpResponseBuilder().request(rep)
        var res1 = HttpResponseBuilder()
        // path不区分大小写
        res.header("Set-Cookie", "1=2; patH = /b")
        // path为空或首个字符不为/
        res.header("Set-Cookie", "1=3; path=")
        res.header("Set-Cookie", "1=4; path=./")
        // 首个字符为/
        res.header("Set-Cookie", "1=5; path=/10086")
        res.header("Set-Cookie", "1=6; path=////.///1")

        var cookies = CookieJar.parseSetCookieHeader(res.build())
        @Expect(cookies[0].toSetCookieString(), "1=2; Path=/b")
        @Expect(cookies[1].toSetCookieString(), "1=3; Path=/a")
        @Expect(cookies[2].toSetCookieString(), "1=4; Path=/a")
        @Expect(cookies[3].toSetCookieString(), "1=5; Path=/10086")
        @Expect(cookies[4].toSetCookieString(), "1=6; Path=////.///1")

        // 默认cookie-path
        res1.header("Set-Cookie", "1=1; path=")
        var cookies00 = CookieJar.parseSetCookieHeader(res1.build())
        @Expect(cookies00[0].toSetCookieString(), "1=1; Path=/")
    }
}
