/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan testCase1 must fail

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

main() {
    var reporter = PrettyText()
    TestSuite
        .builder("suite_name")
        .add(UnitTestCase.create("testCase1") {
            => @Fail("testCase1 must fail")
        })
        .add(UnitTestCase.createParameterized<Int64>("testCase2", [1, 2, 3]) {
            x => // success ()
        })
        .build()
        .runTests()
        .reportTo(TextReporter(into: reporter))
    @Expect(reporter.isEmpty(), false)
    println(reporter.toString())
    return 0
}
