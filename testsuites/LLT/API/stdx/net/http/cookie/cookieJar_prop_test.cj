/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test CookieJar#prop
 * Test API:
 *       prop
 */
package tests.cookie

import stdx.net.http.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class TestCookieJarProp {
    @TestCase
    func cookieJarProp(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com", "co"]), true)
        println(cookieJar.isHttp)
        println(cookieJar.rejectPublicSuffixes)
        println("ok")
    }
}

/* SCAN-IN
true
[com, co]
ok
 */
