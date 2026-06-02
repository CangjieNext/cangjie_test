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
 * Test description: Test httpOnly
 * Test API: prop httpOnly: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

@Test
class Test_Cookie_HttpOnly_01 {
    @TestCase
    func test_httpOnly_01(): Unit {
        var cookie = Cookie("name", "value", httpOnly: false)
        @Expect(cookie.httpOnly, false)
        cookie = Cookie("name", "value", httpOnly: true)
        @Expect(cookie.httpOnly, true)
    }

    // 默认值
    @TestCase
    func test_httpOnly_02(): Unit {
        var cookie = Cookie("name", "value")
        @Expect(cookie.httpOnly, false)
    }
}
