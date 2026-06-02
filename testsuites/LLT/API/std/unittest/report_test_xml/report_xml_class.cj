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
import std.collection.*

@Test
class T1 {
    @TestCase
    func foo() {
        @Assert(true)
    }

    @TestCase
    func foo5() {
        @Assert(true)
        @Assert(true || !true)
        @Expect(true || false)
        @Expect(false || !false)
        @Expect(true)
    }

    @TestCase
    func bar() {
        @Assert(false)
    }

    @TestCase
    func foobar() {
        throw IllegalStateException("it's an error case")
    }

    @TestCase
    @Skip
    func barfoo() {
        @Assert(false) // should not be failed: skipped
    }
}

func checkReport(dir: Path) {
    let reportPath = dir.join("test-default.T1.xml")
    if (!exists(reportPath)) {
        throw Exception("Report file must exist")
    }

    let report = TestSuiteXml.readFromFile(reportPath)

    if (report.tests != 5) {
        throw Exception("tests count mismatch: ${report.tests}")
    }
    if (report.failures != 1) {
        throw Exception("failed count mismatch: ${report.failures}")
    }
    if (report.errors != 1) {
        throw Exception("errors count mismatch: ${report.errors}")
    }
    if (report.skipped != 1) {
        throw Exception("skipped count mismatch: ${report.skipped}")
    }
    if (report.name != "default.T1") {
        throw Exception("suite name mismatch: ${report.name}")
    }
    if (report.timestamp >= DateTime.now()) {
        throw Exception("timestamp from the future!")
    }
    if (report.time <= 0.0) {
        throw Exception("Non-positive testsuite duration")
    }

    let testnames = HashSet<String>()
    for (tc in report.testcases) {
        if (tc.classname != report.name) {
            "testcase classname mismatch: ${tc.classname}"
        }
        match (tc.name) {
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
        testnames.add(tc.name)
    }

    if (testnames.size != 5) {
        throw Exception("testcases names are duplicated")
    }
}

main(): Unit {
    let dir = canonicalize(Path(".")).join("tmp")
    T1().asTestSuite().runTests().reportTo(XmlReporter(dir))

    checkReport(dir.join("tests"))
}
