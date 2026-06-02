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
 * Test description: Test others
 * Test API: prop others: ArrayList<String>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Cookie_Others_01 {
    @TestCase
    func test_others_01(): Unit {
        var res = HttpResponseBuilder().header("Set-Cookie", "1234=abcd; 111111; 2222").build()
        var cookies = CookieJar.parseSetCookieHeader(res)
        @Expect(cookies[0].cookieName, "1234")
        @Expect(cookies[0].cookieValue, "abcd")
        @Expect(cookies[0].others, ArrayList<String>(["111111", "2222"]))
    }
}
