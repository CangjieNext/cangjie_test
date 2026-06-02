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

func foo<T>(arg: T): T {
    arg
}

func foo2<T1, T2>(arg1: T1, arg2: T2) {
    false
}

func fooThrowing<T>(arg: T): T {
    throw Exception("Booo")
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        @PowerAssert(foo<Bool>(true) != true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo<Bool>(true) != true{/COLOR})`
                    |_______________|
                           true
     */
    @TestCase
    func case2(): Unit {
        @PowerAssert(foo<Bool>(true || false) != true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo<Bool>(true || false) != true{/COLOR})`
                    |         |_____________||
                    |               true     |
                    |________________________|
                               true
     */
    @TestCase
    func case3(): Unit {
        @PowerAssert(foo2<Bool, Int64>(true, 123) == true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo2<Bool, Int64>(true, 123) == true{/COLOR})`
                    |____________________________|
                                 false
     */
    @TestCase
    func case4(): Unit {
        @PowerAssert(fooThrowing<Bool>(false))
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=RED}fooThrowing<Bool>(false){/COLOR})`
                    |________________________|
                            [Exception]
     */
    @TestCase
    func case5(): Unit {
        @PowerAssert(fooThrowing<Bool>(true) || !fooThrowing<Int64>(2) == 2)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=RED}fooThrowing<Bool>(true){/COLOR}{COLOR=GRAY} || !fooThrowing<Int64>(2) == 2{/COLOR})`
                    |_______________________|                              |
                    |      [Exception]                                     |
                    |______________________________________________________|
                                         [not computed]
     */
}
