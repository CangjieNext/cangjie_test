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
     * Check lambda with argument.
     */
    @TestCase
    func case1(): Unit {
        let a = true
        @PowerAssert({ a: Bool => !a }(!a || a), true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}{ a: Bool => !a }(!a || a) == true{/COLOR})`
                    |            ||_| ||_|  |_||
                    |            |true|true true
                    |            |  | |__|    ||
                    |            |  | false   ||
                    |            |__| |_______||
                    |            false   true  |
                    |__________________________|
                                false
     */

    /**
     * Check lambda with arguments.
     */
    @TestCase
    func case1_1(): Unit {
        let a = true
        let boo = !a
        @PowerAssert({ a: Bool, b: Bool, c: Bool => !a }(!a || a, boo, { => boo }()), true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}{ a: Bool, b: Bool, c: Bool => !a }(!a || a, boo, { => boo }()) == true{/COLOR})`
                    |                              ||_| ||_|  |_||   ||    |___|   ||
                    |                              |true|true true   ||    false   ||
                    |                              |  | |__|    ||___||____________||
                    |                              |  | false   |false     false    |
                    |                              |__| |_______|                   |
                    |                              false   true                     |
                    |_______________________________________________________________|
                                                  false
     */
    /**
     * Check piped lambda.
     */
    @TestCase
    func case2(): Unit {
        let boo = true
        @PowerAssert((!boo || boo) |> { a: Bool => !a && boo }, true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}(!boo || boo) |> { a: Bool => !a && boo } == true{/COLOR})`
                    |||___|  |___|                ||_|      | |
                    || true   true                |true     | |
                    ||____|      |                |__|      | |
                    ||false      |                false     | |
                    ||___________|                |_________| |
                    |     true                       false    |
                    |_________________________________________|
                                       false
     */

    /**
     * Check lambdas compostion.
     */
    @TestCase
    func case3(): Unit {
        let foola = {a: Bool => !a}
        let barla = {a: Bool => a && !a}
        let a = true
        @PowerAssert(!a |> { a: Bool => a |> barla |>  { a: Bool => !a } |> foola }, true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}!a |> { a: Bool => a |> barla |> { a: Bool => !a } |> foola } == true{/COLOR})`
                    ||_|               |_|        |               ||_| |        | |
                    |true             false       |               false|        | |
                    |__|               |__________|               |__| |        | |
                    false              |   false                  true |        | |
                    |                  |_______________________________|        | |
                    |                  |              true                      | |
                    |                  |________________________________________| |
                    |                                     false                   |
                    |_____________________________________________________________|
                                                 false
     */

    /**
     * Check exception in argument evaluation.
     */
    @TestCase
    func case4(): Unit {
        let throwingArg: () -> Bool = {=> throw MyException()}
        let firstarg = false
        @PowerAssert({ a: Bool, b: Bool => !a && !b }(firstarg, throwingArg()), true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}{ a: Bool, b: Bool => !a && !b }({/COLOR}{COLOR=YELLOW}firstarg{/COLOR}{COLOR=GRAY}, {/COLOR}{COLOR=RED}throwingArg(){/COLOR}{COLOR=GRAY}) == true{/COLOR})`
                    |                                |________||_____________||       |
                    |                                   false   [MyException] |       |
                    |_________________________________________________________|       |
                    |                      [not computed]                             |
                    |_________________________________________________________________|
                                               [not computed]
     */

    /**
     * Check exception in argument evaluation in piped lambda.
     */
    @TestCase
    func case4_1(): Unit {
        let throwingArg: () -> Bool = {=> throw MyException()}
        let firstarg = false
        @PowerAssert((firstarg || throwingArg()) |> { a: Bool => !a })
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}({/COLOR}{COLOR=YELLOW}firstarg{/COLOR}{COLOR=GRAY} || {/COLOR}{COLOR=RED}throwingArg(){/COLOR}{COLOR=GRAY}) |> { a: Bool => !a }{/COLOR})`
                    ||________|  |_____________|                     |
                    ||  false     [MyException]|                     |
                    ||_________________________|                     |
                    |       [not computed]                           |
                    |________________________________________________|
                                      [not computed]
     */
}
