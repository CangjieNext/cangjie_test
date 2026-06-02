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
class ConvertRuneTest {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Rune)> = [("'a'", r'a'), ("'A'", r'A'), ("'5'", r'5'), ("'\''", r'\''), ("'\n'", r'\n'),
            ("'\\u{4e25}'", r'严'), ("'\\u{10437}'", r'𐐷')]

        for (testVar in testVars) {
            @Expect(Rune.parse(testVar[0]), testVar[1])
        }
    }
    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."), ("\r'\'\'", "Fail to convert to Rune."),
            ("\'\\n\'", "The string is empty."), ("a", "Fail to convert to Rune."),
            ("'\\u{61&1}'", "Fail to convert to Rune."), ("\'\\r\'", "Fail to convert to Rune."),
            ("\'\\t\'", "Fail to convert to Rune."), ("\'\\b\'", "Fail to convert to Rune."),
            ("\'\\f\'", "Fail to convert to Rune."), ("\'\\v\'", "Fail to convert to Rune."),
            ("\'\\0\'", "Fail to convert to Rune."), ("\'\\$\'", "Fail to convert to Rune."),
            ("\'\\\\\'", "Fail to convert to Rune."), ("\'\\\r'\'", "Fail to convert to Rune."),
            ("\'\\\"\'", "Fail to convert to Rune."), ("\'\\\'\'", "Fail to convert to Rune."),
            ("'\\u4e25'", "Fail to convert to Rune.")]

        for (testVar in testVars) {
            try {
                var _ = Rune.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Rune)> = [("'a'", r'a'), ("'5'", r'5'), ("'\''", r'\''), ("'\\n'", r'\n'),
            ("''", r'\0'), ("'\\u4e25'", r'\0'), ("'\\u6211'", r'\0')]

        for (testVar in testVars) {
            var ret: Option<Rune> = Rune.tryParse(testVar[0])
            var charRet: Rune = match (ret) {
                case Some(s) => s
                case None => r'\0'
            }
            @Expect(testVar[1], charRet)
        }
    }
}
