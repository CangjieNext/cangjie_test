/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.convert.*

@Test
class L2_charToNumberTest {
    @TestCase
    func parseValidHexDigits(): Unit {
        let testVars: Array<(String, Rune)> = [
            ("'\\u{30}'", r'0'),
            ("'\\u{39}'", r'9'),
            ("'\\u{41}'", r'A'),
            ("'\\u{46}'", r'F'),
            ("'\\u{61}'", r'a'),
            ("'\\u{66}'", r'f')
        ]

        for (testVar in testVars) {
            match (Rune.tryParse(testVar[0])) {
                case Some(r) => @Expect(true, r == testVar[1])
                case None => @Expect(false, true)
            }
        }
    }

    @TestCase
    func parseUnicodeWithValidHexChars(): Unit {
        let testVars: Array<(String, Rune)> = [
            ("'\\u{00}'", r'\0'),
            ("'\\u{4e25}'", r'严'),
            ("'\\u{10FFFF}'", r'\u{10FFFF}')
        ]

        for (testVar in testVars) {
            match (Rune.tryParse(testVar[0])) {
                case Some(r) => @Expect(true, r == testVar[1])
                case None => @Expect(false, true)
            }
        }
    }

    @TestCase
    func parseUnicodeWithInvalidHexChars(): Unit {
        let invalidInputs: Array<String> = [
            "'\\u{G}'",
            "'\\u{Z}'",
            "'\\u{g}'",
            "'\\u{z}'",
            "'\\u{!}'",
            "'\\u{@}'",
            "'\\u{  }'",
            "'\\u{1G}'",
            "'\\u{GH}'"
        ]

        for (input in invalidInputs) {
            match (Rune.tryParse(input)) {
                case Some(_) => @Expect(false, true)
                case None => @Expect(true, true)
            }
        }
    }
}
