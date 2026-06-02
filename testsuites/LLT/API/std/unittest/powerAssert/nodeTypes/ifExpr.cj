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
public class TestIf {
    /**
     * Check if-branch.
     */
    @TestCase
    func case1(): Unit {
        let yes = true
        @PowerAssert(if (yes) { yes } != ())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}if (yes) { yes } != (){/COLOR})`
                    |   |___|  |___| |
                    |    true   true |
                    |________________|
                            ()
     */

    /**
     * Check else branch.
     */
    @TestCase
    func case2(): Unit {
        let no = false
        @PowerAssert(if (no) { throw Exception() } else { no })
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}if (no) { throw Exception() } else { no }{/COLOR})`
                        |__|                             |__|
                        false                            false
     */

    /**
     * Check condition throws.
     */
    @TestCase
    func case3(): Unit {
        let a = true
        @PowerAssert(if (a && (throw MyException()) && a) { false || true } else { true && false })
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}if ({/COLOR}{COLOR=YELLOW}a{/COLOR}{COLOR=GRAY} && ({/COLOR}{COLOR=RED}throw {/COLOR}{COLOR=YELLOW}MyException(){/COLOR}{COLOR=GRAY}) && a) { false || true } else { true && false }{/COLOR})`
                    |   |_|   |     |_____________||    |                                         |
                    |   true  |       MyException ||    |                                         |
                    |   |     |___________________||    |                                         |
                    |   |         [MyException]    |    |                                         |
                    |   |__________________________|    |                                         |
                    |   |      [not computed]           |                                         |
                    |   |_______________________________|                                         |
                    |             [not computed]                                                  |
                    |_____________________________________________________________________________|
                                                     [not computed]
     */

    /**
     * Check if-branch throws.
     */
    @TestCase
    func case4(): Unit {
        let yes = true
        @PowerAssert(if (yes) { yes && (throw MyException()) && yes } else { yes })
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}if ({/COLOR}{COLOR=YELLOW}yes{/COLOR}{COLOR=GRAY}) { {/COLOR}{COLOR=YELLOW}yes{/COLOR}{COLOR=GRAY} && ({/COLOR}{COLOR=RED}throw {/COLOR}{COLOR=YELLOW}MyException(){/COLOR}{COLOR=GRAY}) && yes } else { yes }{/COLOR})`
                    |   |___|  |___|   |     |_____________||      |              |
                    |    true  |true   |       MyException ||      |              |
                    |          |       |___________________||      |              |
                    |          |           [MyException]    |      |              |
                    |          |____________________________|      |              |
                    |          |       [not computed]              |              |
                    |          |___________________________________|              |
                    |                      [not computed]                         |
                    |_____________________________________________________________|
                                             [not computed]
     */

    /**
     * Check else-branch throws.
     */
    @TestCase
    func case5(): Unit {
        let no = false
        @PowerAssert(if (no) { no } else { no || (throw MyException()) || no })
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}if ({/COLOR}{COLOR=YELLOW}no{/COLOR}{COLOR=GRAY}) { no } else { {/COLOR}{COLOR=YELLOW}no{/COLOR}{COLOR=GRAY} || ({/COLOR}{COLOR=RED}throw {/COLOR}{COLOR=YELLOW}MyException(){/COLOR}{COLOR=GRAY}) || no }{/COLOR})`
                    |   |__|              |__|   |     |_____________||     | |
                    |   false             false  |       MyException ||     | |
                    |                     |      |___________________||     | |
                    |                     |          [MyException]    |     | |
                    |                     |___________________________|     | |
                    |                     |       [not computed]            | |
                    |                     |_________________________________| |
                    |                                [not computed]           |
                    |_________________________________________________________|
                                           [not computed]
     */

    /**
     * Check `if` with multiple expressions in block.
     */
    @TestCase
    func case6(): Unit {
        let yes = true
        @PowerAssert(if (yes) {
            let x = !yes || yes
            let y = x && !yes;
            y
        } else { false })
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}if (yes) { let x = !yes || yes; let y = x && !yes; y } else { false }{/COLOR})`
                        |___|          ||___|  |___|        |_|  ||___|| |
                         true          | true   true        true | true| |
                                       |____|      |        |    |____|| |
                                       |false      |        |     false| |
                                       |___________|        |_________|| |
                                            true               false   | |
                                                                       |_|
                                                                      false
     */

    /**
     * Check if-let.
     */
    @TestCase
    func case7(): Unit {
        let opt = Some(32)
        @PowerAssert(if (let Some(value) <- opt) { value + 5 } else { 0 } == 32)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}if (let Some(value) <- opt) { value + 5 } else { 0 } == 32{/COLOR})`
                    |                      |___|  |_____|   |            |
                    |                     Some(32)|  32     |            |
                    |                             |_________|            |
                    |                                  37                |
                    |____________________________________________________|
                                              37
     */
}
