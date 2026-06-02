/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE)EXEC: %compiler %cmp_opt %f -o %n.%suffix %cmp_utest_opt
// (CJNATIVE)EXEC: %run %run_opt %n.%suffix %run_utest_opt

import std.convert.*

func testTryParse(value: String): String {
    try {
        Int8.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "Int8"
    }

    try {
        UInt8.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "UInt8"
    }

    try {
        Int16.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "Int16"
    }

    try {
        UInt16.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "UInt16"
    }

    try {
        Int32.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "Int32"
    }

    try {
        UInt32.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "UInt32"
    }

    try {
        Int64.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "Int64"
    }

    try {
        UInt64.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "UInt64"
    }

    try {
        Float16.tryParse(value)
    } catch (e: IllegalArgumentException) {
        UInt64.tryParse(value)
        return "Float16"
    }

    try {
        Float32.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "Float32"
    }

    try {
        Float64.tryParse(value)
    } catch (e: IllegalArgumentException) {
        return "Float64"
    }

    try {
        Rune.tryParse(value)
        return "Rune"
    } catch (e: IllegalArgumentException) {}
    return ""
}

func testParse(value: String): String {
    try {
        Int8.parse(value)
        return "Int8"
    } catch (e: IllegalArgumentException) {}

    try {
        UInt8.parse(value)
        return "UInt8"
    } catch (e: IllegalArgumentException) {}

    try {
        Int16.parse(value)
        return "Int16"
    } catch (e: IllegalArgumentException) {}

    try {
        UInt16.parse(value)
        return "UInt16"
    } catch (e: IllegalArgumentException) {}

    try {
        Int32.parse(value)
        return "Int32"
    } catch (e: IllegalArgumentException) {}

    try {
        UInt32.parse(value)
        return "UInt32"
    } catch (e: IllegalArgumentException) {}

    try {
        Int64.parse(value)
        return "Int64"
    } catch (e: IllegalArgumentException) {}

    try {
        UInt64.parse(value)
        return "UInt64"
    } catch (e: IllegalArgumentException) {}

    try {
        Float16.parse(value)
        return "Float16"
    } catch (e: IllegalArgumentException) {}

    try {
        Float32.parse(value)
        return "Float32"
    } catch (e: IllegalArgumentException) {}

    try {
        Float64.parse(value)
        return "Float64"
    } catch (e: IllegalArgumentException) {}

    try {
        Rune.parse(value)
        return "Rune"
    } catch (e: IllegalArgumentException) {}
    return ""
}

@Test
class ConvertExceptionTest {
    @TestCase
    func parseException(): Unit {
        let testVars: Array<String> = ["\u{feff}tesu\u{0000}\u{00af}\u{00ab}\u{0000}",
            unsafe { String.fromUtf8Unchecked([255, 116, 0]) }, unsafe { String.fromUtf8Unchecked([253, 116, 0]) }]

        for (testVar in testVars) {
            @Assert(testParse(testVar), "")
        }
    }
}
