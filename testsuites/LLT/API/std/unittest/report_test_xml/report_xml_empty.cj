/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./xmlparser
// EXEC: %compiler %cmp_opt -p xmlparser %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args --no-color

import xmlparser.*
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.time.*

main(): Unit {
    let dir = canonicalize(Path(".")).join("tmp")

    let packname = "any.pack"
    let casesname = "cases"
    let tp = TestGroup.builder(packname).add(TestSuite.builder(casesname).build()).build()

    let stampBefore = DateTime.now()
    let report = tp.runTests()
    let stampAfter = DateTime.now()
    report.reportTo(XmlReporter(dir))

    let reportPath = dir.join("tests").join("test-${packname}.${casesname}.xml")
    if (!exists(reportPath)) {
        throw Exception("Report file must exist")
    }

    let suite = TestSuiteXml.readFromFile(reportPath)

    if (suite.name != "${packname}.${casesname}") {
        throw Exception("Testsuite name mismatch: ${suite.name}")
    }
    if (suite.tests != 0) {
        throw Exception("Tests count mismatch: ${suite.tests}")
    }
    if (suite.failures != 0) {
        throw Exception("Failures count mismatch: ${suite.failures}")
    }
    if (suite.errors != 0) {
        throw Exception("Errors count mismatch: ${suite.errors}")
    }
    if (suite.skipped != 0) {
        throw Exception("Skipped count mismatch: ${suite.skipped}")
    }

    if (suite.timestamp > stampAfter || suite.timestamp < stampBefore) {
        throw Exception("Timestamp mismatch")
    }

    let actualDurationSeconds = Float64((stampAfter - stampBefore).toNanoseconds()) / 1_000_000_000.0
    if (suite.time > actualDurationSeconds) {
        throw Exception(
            "Time duration of testsuite mismatch: attributed ${suite.time} vs measured ${actualDurationSeconds}")
    }

    if (suite.testcases.size != 0) {
        throw Exception("Testcases count mismatch: ${suite.testcases.size}")
    }
}
