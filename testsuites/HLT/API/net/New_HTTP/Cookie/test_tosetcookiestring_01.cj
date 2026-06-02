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
 * Test description: Test toSetCookieString method
 * Test API: public func toSetCookieString(): String
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.time.*

@Test
class Test_Cookie_ToSetCookieString_01 {
    @TestCase
    func test_01(): Unit {
        var cookie1 = Cookie("1", "9")
        var cookie2 = Cookie("a", "z", expires: DateTime.now(), maxAge: 6666, domain: "abc.com", path: "/aaa",
            secure: true, httpOnly: true)
        var cookie3 = Cookie("A", "Z", expires: DateTime.now(), maxAge: 6666, domain: "abc.com", path: "/aaa/bbb",
            secure: false, httpOnly: false)
        @Expect(cookie1.toSetCookieString().contains("1=9"), true)
        @Expect(cookie2.toSetCookieString().contains("a=z"), true)
        @Expect(cookie2.toSetCookieString().contains("Max-Age=6666; Domain=abc.com; Path=/aaa; Secure; HttpOnly"), true)
        @Expect(cookie3.toSetCookieString().contains("A=Z"), true)
        @Expect(cookie3.toSetCookieString().contains("Secure"), false)
        @Expect(cookie3.toSetCookieString().contains("HttpOnly"), false)
    }
}
