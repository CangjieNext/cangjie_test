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
class EscapeSeqTest {
    @TestCase
    func rune() {
        let a = r'\''
        let b = r'"'
        @PowerAssert(a, b)
    }

    /* SCAN-IN
    Assert Failed: `(a == b)`
                    |_|  |_|
                    '\'' '"'
     */
    @TestCase
    func string() {
        let left = "ab\tcd\n\\ \\\\ \""
        let right = #""ab\cd""#
        @PowerAssert(left, right)
    }

    /* SCAN-IN
    Assert Failed: `(left == right)`
                    |____|  |     |
             "ab\tcd\n\\ \\\\ \"" |
                            |_____|
                          "\"ab\\cd\""
     */
    @TestCase
    func other() {
        let data = Data()
        @PowerAssert(data.no)
    }

    /* SCAN-IN
    Assert Failed: `(data.no)`
                    |____|
                 Data("a\ny")
     */
    @TestCase
    func literals() {
        let left = ""
        @PowerAssert(left == ##"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$"## + "")
    }

    /* SCAN-IN
    Assert Failed: `(left == ##"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$"## + "")`
                    |____|  |_____________________________________________________|
                      ""       "^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)$"
     */
}

class Data <: ToString {
    public func toString() {
        "Data(\"a\ny\")"
    }

    prop no: Bool {
        get() {
            false
        }
    }
}
