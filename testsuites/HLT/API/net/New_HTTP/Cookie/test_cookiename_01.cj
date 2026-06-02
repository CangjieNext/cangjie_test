/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test legal and illegal cookieName
 * Test API: prop cookieName: String
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

@Test
class Test_Cookie_CookieName_01 {
    //合法token
    @TestCase
    func test_cookiename_01(): Unit {
        var cookienames = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNM"]
        for (cookiename in cookienames) {
            var cookie = Cookie(cookiename, "abc")
            @Expect(cookie.cookieName, cookiename)
        }
    }

    //name为空抛异常
    @TestCase
    func test_cookiename_02(): Unit {
        try {
            var _ = Cookie("", "abc")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
    }

    //name含非token抛异常
    @TestCase
    func test_cookiename_03(): Unit {
        var cookienames = ["\r", "\n", "\0", "仓颉", ":", ";"]
        for (cookiename in cookienames) {
            try {
                var _ = Cookie(cookiename, "abc")
                @Expect(1, 2)
            } catch (e: IllegalArgumentException) {
            }
        }
    }
}
