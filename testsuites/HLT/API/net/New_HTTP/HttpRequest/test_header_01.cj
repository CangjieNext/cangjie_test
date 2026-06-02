/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test positive header function
 * Test API: public func header(key: String, value: String): HttpRequestBuilder
 *           public func addHeaders(headers: HttpHeaders): HttpRequestBuilder
 *           public func setHeaders(headers: HttpHeaders): HttpRequestBuilder
 */

import std.collection.*
import stdx.net.http.*

@Test
class Test_HttpRequestBuilder_Header_01 {
    //合法token
    @TestCase
    func test_header_01(): Unit {
        var names = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNMa"]
        for (name in names) {
            var req1 = HttpRequestBuilder().header(name, name).build()
            @Expect(ArrayList<String>(req1.headers.get(name)), ArrayList<String>([name]))
        }
    }

    //多次调用: 新增，重复者不覆盖
    @TestCase
    func test_header_02(): Unit {
        var req1 = HttpRequestBuilder().header("123", "123").header("123", "123").header("123", "456").build()
        @Expect(ArrayList<String>(req1.headers.get("123")), ArrayList<String>(["123", "123", "456"]))
    }

    //对value空格的处理:前后删除，中间不处理
    @TestCase
    func test_header_03(): Unit {
        var tulple1 = [("abcd1", "    keep-alive"), ("abcd2", "keep-alive "), ("abcd3", "  keep-alive  ")]
        for ((name, value) in tulple1) {
            var req1 = HttpRequestBuilder().header(name, value).build()
            @Expect(ArrayList<String>(req1.headers.get(name)), ArrayList<String>(["keep-alive"]))
        }
    }

    //合法token
    @TestCase
    func test_addheaders_01(): Unit {
        var names = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNMa"]
        var header = HttpHeaders()
        for (name in names) {
            header.add(name, name)
        }
        var req1 = HttpRequestBuilder().addHeaders(header).build()
        @Expect(ArrayList<String>(req1.headers.get("1234567890")), ArrayList<String>(["1234567890"]))
    }

    //多次调用：新增；大小写：name转小写，value不变
    @TestCase
    func test_addheaders_02(): Unit {
        var header1 = HttpHeaders()
        header1.add("abc", "abc1")
        var header2 = HttpHeaders()
        header2.add("ABC", "abc1")
        header2.add("ABC", "Abc1")
        var req1 = HttpRequestBuilder().addHeaders(header1).addHeaders(header2).build()
        @Expect(ArrayList<String>(req1.headers.get("abc")), ArrayList<String>(["abc1", "abc1", "Abc1"]))
    }

    //合法token
    @TestCase
    func test_setheaders_01(): Unit {
        var names = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNMa"]
        for (name in names) {
            var header = HttpHeaders()
            header.add(name, name)
            var req1 = HttpRequestBuilder().setHeaders(header).build()
            @Expect(ArrayList<String>(req1.headers.get(name)), ArrayList<String>([name]))
        }
    }

    //多次调用
    @TestCase
    func test_setheaders_02(): Unit {
        var header1 = HttpHeaders()
        header1.add("abc", "abc1")
        var header2 = HttpHeaders()
        header2.add("ABC", "abc1")
        header2.add("ABC", "Abc1")
        var req1 = HttpRequestBuilder().setHeaders(header2).setHeaders(header1).build()
        @Expect(ArrayList<String>(req1.headers.get("abc")), ArrayList<String>(["abc1"]))
    }
}
