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

class A {
    func foo() {
        1
    }
}

extend Int64 {
    func foo() {
        2
    }
}

func foo() {
    2
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = A()
        @PowerAssert((A().foo() + foo()).foo() == foo().foo() + -0.foo() / 99999.foo())
    }
}

/* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}(A().foo() + foo()).foo() == foo().foo() + -0.foo() / 99999.foo(){/COLOR})`
                    ||_________| |_____|      |  |_____|     | ||_______| |___________|
                    ||    1         2  |      |  |  2        | |    2   |       2     |
                    ||_________________|      |  |___________| |________|             |
                    |         3               |  |     2       |   -2                 |
                    |_________________________|  |             |______________________|
                                 2               |                        -1          |
                                                 |____________________________________|
                                                                    1
 */
