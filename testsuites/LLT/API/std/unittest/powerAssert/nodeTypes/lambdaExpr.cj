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

class MyException <: Exception & ToString {
    MyException() {
        super()
    }

    public func toString() {
        "MyException"
    }
}

@Test
public class TestLambda {
    /**
     * Check simple lambda.
     */
    @TestCase
    func case1(): Unit {
        @PowerAssert({ => false }(), true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}{ => false }() == true{/COLOR})`
                    |______________|
                          false
     */

    /**
     * Check lambda with arguments.
     */
    @TestCase
    func case2(): Unit {
        @PowerAssert({ p1: Int64, p2: Int64 => p1 < 10 || p2 > 10 }(10, 0), true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}{ p1: Int64, p2: Int64 => p1 < 10 || p2 > 10 }(10, 0) == true{/COLOR})`
                    |                         |__|    |  |__|    |        |
                    |                         |10     |  | 0     |        |
                    |                         |_______|  |_______|        |
                    |                         | false      false |        |
                    |                         |__________________|        |
                    |                                 false               |
                    |_____________________________________________________|
                                             false
     */

    /**
     * Check exception inside lambda handled correctly.
     */
    @TestCase
    func case3(): Unit {
        let throwing: () -> Bool = {=> throw MyException()}
        @PowerAssert({ => throwing() }(), true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}{ => {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY} }() == true{/COLOR})`
                    |    |__________|   |       |
                    |    [MyException]  |       |
                    |___________________|       |
                    |   [not computed]          |
                    |___________________________|
                            [not computed]
     */
}
