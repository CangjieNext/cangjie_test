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
 * Test description: Test version function
 * Test API: public func version(version: Protocol): HttpRequestBuilder
 */

import stdx.net.http.*

@Test
class Test_HttpRequestBuilder_Version_01 {
    //合法方法, 仅一次
    @TestCase
    func test_version_01(): Unit {
        var req1 = HttpRequestBuilder().version(HTTP1_1).build()
        var req2 = HttpRequestBuilder().version(HTTP2_0).build()
        @Expect(req1.version, HTTP1_1)
        @Expect(req2.version, HTTP2_0)
    }

    //默认方法：""
    @TestCase
    func test_version_02(): Unit {
        var req1 = HttpRequestBuilder().build()
        @Expect(req1.version.toString(), "HTTP/1.1")
    }

    //合法方法: 多次--覆盖前值
    @TestCase
    func test_version_03(): Unit {
        var req1 = HttpRequestBuilder().version(HTTP1_1).version(HTTP2_0).build()

        @Expect(req1.version, HTTP2_0)
    }
}
