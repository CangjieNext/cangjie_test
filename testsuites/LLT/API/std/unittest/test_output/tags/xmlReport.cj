/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.time.*
import std.collection.*

@Test
@Tag[tag0, tag1]
class TestsWithTags {
    @TestCase
    func noTags() {}
}

@Test
@Tag[tag1]
class TestsWithTag {
    @TestCase
    @Tag[tag2, tag3]
    func twoTags() {
        throw Exception("Exception should not break anything")
    }

    @TestCase
    @Tag[tag4]
    func oneTag() {}

    @TestCase
    func noTags() {}
}

@Test
class TestsWithoutTag {
    @TestCase
    @Tag[tag5]
    func oneTag() {}

    @TestCase
    func noTags() {}
}

@Test
@Tag[tag6, tag7]
func topLevel() {}

main(): Unit {
    let dir = canonicalize(Path(".")).join("tmp")

    TestsWithTags().asTestSuite().runTests().reportTo(XmlReporter(dir))
    let test1 = dir.join("tests").join("test-default.TestsWithTags.xml") |>
        File.readFrom |> String.fromUtf8
    if (!test1.containsAll("tag0", "tag1")) {
        throw Exception("Report for TestsWithTags do not contain tags: \n${test1}")
    }

    TestsWithTag().asTestSuite().runTests().reportTo(XmlReporter(dir))
    let test2 = dir.join("tests").join("test-default.TestsWithTag.xml") |>
        File.readFrom |> String.fromUtf8
    if (!test2.containsAll("tag1", "tag2", "tag3", "tag4")) {
        throw Exception("Report for TestsWithTag do not contain tags: \n${test2}")
    }

    TestsWithoutTag().asTestSuite().runTests().reportTo(XmlReporter(dir))
    let test3 = dir.join("tests").join("test-default.TestsWithoutTag.xml") |>
        File.readFrom |> String.fromUtf8
    if (!test3.containsAll("tag5")) {
        throw Exception("Report for TestsWithoutTag do not contain tags: \n${test3}")
    }

    TestCase_topLevel().asTestSuite().runTests().reportTo(XmlReporter(dir))
    let test4 = dir.join("tests").join("test-default.TestCase_topLevel.xml") |>
        File.readFrom |> String.fromUtf8
    if (!test4.containsAll("tag6", "tag7")) {
        throw Exception("Report for TestCase_topLevel do not contain tags: \n${test4}")
    }
}

extend String {
    func containsAll(entries: Array<String>): Bool {
        entries.iterator().all { entry => this.contains(entry) }
    }
}
