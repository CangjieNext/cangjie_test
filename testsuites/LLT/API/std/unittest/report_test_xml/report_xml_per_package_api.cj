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
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color

package a.b.c

import xmlparser.*
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.time.*
import std.collection.*
import std.env.*

@Test
class Suite {
    @TestCase
    func case1() {
    }

    @TestCase
    func case2() {
    }
}

func assert(passed: Bool, msg: String) {
    if (!passed) {
        throw Exception(msg)
    }
}

main() {
    let dir = canonicalize(Path(".")).join("tmp")
    let packname = "a.b.c"
    let group = TestGroup.builder(packname).add(Suite().asTestSuite()).build()
    group.runTests().reportTo(XmlPerPackageReporter(dir))

    let reportPath = dir.join("tests").join("test-${packname}.xml")
    if (!exists(reportPath)) { throw Exception("Report file must exist") }

    let report = TestSuitesXml.readFromFile(reportPath)
    assert(report.tests == 2, "tests count mismatch: ${report.tests}")
    assert(report.failures == 0, "failures count mismatch: ${report.failures}")
    assert(report.errors == 0, "errors count mismatch: ${report.errors}")
    assert(report.skipped == 0, "skipped count mismatch: ${report.skipped}")
    let actualNames = report.testsuites.iterator().map { it => it.name } |> collectArray
    let expectedNames = ["a.b.c.Suite"]
    assert(actualNames == expectedNames, "suites mismatch: ${actualNames}")
}
