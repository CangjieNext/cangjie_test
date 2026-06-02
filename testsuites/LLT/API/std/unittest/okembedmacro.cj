/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan TOTAL: 1, SKIPPED: 1, PASS: 0, FAILED: 0, ERROR: 0
package pkgA

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

@Test
public class MyTestCls {
    @TestCase
    @Skip
    func myCase1(): Unit {
        println("This is case no.1")
    }
}
