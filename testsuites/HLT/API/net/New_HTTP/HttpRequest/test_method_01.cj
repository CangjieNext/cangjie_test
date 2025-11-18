/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test method function
 * Test API: public func method(method: String): HttpRequestBuilder
 */

import std.collection.*
import stdx.net.http.*

@Test
class Test_HttpRequestBuilder_Method_01 {
    //合法方法, 仅一次
    @TestCase
    func test_method_01(): Unit {
        var methods = ["GET", "HEAD", "OPTIONS", "TRACE", "DELETE", "POST", "PUT", "CONNECT"]
        for (method in methods) {
            var req1 = HttpRequestBuilder().method(method).build()
            @Expect(req1.method, method)
        }
    }

    //默认方法：GET
    @TestCase
    func test_method_02(): Unit {
        var req1 = HttpRequestBuilder().build()
        @Expect(req1.method, "GET")
    }

    //method 多次调用：覆盖前值
    @TestCase
    func test_method_03(): Unit {
        var req1 = HttpRequestBuilder()
            .method("GET")
            .method("HEAD")
            .method("OPTIONS")
            .method("TRACE")
            .method("DELETE")
            .method("POST")
            .method("PUT")
            .method("CONNECT")
            .method("HEAD")
            .build()
        @Expect(req1.method, "HEAD")
        var req2 = HttpRequestBuilder().method("GET").method("HEAD").get().build()
        @Expect(req2.method, "GET")
        var req3 = HttpRequestBuilder().get().head().options().trace().delete().post().put().connect().build()
        @Expect(req3.method, "CONNECT")
        var req4 = HttpRequestBuilder().get().head().method("PUT").build()
        @Expect(req4.method, "PUT")
    }

    //大小写敏感
    @TestCase
    func test_method_04(): Unit {
        var req1 = HttpRequestBuilder().method("gEt").build()
        @Expect(req1.method, "gEt")
    }

    //非法token：为空
    @TestCase
    func test_method_05(): Unit {
        var methods = [" ", " TRACE", "DELETE ", "仓颉", "GET\n", "HEAD\0"]
        for (method in methods) {
            let e = @AssertThrows[HttpException](HttpRequestBuilder().method(method).build())
            @Expect(e.message.contains("method should be tokens"))
        }
    }
}
