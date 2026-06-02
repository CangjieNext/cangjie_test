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

func foo() {
    true
}

func fooThrowing(): Bool {
    throw Exception("Booo")
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        @PowerAssert(foo() != true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo() != true{/COLOR})`
                    |_____|
                      true

     */
    @TestCase
    func case2(): Unit {
        @PowerAssert(fooThrowing())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=RED}fooThrowing(){/COLOR})`
                    |_____________|
                      [Exception]
     */
    @TestCase
    func case3(): Unit {
        @PowerAssert(fooThrowing() || !fooThrowing())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=RED}fooThrowing(){/COLOR}{COLOR=GRAY} || !fooThrowing(){/COLOR})`
                    |_____________|                 |
                    | [Exception]                   |
                    |_______________________________|
                              [not computed]
     */
}
