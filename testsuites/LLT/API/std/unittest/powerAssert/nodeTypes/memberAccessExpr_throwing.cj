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

extend Int64 {
    prop xxx: String {
        get() {
            "123"
        }
    }
    prop yyy: String {
        get() {
            throw MyException()
        }
    }
    func reverse() {
        this * -1
    }
}

class A {
    var y = 43
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = 10
        @PowerAssert(A().y == a.xxx.size - -10.xxx.size.reverse().yyy.size)
    }
}

/* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}A().y{/COLOR}{COLOR=GRAY} == {/COLOR}{COLOR=YELLOW}a.xxx.size{/COLOR}{COLOR=GRAY} - -{/COLOR}{COLOR=YELLOW}10.xxx.size.reverse(){/COLOR}{COLOR=RED}.yyy{/COLOR}{COLOR=GRAY}.size{/COLOR})`
                    |_____|  |_|   |    | ||______|    |         |   |    |
                    |  43    |10   |    | || "123"     |         |   |    |
                    |        |_____|    | ||___________|         |   |    |
                    |        |"123"     | ||     3               |   |    |
                    |        |__________| ||_____________________|   |    |
                    |        |     3      ||          -3             |    |
                    |        |            ||_________________________|    |
                    |        |            ||      [MyException]           |
                    |        |            ||______________________________|
                    |        |            |         [not computed]        |
                    |        |            |_______________________________|
                    |        |                      [not computed]        |
                    |        |____________________________________________|
                    |                        [not computed]               |
                    |_____________________________________________________|
                                         [not computed]
 */
