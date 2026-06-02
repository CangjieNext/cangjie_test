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
class ConvertInt16Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Int16)> = [("0xf", 15), ("0b0001_1000", 24), ("-0o30", -24), ("24", 24),
            ("32767", 32767), ("-32768", -32768), ("0o00000000030", 24), ("0x00000000030", 48)]

        for (testVar in testVars) {
            @Expect(Int16.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseRadix(): Unit {
        let testVars: Array<(String, Int, Int16)> = [("11bb7", 13, 32767), ("-11bb8", 13, -32768), ("a04", 16, 2564),
            ("179a", 21, 12547)]
        for (testVar in testVars) {
            @Expect(Int16.parse(testVar[0], radix:testVar[1]), testVar[2])
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("32768", "The part of value convert failed."), ("-32769", "The part of value convert failed."),
            ("0o1234567890", "The part of value convert failed."), ("0x1234567890", "The part of value convert failed."),
            ("+32", "Starting with \"+\" is illegal in Int16.")]

        for (testVar in testVars) {
            try {
                var _ = Int16.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func parseExceptionRadix(): Unit {
        let testVars: Array<(String, Int, String)> = [("", 3, "The string is empty."),
            ("32768", 2, "The part of value convert failed."), ("-32769", 2, "The part of value convert failed."),
            ("0o1", 8, "The part of value convert failed."), ("0x1", 16, "The part of value convert failed."),
            ("+32", 10, "Starting with \"+\" is illegal in Int16."), ("-", 2, "The value part is empty.")]

        for (testVar in testVars) {
            try {
                var _ = Int16.parse(testVar[0], radix: testVar[1])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message,  testVar[2])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Int16)> = [("0xf", 15), ("-0b0001_1000", -24), ("0o30", 24), ("-24", -24), ("", 0),
            ("+12", 0), ("-32768", -32768), ("32768", 0), ("126", 126), ("\n123", 0)]

        for (testVar in testVars) {
            var ret: Option<Int16> = Int16.tryParse(testVar[0])
            var int16Ret: Int16 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[1], int16Ret)
        }
    }

    @TestCase
    func tryParseRadix(): Unit {
        let testVars: Array<(String, Int, Int16)> = [("0xf", 16, 0), ("-0b0001_1000", 2, 0), ("0o30", 8, 0),
            ("-24", 10, -24), ("", 10, 0), ("+12", 10, 12), ("-4nw", 33, -5147), ("4kl", 35, 5621)]

        for (testVar in testVars) {
            var ret: Option<Int16> = Int16.tryParse(testVar[0], radix: testVar[1])
            var int8Ret: Int16 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[2], int8Ret)
        }
    }

    @TestCase
    func toStringRadix(): Unit {
        let testVars: Array<(Int16, Int, String)> = [(125, 2, "1111101"), (32767, 35, "qq7"), (-32768, 25, "-22ai"),
            (0, 4, "0")]
        for (testVar in testVars) {
            @Expect(testVar[0].toString(radix: testVar[1]), testVar[2])
        }
    }
}
