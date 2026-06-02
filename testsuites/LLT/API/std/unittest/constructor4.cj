/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args | compare %f
// ASSERT: scan TOTAL: 1
// ASSERT: regex .*FAILED.*: 0
// ASSERT: scan ERROR: 0

package A

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion
import std.io.*

@Test
class MyClass {
    var width: Int64 = 10
    init() {
        this.width = 10
    }
    init(width: Int64) {
        this.width = width
    }
    @TestCase
    func myCase1(): Unit {
        println("This is case no.1")
    }
}
