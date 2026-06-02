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
 * Test description: Test some parameters can be changed after build
 * Test API: public prop headers: HttpHeaders
 *           public prop trailers: HttpHeaders
 */

import std.collection.*
import stdx.net.http.*
import stdx.encoding.url.*

@Test
class Test_HttpRequest_Modify {
    //获取后，可通过调用 HttpHeaders 实例成员函数，修改该请求的 headers
    @TestCase
    func test_headers(): Unit {
        var req = HttpRequestBuilder().header("123", "123").build()
        req.headers.set("123", "456")
        @Expect(ArrayList<String>(req.headers.get("123")), ArrayList<String>(["456"]))
    }

    //获取后，可通过调用 HttpHeaders 实例成员函数，修改该请求的 trailers
    @TestCase
    func test_trailers(): Unit {
        var req = HttpRequestBuilder().trailer("123", "123").build()
        req.trailers.set("123", "456")
        @Expect(ArrayList<String>(req.trailers.get("123")), ArrayList<String>(["456"]))
    }
}
