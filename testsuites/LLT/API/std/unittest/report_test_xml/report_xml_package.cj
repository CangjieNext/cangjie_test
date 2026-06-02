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
// EXEC-PIPE-0: %run %run_opt %output %run_args --no-color 2>&1 | compare %f

// ASSERT: scan simple is executing

import xmlparser.*
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.time.*
import std.collection.*

main(): Unit {
    let dir = canonicalize(Path(".")).join("tmp")

    let packname = "any.pack"
    let casesname = "cases"
    let tc1name = "simple"
    let tc2name = "simplefailed"
    let tp = TestGroup
        .builder(packname)
        .add(
            TestSuite
                .builder(casesname)
                .add(UnitTestCase.create(tc1name) {=> println("simple is executing")})
                .add(
                    UnitTestCase.create(tc2name) {
                        =>
                        @Assert(true)
                        @Assert(false)
                    }
                )
                .build())
        .build()

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
    if (suite.tests != 2) {
        throw Exception("Tests count mismatch: ${suite.tests}")
    }
    if (suite.failures != 1) {
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

    if (suite.testcases.size != 2) {
        throw Exception("Testcases count mismatch: ${suite.testcases.size}")
    }
    var casesDurationSeconds = 0.0
    for (tc in suite.testcases) {
        casesDurationSeconds += tc.time
        match (tc.name) {
            case simple where simple == tc1name =>
                if (tc.assertions != 0) {
                    throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
                }
                if (!tc.data.isPassed) {
                    throw Exception("${tc.name} must be passed")
                }
            case failed where failed == tc2name =>
                if (tc.assertions != 2) {
                    throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
                }
                if (!tc.data.isFailed) {
                    throw Exception("${tc.name} must be failed")
                }
            case unknown => throw Exception("unexpected testcase name: ${unknown}")
        }
    }

    if (casesDurationSeconds - suite.time > 1e-5) {
        throw Exception("Tests duration mismatch between testsuite and cases")
    }
}
