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
 * Test description: Test secure
 * Test API: prop secure: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

@Test
class Test_Cookie_Secure_01 {
    @TestCase
    func test_secure_01(): Unit {
        var cookie = Cookie("name", "value", secure: false)
        @Expect(cookie.secure, false)
        cookie = Cookie("name", "value", secure: true)
        @Expect(cookie.secure, true)
    }

    // 默认值
    @TestCase
    func test_secure_02(): Unit {
        var cookie = Cookie("name", "value")
        @Expect(cookie.secure, false)
    }
}
