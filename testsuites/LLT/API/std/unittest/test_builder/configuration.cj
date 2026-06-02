/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color --filter=S2.S1_c* 2>&1 | compare %f
// ASSERT: scan-3 [ PASSED ] CASE: S1_c
// ASSERT: scan-3 [ FAILED ] CASE: S1_c
// ASSERT: scan TCS: S2
// ASSERT: scan-not TCS: S1
// ASSERT: scan TOTAL: 19
// ASSERT: scan PASSED: 3
// ASSERT: scan SKIPPED: 13
// ASSERT: scan FAILED: 3

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
        builder.add(createTest("S1_c${i}", i % 2 == 0))
    }
    builder.build()
}

@TestBuilder
func g(): TestSuite {
    let builder = TestSuite.builder(f()).setName("S2")
    for (i in 0..5) {
        builder.add(createTest("S2_c${i}", i == 3))
    }
    builder.build()
}

@Test
func T2() {
    @Fail("failed")
}

func createTest(name: String, failing: Bool): UnitTestCase {
    UnitTestCase.create(name) {
        =>
        println("X")
        @Assert(!failing)
    }
}
