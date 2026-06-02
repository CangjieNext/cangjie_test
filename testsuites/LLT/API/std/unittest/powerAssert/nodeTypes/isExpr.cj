/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT scan-not REASON:

import std.unittest.*
import std.unittest.testmacro.*

interface Foo {}

@Test
public class TestA {
    func checkMyFoo(x: ToString) {
        @PowerAssert(x is Foo)
    }

    @TestCase
    func case1(): Unit {
        let x = "Not Foo"
        checkMyFoo(x)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}x is Foo{/COLOR})`
                    |_|
                  Not Foo
     */
    @TestCase
    func case2(): Unit {
        let x = "Not Foo"
        @PowerAssert(x is Foo, "Foo" is String)
    }
    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}x is Foo == "Foo" is String{/COLOR})`
                    |_|      |  |_______________|
                 "Not Foo"   |         true
                    |________|
                       false
     */
}
