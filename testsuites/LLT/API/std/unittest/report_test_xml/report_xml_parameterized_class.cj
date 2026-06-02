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
// EXEC-1: %run %run_opt %output %run_args --no-color --reportFormat=xml --reportPath=tmp
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color

package a.b.c

import xmlparser.*
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.time.*
import std.collection.*

@Test
@Types[T in<Int32, Bool>, K in<Bool>]
class TEST_NAME<T, K> {
    @TestCase
    @Types[F in<T>]
    func foo<F>() {
        @Assert(true)
    }

    @TestCase[a in random()]
    @Types[F in<Bool>]
    func foofoo<F>(a: F) {
        match (a) {
            case v: Bool => @Assert(v || !v)
            case _ => println("not Bool")
        }
    }

    @TestCase[a in random()]
    @Types[F in<T>]
    func bar<F>(a: Bool) {
        @Assert(a)
    }
}

let packname = "a.b.c"

func checkReport(dir: Path, classparams: (String, String)) {
    let reportPath = dir.join("test-${packname}.TEST_NAME.${classparams[0]}.${classparams[1]}.xml")
    if (!exists(reportPath)) {
        throw Exception("Report file must exist")
    }

    let report = TestSuiteXml.readFromFile(reportPath)

    if (report.tests != 3) {
        throw Exception("tests count mismatch: ${report.tests}")
    }
    if (report.failures != 1) {
        throw Exception("failed count mismatch: ${report.failures}")
    }
    if (report.errors != 0) {
        throw Exception("errors count mismatch: ${report.errors}")
    }
    if (report.skipped != 0) {
        throw Exception("skipped count mismatch: ${report.skipped}")
    }
    if (report.name != "${packname}.TEST_NAME&lt;${classparams[0]}, ${classparams[1]}&gt;") {
        throw Exception("suite name mismatch: ${report.name}")
    }
    if (report.timestamp >= DateTime.now()) {
        throw Exception("timestamp from the future!")
    }
    if (report.time <= 0.0) {
        throw Exception("Non-positive testsuite duration")
    }

    for (tc in report.testcases) {
        if (tc.classname != report.name) {
            "testcase classname mismatch: ${tc.classname}"
        }
        match (tc.name) {
            case "foo&lt;T&gt;" =>
                if (tc.assertions != 1) {
                    throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
                }
                if (!tc.data.isPassed) {
                    throw Exception("${tc.name} must be passed")
                }
                if (tc.time < 0.0) {
                    throw Exception("negative duration")
                }
            case "foofoo&lt;Bool&gt;" =>
                if (tc.assertions != 200) {
                    throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
                }
                if (!tc.data.isPassed) {
                    throw Exception("${tc.name} must be passed")
                }
                if (tc.time < 0.0) {
                    throw Exception("negative duration")
                }
            case "bar&lt;T&gt;" =>
                if (tc.assertions != 1) {
                    throw Exception("Assertions mismatch ${tc.name}: ${tc.assertions}")
                }
                if (!tc.data.isFailed) {
                    throw Exception("${tc.name} must be failed")
                }
                if (tc.time < 0.0) {
                    throw Exception("negative duration")
                }

                if (let Some(msg) <- tc.data.message) {
                    if (!msg.contains("a = false")) {
                        throw Exception("No param info in message")
                    }
                } else {
                    throw Exception("No message in testcase")
                }

                if (let Some(body) <- tc.data.body) {
                    if (!body.contains("Assert Failed")) {
                        throw Exception("No assertion body")
                    }
                } else {
                    throw Exception("No testcase body")
                }
            case unknown => throw Exception("Unexpected testcase: ${unknown}")
        }
    }
}

main(): Unit {
    let dir = canonicalize(Path(".")).join("tmp")
    for (params in [("Int32", "Bool"), ("Bool", "Bool")]) {
        checkReport(dir.join("tests"), (params[0], params[1]))
    }
}
