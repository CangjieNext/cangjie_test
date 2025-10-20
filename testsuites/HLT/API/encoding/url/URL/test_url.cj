/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./../../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC-PIPE: %compiler %import-cangjie-stdx %cmp_opt %n.cj asan.%middle -o %n.%suffix %cmp_utest_opt
// RUN-EXEC-PIPE: %run_stdx %n.%suffix %run_utest_opt %run_args

import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
public class Test_URL {
    @TestCase
    func case1(): Unit {
        // hostName为空
        var expect = ""
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url1 = URL(scheme: "http", hostName: "", path: "/page1")
        var result1 = url1.hostName
        @Expect(result1, expect)
        // rawUserInfo
        var rawUserInfo1 = url1.rawUserInfo.toString()
        @Expect(rawUserInfo1, expect)
        // 解析URL得到实例的hostName成员变量与原URL的hostName一致
        var str = "http:/page1"
        var url2 = URL.parse(str)
        var result2 = url2.hostName
        @Expect(result2, expect)
        // rawUserInfo
        var rawUserInfo2 = url2.rawUserInfo.toString()
        @Expect(rawUserInfo2, expect)
        // replace()
        var url10 = url2.replace(scheme: "testScheme", userInfo: "testUserInfo", hostName: "testHostName", port: "999",
            path: "/testPath", query: "?testQuery", fragment: "testFragment")
        @Expect(url10.scheme, "testscheme")
        @Expect(url10.userInfo.toString(), "testUserInfo")
        @Expect(url10.hostName, "testhostname")
        @Expect(url10.port, "999")
        @Expect(url10.path, "/testPath")
        @Expect(url10.query, "?testQuery")
        @Expect(url10.fragment, "testFragment")
    }

    @TestCase
    func case2(): Unit {
        // hostName为域名形式
        var expect = "test.localhost.com"
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url1 = URL(scheme: "https", hostName: "test.localhost.com", path: "/test/home/workspace/1")
        var result1 = url1.hostName
        @Expect(result1, expect)
        // 解析URL得到实例的hostName成员变量与原URL的hostName一致
        var str = "https://abc:@test.localhost.com/32qr1"
        var url2 = URL.parse(str)
        var result2 = url2.hostName
        @Expect(result2, expect)
        // rawUserInfo
        var rawUserInfo1 = url2.rawUserInfo.toString()
        @Expect(rawUserInfo1, "abc")
        // replace()
        var url10 = url2.replace(scheme: "http", userInfo: "testUser1:testpsswd1", hostName: "testUser2", port: "88888",
            path: "/next/#/detail?uuid=867181847298789376", query: "key=987", fragment: "testfragment1")
        @Expect(url10.scheme, "http")
        @Expect(url10.userInfo.toString(), "testUser1:testpsswd1")
        @Expect(url10.hostName, "testuser2")
        @Expect(url10.port, "88888")
        @Expect(url10.path, "/next/#/detail?uuid=867181847298789376")
        @Expect(url10.query, "key=987")
        @Expect(url10.fragment, "testfragment1")
    }

    @TestCase
    func case3(): Unit {
        // hostName为ip地址和端口号形式
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url = URL(scheme: "https", hostName: "127.0.0.1", path: "/test/home/workspace/1")
        var expect1 = "127.0.0.1"
        var result1 = url.hostName
        @Expect(result1, expect1)
        // 解析URL得到实例的hostName成员变量与原URL的hostName一致
        var str = "http://127.0.0.1:888/57y5dds?color=red#f1"
        var expect2 = "127.0.0.1"
        var result2 = URL.parse(str).hostName
        @Expect(result2, expect2)
        // rawUserInfo
        var rawUserInfo1 = url.rawUserInfo.toString()
        @Expect(rawUserInfo1, "")
        var url2 = URL.parse(str)
        // replace()
        var url10 = url2.replace(scheme: "", userInfo: ":testpsswd1", hostName: "", port: "", path: "", query: "",
            fragment: "")
        @Expect(url10.scheme, "")
        @Expect(url10.userInfo.toString(), ":testpsswd1")
        @Expect(url10.hostName, "")
        @Expect(url10.port, "")
        @Expect(url10.path, "")
        @Expect(url10.query, "")
        @Expect(url10.fragment, "")
    }

    @TestCase
    func case4(): Unit {
        // hostName为包含转义字符形式
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url = URL(scheme: "https", hostName: "file%20one%26two", path: "/test/home/workspace/1")
        var expect1 = "file%20one%26two"
        var result1 = url.hostName
        @Expect(result1, expect1)
        // 解析URL得到实例的hostName成员变量与原URL的hostName一致
        var str = "https://file%20one%26two/57y5dds"
        var expect2 = "file one&two"
        var result2 = URL.parse(str).hostName
        @Expect(result2, expect2)
        // rawUserInfo
        var rawUserInfo1 = url.rawUserInfo.toString()
        @Expect(rawUserInfo1, "")
    }

    @TestCase
    func case5(): Unit {
        // hostName为包含特殊符号形式, ?
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url = URL(scheme: "https", hostName: "网-址1?2.com", path: "/test/home/workspace/1")
        var expect1 = "网-址1?2.com"
        var result1 = url.hostName
        @Expect(result1, expect1)
        // 解析URL得到实例的hostName成员变量与原URL的hostName一致
        var str = "https://网-址1?2.com/57y5dds"
        var expect2 = "网-址1"
        var result2 = URL.parse(str).hostName
        @Expect(result2, expect2)
        // rawUserInfo
        var rawUserInfo1 = url.rawUserInfo.toString()
        @Expect(rawUserInfo1, "")
    }

    @TestCase
    func case6(): Unit {
        // hostName为包含特殊符号形式, #
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url = URL(scheme: "https", hostName: "zhan.leiue#buy.com", path: "/fanly-mip.html")
        var expect1 = "zhan.leiue#buy.com"
        var result1 = url.hostName
        @Expect(result1, expect1)
        // 解析URL得到实例的hostName成员变量与原URL的hostName一致
        var str = "https://zhan.leiue#buy.com/fanly-mip.html"
        var expect2 = "zhan.leiue"
        var result2 = URL.parse(str).hostName
        @Expect(result2, expect2)
        // rawUserInfo
        var rawUserInfo1 = url.rawUserInfo.toString()
        @Expect(rawUserInfo1, "")
    }

    @TestCase
    func case7(): Unit {
        // hostName为包含特殊符号形式, &
        var expect = "blog.qq_43456781&time=2021728.com"
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url1 = URL(scheme: "https", hostName: "blog.qq_43456781&time=2021728.com", path: "/page2")
        var result1 = url1.hostName
        @Expect(result1, expect)
        // 解析URL得到实例的hostName成员变量与原URL的hostName一致
        var str = "https://userName:psswd@blog.qq_43456781&time=2021728.com/page2"
        var url2 = URL.parse(str)
        var result2 = URL.parse(str).hostName
        @Expect(result2, expect)
        // rawUserInfo
        var rawUserInfo1 = url2.rawUserInfo.toString()
        @Expect(rawUserInfo1, "userName:psswd")
    }

    @TestCase
    func case8(): Unit {
        // hostName为包含特殊符号形式, !@$^*()`~
        var expect = "blog!@$^*()`~.abc.com"
        // 初始化URL得到实例的hostName成员变量与入参一致
        var url = URL(scheme: "https", hostName: "blog!@$^*()`~.abc.com", path: "/page2")
        var result1 = url.hostName
        @Expect(result1, expect)

        // 解析URL抛异常
        let expect_exception_num = 1
        var count = 0
        var str = "https://blog!@$^*()`~.abc.com/page2"
        try {
            var result2 = URL.parse(str).hostName
        } catch (e: UrlSyntaxException) {
            count += 1
        }
        @Expect(count, expect_exception_num)
    }
}
