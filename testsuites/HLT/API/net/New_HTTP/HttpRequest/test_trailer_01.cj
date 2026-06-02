/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test positive trailer function
 * Test API: public func trailer(key: String, value: String): HttpRequestBuilder
 *           public func addTrailers(trailers: HttpHeaders): HttpRequestBuilder
 *           public func setTrailers(trailers: HttpHeaders): HttpRequestBuilder
 */

import std.collection.*
import stdx.net.http.*

@Test
class Test_HttpRequestBuilder_Trailer_01 {
    //合法token
    @TestCase
    func test_trailer_01(): Unit {
        var names = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNMa"]
        for (name in names) {
            var req1 = HttpRequestBuilder().trailer(name, name).build()
            @Expect(ArrayList<String>(req1.trailers.get(name)), ArrayList<String>([name]))
        }
    }

    //多次调用: 新增，重复者不覆盖
    @TestCase
    func test_trailer_02(): Unit {
        var req1 = HttpRequestBuilder().trailer("123", "123").trailer("123", "123").trailer("123", "456").build()
        @Expect(ArrayList<String>(req1.trailers.get("123")), ArrayList<String>(["123", "123", "456"]))
        @Expect(ArrayList<String>(req1.headers.get("123")), ArrayList<String>([]))
    }

    //对value空格的处理:前后删除，中间不处理
    @TestCase
    func test_trailer_03(): Unit {
        var tulple1: Array<(String, String)> = [("abcd1", "    keep-alive"), ("abcd2", "keep-alive "),
            ("abcd3", "  keep-alive  ")]
        for ((name, value) in tulple1) {
            var req1 = HttpRequestBuilder().trailer(name, value).build()
            @Expect(ArrayList<String>(req1.trailers.get(name)), ArrayList<String>(["keep-alive"]))
        }
    }

    //合法token
    @TestCase
    func test_addtrailers_01(): Unit {
        var names = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNMa"]
        var header = HttpHeaders()
        for (name in names) {
            header.add(name, name)
        }
        var req1 = HttpRequestBuilder().addTrailers(header).build()
        @Expect(ArrayList<String>(req1.trailers.get("1234567890")), ArrayList<String>(["1234567890"]))
    }

    //多次调用：新增；大小写：name转小写，value不变
    @TestCase
    func test_addtrailers_02(): Unit {
        var header1 = HttpHeaders()
        header1.add("abc", "abc1")
        var header2 = HttpHeaders()
        header2.add("ABC", "abc1")
        header2.add("ABC", "Abc1")
        var req1 = HttpRequestBuilder().addTrailers(header1).addTrailers(header2).build()
        @Expect(ArrayList<String>(req1.trailers.get("abc")), ArrayList<String>(["abc1", "abc1", "Abc1"]))
    }

    //合法token
    @TestCase
    func test_settrailers_01(): Unit {
        var names = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNMa"]
        for (name in names) {
            var header = HttpHeaders()
            header.add(name, name)
            var req1 = HttpRequestBuilder().setTrailers(header).build()
            @Expect(ArrayList<String>(req1.trailers.get(name)), ArrayList<String>([name]))
        }
    }

    //多次调用
    @TestCase
    func test_settrailers_02(): Unit {
        var header1 = HttpHeaders()
        header1.add("abc", "abc1")
        var header2 = HttpHeaders()
        header2.add("ABC", "abc1")
        header2.add("ABC", "Abc1")
        var req1 = HttpRequestBuilder().setTrailers(header2).setTrailers(header1).build()
        @Expect(ArrayList<String>(req1.trailers.get("abc")), ArrayList<String>(["abc1"]))
    }
}
