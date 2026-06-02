/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan-1 [ PASSED ] CASE: T1_c1
// ASSERT: scan-1 [ PASSED ] CASE: T2
// ASSERT: scan-12 [ PASSED ] CASE: S1_c
// ASSERT: scan-5 [ PASSED ] CASE: S2_c
// ASSERT: scan-17 --X--
// ASSERT: scan TOTAL: 19

import std.unittest.*
import std.unittest.testmacro.*

@Test
class T1 {
    @TestCase
    func T1_c1() {
    }
}

@TestBuilder
func f(): TestSuite {
    let builder = TestSuite.builder("S1")
    for (i in 0..6) {
        builder.add(createTest("S1_c${i}"))
    }
    builder.build()
}

@TestBuilder
func g(): TestSuite {
    let builder = TestSuite.builder(f()).setName("S2")
    for (i in 0..5) {
        builder.add(createTest("S2_c${i}"))
    }
    builder.build()
}

@Test
func T2() {
}

func createTest(name: String): UnitTestCase {
    UnitTestCase.create(name) {=> println("--X--")}
}
