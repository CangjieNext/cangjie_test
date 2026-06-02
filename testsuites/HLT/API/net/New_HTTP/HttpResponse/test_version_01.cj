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
 * Test API: public func version(version: Protocol): HttpResponseBuilder
 */

import stdx.net.http.*

@Test
class Test_HttpResponse_Version_01 {
    // test default version
    @TestCase
    func test_version_01(): Unit {
        var res = HttpResponseBuilder().build()
        @Expect(res.version, HTTP1_1)
    }

    // test version already set
    @TestCase
    func test_version_02(): Unit {
        var res1 = HttpResponseBuilder().version(HTTP1_1).build()
        @Expect(res1.version, HTTP1_1)
        var res2 = HttpResponseBuilder().version(HTTP2_0).build()
        @Expect(res2.version, HTTP2_0)

        // 多次调用
        var res3 = HttpResponseBuilder().version(HTTP1_1).version(HTTP2_0).build()
        @Expect(res3.version, HTTP2_0)
    }
}
