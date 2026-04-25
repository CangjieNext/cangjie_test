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
 * Test description: Test legal and illegal maxAge
 * Test API: prop maxAge: ?Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

@Test
class Test_Cookie_MaxAge_01 {
    // 合法值：大于0
    @TestCase
    func test_maxage_01(): Unit {
        var cookie = Cookie("name", "value", maxAge: 1)
        @Expect(cookie.maxAge, 1)
        cookie = Cookie("name", "value", maxAge: 100000000)
        @Expect(cookie.maxAge, 100000000)
    }

    // 默认值
    @TestCase
    func test_maxage_02(): Unit {
        var cookie = Cookie("name", "value")
        @Expect(cookie.maxAge, None)
    }

    // 非法值：小于等于0抛异常
    @TestCase
    func test_maxage_03(): Unit {
        try {
            var _ = Cookie("name", "value", maxAge: 0)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
        try {
            var _ = Cookie("name", "value", maxAge: -1)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
    }
}
