/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    @TestCase
    func caseString(): Unit {
        @PowerAssert("abcde" + "f" == "f")
    }

    /* SCAN-IN
    Assert Failed: `("abcde" + "f" == "f")`
                    |_____________|
                        "abcdef"
     */
    func roo(r: Rune) {
        r
    }

    @TestCase
    func caseRune(): Unit {
        @PowerAssert(roo(r'a') != r'a')
    }

    /* SCAN-IN
    Assert Failed: `(roo(r'a') != r'a')`
                    |_________|
                        'a'
     */
    func uuu(a: Any) {
        ()
    }

    @TestCase
    func caseUnit(): Unit {
        @PowerAssert(uuu(()) != ())
    }

    /* SCAN-IN
    Assert Failed: `(uuu(()) != ())`
                    |_______|
                        ()
     */
    @TestCase
    func caseInt(): Unit {
        @PowerAssert(5 + 3 / 2 == 4)
    }

    /* SCAN-IN
    Assert Failed: `(5 + 3 / 2 == 4)`
                    |   |_____|
                    |      1  |
                    |_________|
                         6
     */
}
