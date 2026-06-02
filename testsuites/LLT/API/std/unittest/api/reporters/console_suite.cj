/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args 

// ASSERT: scan-1: PASSED: 1
// ASSERT: scan-1: FAILED: 1, listed below:
// ASSERT: scan-1: TCS: suite_name, CASE: testCase1
// ASSERT: TCS: suite_name, time elapsed: 
// ASSERT: [ PASSED ] CASE: testCase2 
// ASSERT: [ FAILED ] CASE: testCase1 

import std.unittest.*
import std.unittest.testmacro.*

main() {
    TestSuite
        .builder("suite_name")
        .add(UnitTestCase.create("testCase1") {
            => @Fail("must fail")
        })
        .add(UnitTestCase.createParameterized("testCase2", [1, 2, 3]) {
            x => // success ()
        })
        .build()
        .runTests()
        .reportTo(ConsoleReporter(colored: false))
}
