/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

class A <: ToString {
    var a = 10
    public override func toString() {
        "class A"
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = 10
        @PowerAssert((A().a = 13) != ())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}(A().a = 13) != (){/COLOR})`
                     |___|      |
                    class A     |
                     |__________|
                          ()
     */
    @TestCase
    func case2(): Unit {
        let throwing: () -> Int64 = {=> throw Exception()}
        var a = 10
        @PowerAssert((a = 1) != (A().a = throwing()))
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}({/COLOR}{COLOR=YELLOW}a = 1{/COLOR}{COLOR=GRAY}) != (A().a = {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY}){/COLOR})`
                    ||_____|    |       |__________||
                    |   ()      |        [Exception]|
                    |           |__________________||
                    |              [not computed]   |
                    |_______________________________|
                              [not computed]
     */
}
