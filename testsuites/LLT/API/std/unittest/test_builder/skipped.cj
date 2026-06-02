/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan PASSED: 2, SKIPPED: 6

import std.unittest.*
import std.unittest.testmacro.*
import std.process.*
import std.unittest.*
import std.unittest.testmacro.*

func createTest() {
    UnitTestCase.create("foo") {}
}

@TestBuilder
@Skip
func f1(): TestSuite {
    TestSuite.builder("suite1").add(createTest()).build()
}

@TestBuilder
func f2(): TestSuite {
    TestSuite.builder("suite2").add(createTest()).add(createTest()).build()
}

@TestBuilder
@Skip
func f3(): TestSuite {
    let builder = TestSuite.builder("suite3")
    for (_ in 0..5) {
        builder.add(createTest())
    }
    builder.build()
}
