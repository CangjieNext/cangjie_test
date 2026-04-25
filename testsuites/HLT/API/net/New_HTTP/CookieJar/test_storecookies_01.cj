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
 * Test description: Test storeCookies method
 * Test API: public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.collection.*
import std.sync.*
import std.time.*
import stdx.encoding.url.*

@Test
class Test_CookieJar_StoreCookies_01 {
    // 拒绝公共后缀， 仅http
    @TestCase
    func test_01(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["test.cn", "com"]), true)
        var cookie1 = ArrayList<Cookie>()
        cookie1.add(Cookie("1", "2", domain: "test.cn"))
        // 域名被拒绝----domain在拒绝列表中，和url的domain部分不完全一致
        cookiejar.storeCookies(URL.parse("http://example.test.cn/a/"), cookie1)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://example.test.cn/a/"))
        @Expect(cookiesfromjar.size, 0)

        // 域名不被拒绝----domain在拒绝列表中，和url的domain部分完全一致
        cookiejar.storeCookies(URL.parse("http://test.cn/a/"), cookie1)
        cookiesfromjar = cookiejar.getCookies(URL.parse("http://test.cn/a/"))
        @Expect(cookiesfromjar.size, 1)

        // domain 和拒绝列表中的域名不完全相同----不会被拒绝
        var cookie2 = ArrayList<Cookie>()
        cookie2.add(Cookie("10", "2", domain: "test.com"))
        cookiejar.storeCookies(URL.parse("http://a.test.com/a/"), cookie2)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("http://a.test.com/a/"))
        @Expect(cookiesfromjar00.size, 1)

        cookie2[0] = Cookie("100", "2", domain: "cn")
        cookiejar.storeCookies(URL.parse("http://a.test.cn/a/"), cookie2)
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("http://a.test.cn/a/"))
        @Expect(cookiesfromjar01.size, 1)

        // httpOnly: false, 使用http url ---- 存储成功
        var cookie3 = ArrayList<Cookie>()
        cookie3.add(Cookie("11", "2", domain: "org", httpOnly: false))
        cookiejar.storeCookies(URL.parse("http://a.test.org/a"), cookie3)
        var cookiesfromjar02 = cookiejar.getCookies(URL.parse("http://a.test.org/a"))
        @Expect(cookiesfromjar02.size, 1)

        // url非http ---- 存储失败
        var cookie4 = ArrayList<Cookie>()
        cookie4.add(Cookie("12", "2", domain: "org", httpOnly: true))
        cookiejar.storeCookies(URL.parse("www://a.test.org/a"), cookie4)
        var cookiesfromjar03 = cookiejar.getCookies(URL.parse("www://a.test.org/a"))
        @Expect(cookiesfromjar03.size, 0)
    }

    // 拒绝公共后缀， 非http
    @TestCase
    func test_02(): Unit {
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["test.cn", "com"]), false)

        // httpOnly为true， 无法存储
        var cookie1 = ArrayList<Cookie>([Cookie("1", "1", domain: "org", httpOnly: true)])
        cookiejar.storeCookies(URL.parse("www://a.test.org/a"), cookie1)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("www://a.test.org/a"))
        @Expect(cookiesfromjar00.size, 0)

        //  url 为true， 无法存储
        var cookie2 = ArrayList<Cookie>([Cookie("2", "2", domain: "org", httpOnly: false)])
        cookiejar.storeCookies(URL.parse("www://a.test.org/a"), cookie2)
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("www://a.test.org/a"))
        @Expect(cookiesfromjar01.size, 1)
        @Expect(CookieJar.toCookieString(cookiesfromjar01), "2=2")

        // 域名被拒绝，无法存储
        var cookie3 = ArrayList<Cookie>([Cookie("3", "3", domain: "com", httpOnly: false)])
        cookiejar.storeCookies(URL.parse("www://a.test.com/a"), cookie3)
        var cookiesfromjar02 = cookiejar.getCookies(URL.parse("www://a.test.com/a"))
        @Expect(cookiesfromjar02.size, 0)

        // 域名和url域名完全一致，可存储
        var cookie4 = ArrayList<Cookie>([Cookie("4", "4", domain: "com", httpOnly: false)])
        cookiejar.storeCookies(URL.parse("www://com/a"), cookie4)
        var cookiesfromjar03 = cookiejar.getCookies(URL.parse("www://com/a"))
        @Expect(cookiesfromjar03.size, 1)
        @Expect(CookieJar.toCookieString(cookiesfromjar03), "4=4")
    }

    // 存储空间限制
    @TestCase
    func test_03(): Unit {
        // 存储上限：3000
        var cookies = ArrayList<Cookie>()
        for (i in 0..3000) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://33.com/a"), cookies)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://33.com/a"))
        @Expect(cookiesfromjar00.size, 3000)

        var cookie_01 = ArrayList<Cookie>([Cookie("3000", "3000")])
        cookiejar.storeCookies(URL.parse("https://33.com/a"), cookie_01)
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("https://33.com/a"))
        @Expect(cookiesfromjar01.size, 51)
    }

    // 超出存储上限：删除过期者
    @TestCase
    func test_04(): Unit {
        var cookies = ArrayList<Cookie>()
        for (i in 0..1999) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        for (i in 1999..3000) {
            cookies.add(Cookie("${i}", "${i}", maxAge: 1))
        }

        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://33.com/a"), cookies)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://33.com/a"))
        @Expect(cookiesfromjar00.size, 3000)

        sleep(Duration.second * 1.5)
        // 取时删除过期cookie
        cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://33.com/a"))
        @Expect(cookiesfromjar00.size, 1999)

        var cookie_01 = ArrayList<Cookie>([Cookie("3000", "3000")])
        cookiejar.storeCookies(URL.parse("https://33.com/a"), cookie_01)
        var cookiesfromjar01 = cookiejar.getCookies(URL.parse("https://33.com/a"))
        @Expect(cookiesfromjar01.size, 2000)
    }

    // 超出存储上限：删除过期者
    @TestCase
    func test_05(): Unit {
        var cookies = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        var cookies_expire = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies_expire.add(Cookie("ex${i}", "ex${i}", expires: DateTime.nowUTC()))
        }
        var cookies_maxage = ArrayList<Cookie>()
        for (i in 0..50) {
            cookies_maxage.add(Cookie("ex${i}", "ex${i}", maxAge: 1))
        }

        // 共存入3000条
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), false)
        for (i in 0..20) {
            cookiejar.storeCookies(URL.parse("wss://${i}.com/a"), cookies)
        }
        for (i in 20..40) {
            cookiejar.storeCookies(URL.parse("wss://${i}.com/a"), cookies_expire)
        }
        for (i in 40..60) {
            cookiejar.storeCookies(URL.parse("wss://${i}.com/a"), cookies_maxage)
        }

        // 清除过期cookie
        sleep(Duration.second * 1.5)
        for (i in 20..60) {
            cookiejar.storeCookies(URL.parse("wss://${i}.com/a"), cookies)
        }

        // 确认过期cookie已经被删除
        for (i in 0..60) {
            var cookiesfromjar = cookiejar.getCookies(URL.parse("wss://${i}.com/a"))
            @Expect(cookiesfromjar.size, 50)
        }
    }

    // 超出存储上限：删除相同domain超过50的部分
    @TestCase
    func test_06(): Unit {
        var cookies = ArrayList<Cookie>()
        for (i in 0..100) {
            cookies.add(Cookie("${i}", "${i}"))
        }

        // 共存入3000条
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), false)
        for (i in 0..30) {
            cookiejar.storeCookies(URL.parse("wss://${i}.com/a"), cookies)
        }
        var cookie_00 = ArrayList<Cookie>([Cookie("abc", "abc")])
        cookiejar.storeCookies(URL.parse("wss://29.com/a"), cookie_00)

        // 相同domain均只保留50
        for (i in 0..29) {
            var cookiesfromjar = cookiejar.getCookies(URL.parse("wss://${i}.com/a"))
            @Expect(cookiesfromjar.size, 50)
        }
        var cookiesfromjar = cookiejar.getCookies(URL.parse("wss://29.com/a"))
        @Expect(cookiesfromjar.size, 51)
    }

    // 超出存储上限：相同优先级优先删除最早存入的
    @TestCase
    func test_07(): Unit {
        var cookies = ArrayList<Cookie>([Cookie("1", "1")])

        // 共存入3000条
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>.of("comm"), true)
        for (i in 0..3000) {
            cookiejar.storeCookies(URL.parse("http://${i}.com/a"), cookies)
        }

        // 超出上限
        cookiejar.storeCookies(URL.parse("http://3000.com/a"), cookies)

        // 前1000条被删除
        for (i in 0..1000) {
            var cookiesfromjar = cookiejar.getCookies(URL.parse("http://${i}.com/a"))
            @Expect(cookiesfromjar.size, 0)
        }
        for (i in 1000..3001) {
            var cookiesfromjar = cookiejar.getCookies(URL.parse("http://${i}.com/a"))
            @Expect(cookiesfromjar.size, 1)
        }
    }

    // 对已存满cookie jar存入不合要求cookie
    @TestCase
    func test_08(): Unit {
        var cookies = ArrayList<Cookie>([Cookie("1", "1")])

        // 共存入3000条
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>.of("comm"), true)
        for (i in 0..3000) {
            cookiejar.storeCookies(URL.parse("http://${i}.com/a"), cookies)
        }

        // 存入不合法cookie
        var cookie_00 = ArrayList<Cookie>([Cookie("1", "1", domain: "comm")])
        cookiejar.storeCookies(URL.parse("http://a.comm/a"), cookie_00)

        // 不做清理
        for (i in 0..3000) {
            var cookiesfromjar = cookiejar.getCookies(URL.parse("http://${i}.com/a"))
            @Expect(cookiesfromjar.size, 1)
        }
    }

    // 对已存满cookie jar存入不合要求cookie
    @TestCase
    func test_09(): Unit {
        var cookies = ArrayList<Cookie>([Cookie("1", "1")])

        // 共存入3000条
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>.of("comm"), false)
        for (i in 0..3000) {
            cookiejar.storeCookies(URL.parse("wss://${i}.com/a"), cookies)
        }

        // 存入不合法cookie
        var cookie_00 = ArrayList<Cookie>([Cookie("1", "1", httpOnly: true)])
        cookiejar.storeCookies(URL.parse("wss://3000.com/a"), cookie_00)

        // 不做清理
        for (i in 0..3000) {
            var cookiesfromjar = cookiejar.getCookies(URL.parse("wss://${i}.com/a"))
            @Expect(cookiesfromjar.size, 1)
        }
    }

    // 存入同名cookie：限于cookie的name，domain和path均相同
    @TestCase
    func test_10(): Unit {
        var cookie0 = ArrayList<Cookie>([Cookie("1", "1", domain: "com", path: "/a")])
        // 非同名
        var cookie1 = ArrayList<Cookie>([Cookie("11", "10", domain: "com", path: "/a")])
        var cookie2 = ArrayList<Cookie>([Cookie("1", "1", domain: "a.com", path: "/a")])
        var cookie3 = ArrayList<Cookie>([Cookie("1", "1", domain: "com", path: "/a/b")])

        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie0)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie1)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie2)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie3)

        var cookiesfromjar = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar.size, 4)

        // 同名
        var cookie4 = ArrayList<Cookie>([Cookie("1", "1", domain: "com", path: "/a", maxAge: 10)])
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie4)
        cookiesfromjar = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar.size, 4)
    }

    // 存入同名cookie：将新cookie的创建时间匹配老cookie ??/???
    @TestCase
    func test_11(): Unit {
        var cookie0 = ArrayList<Cookie>([Cookie("1", "1", domain: "com", path: "/a")])
        var cookie_middle = ArrayList<Cookie>([Cookie("1", "11", domain: "com", path: "/a/b")])
        var cookie1 = ArrayList<Cookie>([Cookie("1", "1", domain: "com", path: "/a")])

        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie0)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie_middle)

        var cookiesfromjar = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar.size, 2)
        println(CookieJar.toCookieString(cookiesfromjar))

        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie1)
        cookiesfromjar = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar.size, 2)
        println(CookieJar.toCookieString(cookiesfromjar))
    }

    // domain非空且域属性和path不匹配--不存储
    @TestCase
    func test_12(): Unit {
        var cookie0 = ArrayList<Cookie>([Cookie("1", "1", domain: "com", path: "/b")])
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie0)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar.size, 0)
    }

    // domain为空且域属性和path不匹配--存储
    @TestCase
    func test_13(): Unit {
        var cookie0 = ArrayList<Cookie>([Cookie("1", "1", path: "/b")])
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie0)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("https://a.com/b"))
        @Expect(cookiesfromjar.size, 1)
    }

    // domain属性不匹配
    @TestCase
    func test_14(): Unit {
        var cookie0 = ArrayList<Cookie>([Cookie("1", "1", domain: "cn")])
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie0)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar.size, 0)
    }

    // 安全属性不匹配--不影响存储
    @TestCase
    func test_15(): Unit {
        var cookie0 = ArrayList<Cookie>([Cookie("1", "1", secure: true)])
        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        cookiejar.storeCookies(URL.parse("http://a.com/a/b"), cookie0)
        var cookiesfromjar = cookiejar.getCookies(URL.parse("http://a.com/a/b"))
        @Expect(cookiesfromjar.size, 0)
        var cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar00.size, 0)

        cookiejar.storeCookies(URL.parse("https://a.com/a/b"), cookie0)
        cookiesfromjar00 = cookiejar.getCookies(URL.parse("https://a.com/a/b"))
        @Expect(cookiesfromjar00.size, 1)
    }
}
