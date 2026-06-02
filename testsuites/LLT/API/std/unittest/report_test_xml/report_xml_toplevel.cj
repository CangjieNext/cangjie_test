/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./xmlparser
// EXEC: %compiler %cmp_opt -p xmlparser %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output %cmp_utest_opt
// EXEC-1: %run %run_opt %output %run_args %run_utest_opt --no-color --reportFormat=xml --reportPath=tmp
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args --no-color

import xmlparser.*
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.time.*
import std.regex.*
import std.collection.*

@Test
func foo() {
    @Assert(true)
}

@Test
func foo5() {
    @Assert(true)
    @Assert(true || !true)
    @Expect(true || false)
    @Expect(false || !false)
    @Expect(true)
}

@Test
func bar() {
    @Assert(false)
}

@Test
func foobar() {
    throw IllegalStateException("it's an error case")
}

@Test
@Skip
func barfoo() {
    @Assert(false) // should not be failed: skipped
}

func checkReport(dir: Path, fooname: String) {
    let reportPath = dir.join("test-default.TestCase_${fooname}.xml")
    if (!exists(reportPath)) {
        throw Exception("Report file of ${fooname} must exist")
    }

    let report = TestSuiteXml.readFromFile(reportPath)

    if (report.tests != 1) {
        throw Exception("Tests count mismatch: ${report.tests}")
    }
    if (report.name != "default.TestCase_${fooname}") {
        throw Exception("Testuite name mismatch: ${report.name}")
    }

    if (report.testcases.size != 1) {
        throw Exception("Expected exactly 1 testcase for ${fooname}")
    }
    let tc = report.testcases[0]

    match (fooname) {
        case "foo" =>
            if (tc.assertions != 1) {
                throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
            }
            if (!tc.data.isPassed) {
                throw Exception("${tc.name} must be passed")
            }
            if (tc.time < 0.0) {
                throw Exception("negative duration")
            }
        case "foo5" =>
            if (tc.assertions != 5) {
                throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
            }
            if (!tc.data.isPassed) {
                throw Exception("${tc.name} must be passed")
            }
            if (tc.time < 0.0) {
                throw Exception("negative duration")
            }
        case "bar" =>
            if (report.failures != 1) {
                throw Exception("Testsuite failures mismatch: ${report.failures}")
            }
            if (tc.assertions != 1) {
                throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
            }
            if (!tc.data.isFailed) {
                throw Exception("${tc.name} must be failed")
            }
            if (tc.time < 0.0) {
                throw Exception("negative duration")
            }
        case "foobar" =>
            if (report.errors != 1) {
                throw Exception("Testsuite errors mismatch: ${report.errors}")
            }
            if (tc.assertions != 0) {
                throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
            }
            if (!tc.data.isError) {
                throw Exception("${tc.name} must be passed")
            }
            if (tc.time < 0.0) {
                throw Exception("negative duration")
            }
        case "barfoo" =>
            if (report.skipped != 1) {
                throw Exception("Testsuite skipped mismatch: ${report.skipped}")
            }
            if (tc.assertions != 0) {
                throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
            }
            if (!tc.data.isSkipped) {
                throw Exception("${tc.name} must be passed")
            }
            if (tc.time != 0.0) {
                throw Exception("non-zero duration")
            }
        case unknown => throw Exception("Unexpected testcase: ${unknown}")
    }
}

main(): Unit {
    let dir = canonicalize(Path(".")).join("tmp")
    for (tcname in ["foo", "foo5", "bar", "foobar", "barfoo"]) {
        checkReport(dir.join("tests"), tcname)
    }
}
