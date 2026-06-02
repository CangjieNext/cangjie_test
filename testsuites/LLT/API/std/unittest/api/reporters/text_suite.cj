/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %output %run_args >%f.out
// RUN-EXEC: %diff %f.out text_suite.txt

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.fs.*

main() {
    let report = TestSuite
        .builder("suite_name")
        .add(UnitTestCase.create("testCase1") {
            => @Fail("must fail")
        })
        .add(UnitTestCase.createParameterized("testCase2", [1, 2, 3]) {
            x => // success ()
        })
        .build()
        .runTests()

    report.reportTo(ConsoleReporter(colored: false))
    let text = report.reportTo(TextReporter(into: PrettyText()))
    if (exists("text_suite.txt")) {
        remove("text_suite.txt")
    }
    File.create("text_suite.txt").write(text.toString().toArray())
}
