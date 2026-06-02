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
 * Test description: Test legal and illegal cookieValue
 * Test API: prop cookieValue: String
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

@Test
class Test_Cookie_CookieValue_01 {
    // 合法字符:%x21 / %x23-2B / %x2D-3A / %x3C-5B / %x5D-7E
    // US-ASCII 字符，不包括 CTLs, 空白，逗号，分号，和反斜杠
    @TestCase
    func test_cookievalue_01(): Unit {
        var cookievalues = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "/", ":", "<", "=", ">", "?", "@", "^",
            "_", "`", "|", "~", "{", "}", "1234567890", "[]", "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNM"]
        for (cookievalue in cookievalues) {
            var cookie = Cookie("name", cookievalue)
            @Expect(cookie.cookieValue, cookievalue)
        }
    }

    //value为空合法
    @TestCase
    func test_cookievalue_02(): Unit {
        var cookie = Cookie("abc", "")
        @Expect(cookie.cookieValue, "")
    }

    //value含非法字符抛异常
    @TestCase
    func test_cookievalue_03(): Unit {
        var cookievalues = ["\r", "\n", "\0", "仓颉", " ", ",", ";", "\\"]
        for (cookievalue in cookievalues) {
            try {
                var _ = Cookie("123", cookievalue)
                @Expect(1, 2)
            } catch (e: IllegalArgumentException) {
            }
        }
    }
}
