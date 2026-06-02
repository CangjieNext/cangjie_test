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

func foo(a: Arg, b: Int64, c!: Arg) {
    false
}

func foo(x: Int64, y!: String = "foo") {
    y.size / x
}

func bar(x: Int64) {
    33
}

func throwing(): Int64 {
    throw Exception("Booo")
}

class Arg <: ToString {
    Arg(let x: Int64, let y!: Int64) {}
    public func toString() {
        "Arg(x:${x}, y:${y})"
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let s = "123"
        let a = 1
        @PowerAssert(foo(10, y: "test" + s) == foo(s.size, y: s) + bar(a))
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo(10, y: "test" + s) == foo(s.size, y: s) + bar(a){/COLOR})`
                    |          |        |_||  |   |_|    |   |_|| |   |_||
                    |          |       "123"  |  "123"   |  "123" |    1 |
                    |          |__________||  |   |______|      | |______|
                    |            "test123" |  |       3         |    33  |
                    |______________________|  |_________________|        |
                                0             |        1                 |
                                              |__________________________|
                                                           34
     */
    @TestCase
    func case2(): Unit {
        @PowerAssert(foo(Arg(0, y: 1), 2 + 3, c: Arg(4, y: 5)))
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo(Arg(0, y: 1), 2 + 3, c: Arg(4, y: 5)){/COLOR})`
                        |____________||_____|   |____________|
                         Arg(x:0, y:1)   5       Arg(x:4, y:5)
     */
    @TestCase
    func case3(): Unit {
        @PowerAssert(bar(1 + 2 + throwing() + 1) + 3 > 0)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}bar({/COLOR}{COLOR=YELLOW}1 + 2{/COLOR}{COLOR=GRAY} + {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY} + 1) + 3 > 0{/COLOR})`
                    |   |_____| |__________|   ||   |   |
                    |   |  3     [Exception]   ||   |   |
                    |   |__________________|   ||   |   |
                    |   |  [not computed]      ||   |   |
                    |   |______________________||   |   |
                    |        [not computed]     |   |   |
                    |___________________________|   |   |
                    |       [not computed]          |   |
                    |_______________________________|   |
                    |         [not computed]            |
                    |___________________________________|
                                [not computed]
     */
}
