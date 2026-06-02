/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color --death-aware 2>&1 | compare %f
// ASSERT: scan-1 Crashed with exit code 2.
// ASSERT: scan-1 Crashed with exit code 3.
// ASSERT: scan PASSED: 3
// ASSERT: scan ERROR: 2
// ASSERT: scan-5 ---XX---

import std.unittest.*
import std.unittest.testmacro.*
import std.process.*

@TestBuilder
func g(): TestSuite {
    let builder = TestSuite.builder("suite")
    for (i in 0..5) {
        builder.add(createTest("case ${i}", i))
    }
    builder.build()
}

func createTest(name: String, i: Int64): UnitTestCase {
    UnitTestCase.create(name) {
        =>
        println("---XX---")
        if (i == 2 || i == 3) {
            Process.current.exit(i)
        }
    }
}
