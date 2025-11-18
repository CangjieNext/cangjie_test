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
 * Test description: Test Connection: isPersistent function
 * Test API: public prop isPersistent: Bool
 */

import stdx.net.http.*

@Test
class Test_HttpRequestBuilder_Connection_Close {
    //合法方法
    @TestCase
    func test_01(): Unit {
        var req1 = HttpRequestBuilder().header("Connection", "close").build()
        var req2 = HttpRequestBuilder().header("Connection", "close").header("Connection", "close").build()
        var req3 = HttpRequestBuilder().header("Connection", "close").header("Connection", "keep-alive").build()
        @Expect(req1.isPersistent, false)
        @Expect(req2.isPersistent, false)
        @Expect(req3.isPersistent, false)
    }

    //默认方法：Connection: keep-alive
    @TestCase
    func test_02(): Unit {
        var req1 = HttpRequestBuilder().build()
        @Expect(req1.isPersistent, true)
    }
}
