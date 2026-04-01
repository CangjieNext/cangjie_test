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
class ConvertInt64Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Int64)> = [("0xf", 15), ("0b0001_1000", 24), ("-0o30", -24), ("24", 24),
            ("9223372036854775807", 9223372036854775807), ("-9223372036854775808", -9223372036854775808),
            ("0o00000000030", 24), ("0x00000000030", 48)]

        for (testVar in testVars) {
            @Expect(Int64.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseRadix(): Unit {
        let testVars: Array<(String, Int, Int64)> = [("10b269549075433c37", 13, 9223372036854775807),
            ("-27c48l5b37oaoq", 27, -9223372036854775808), ("-494hd6", 19, -11111111), ("-ad26", 29, -254887)]
        for (testVar in testVars) {
            @Expect(Int64.parse(testVar[0], radix:testVar[1]), testVar[2])
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("9223372036854775808", "The part of value convert failed."),
            ("-9223372036854775809", "The part of value convert failed."),
            ("+32", "Starting with \"+\" is illegal in Int64."),
            ("0z", "Invalid number prefix."),
            ("0!", "Invalid number prefix."),
            ("0q", "Invalid number prefix.")]

        for (testVar in testVars) {
            try {
                var _ = Int64.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func parseExceptionRadix(): Unit {
        let testVars: Array<(String, Int, String)> = [("", 3, "The string is empty."),
            ("9223372036854775808", 2, "The part of value convert failed."),
            ("-9223372036854775809", 2, "The part of value convert failed."),
            ("0o1", 8, "The part of value convert failed."), ("0x1", 16, "The part of value convert failed."),
            ("+32", 10, "Starting with \"+\" is illegal in Int64."), ("-", 2, "The value part is empty.")]

        for (testVar in testVars) {
            try {
                var _ = Int64.parse(testVar[0], radix: testVar[1])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message,  testVar[2])
            }
        }
    }

    @TestCase
    func parsePlusSignInconsistency(): Unit {
        try {
            var _ = Int64.parse("+10")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("+") || e.message.contains("illegal"))
        }

        @Expect(Int64.parse("+10", radix: 10), 10)
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Int64)> = [("0xf", 15), ("-0b0001_1000", -24), ("0o30", 24), ("-24", -24), ("", 0),
            ("+12", 0), ("-9223372036854775808", -9223372036854775808), ("9223372036854775808", 0), ("64", 64),
            ("h123o", 0)]

        for (testVar in testVars) {
            var ret: Option<Int64> = Int64.tryParse(testVar[0])
            var int64Ret: Int64 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[1], int64Ret)
        }
    }

    @TestCase
    func tryParseInvalidPrefix(): Unit {
        let invalidPrefixInputs: Array<String> = ["0z", "0!", "0q", "0@", "0#"]
        for (input in invalidPrefixInputs) {
            var ret: Option<Int64> = Int64.tryParse(input)
            @Expect(ret, Option<Int64>.None)
        }
    }

    @TestCase
    func tryParseRadix(): Unit {
        let testVars: Array<(String, Int, Int64)> = [("0xf", 16, 0), ("-0b0001_1000", 2, 0), ("0o30", 8, 0),
            ("-24", 10, -24), ("", 10, 0), ("+12", 10, 12), ("-4nw", 33, -5147), ("02gg", 21, 1234),
            ("3f8m8e", 31, 100000000)]

        for (testVar in testVars) {
            var ret: Option<Int64> = Int64.tryParse(testVar[0], radix: testVar[1])
            var int8Ret: Int64 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[2], int8Ret)
        }
    }

    @TestCase
    func toStringRadix(): Unit {
        let testVars: Array<(Int64, Int, String)> = [(125, 2, "1111101"), (9223372036854775807, 35, "2pijmikexrxp7"),
            (-9223372036854775808, 25, "-64ie1focnn5g78"), (0, 4, "0")]
        for (testVar in testVars) {
            @Expect(testVar[0].toString(radix: testVar[1]), testVar[2])
        }
    }

    @TestCase
    func parseEmptyDigits(): Unit {
        let emptyDigitInputs: Array<String> = ["0b", "0x", "0o", "0B", "0X", "0O"]
        for (input in emptyDigitInputs) {
            try {
                var _ = Int64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("convert failed") || e.message.contains("prefix"))
            }
        }
    }

    @TestCase
    func parseAllUnderscores(): Unit {
        let allUnderscoreInputs: Array<String> = ["0x___", "0b___", "0o___"]
        for (input in allUnderscoreInputs) {
            try {
                var _ = Int64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("convert failed"))
            }
        }
    }

    @TestCase
    func parseLeadingUnderscore(): Unit {
        let leadingUnderscoreInputs: Array<String> = ["0x_FF", "0b_11", "0o_77"]
        for (input in leadingUnderscoreInputs) {
            try {
                var _ = Int64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("convert failed"))
            }
        }
    }

    @TestCase
    func parseTrailingUnderscore(): Unit {
        let trailingUnderscoreInputs: Array<String> = ["0xFF_", "0b11_", "0o77_", "123_"]
        for (input in trailingUnderscoreInputs) {
            try {
                var _ = Int64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("convert failed"))
            }
        }
    }

    @TestCase
    func parseConsecutiveUnderscores(): Unit {
        let consecutiveUnderscoreInputs: Array<String> = ["1__000", "0xFF__FF", "0b11__00", "0o77__77"]
        for (input in consecutiveUnderscoreInputs) {
            try {
                var _ = Int64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("convert failed"))
            }
        }
    }

    @TestCase
    func tryParseEmptyDigits(): Unit {
        let emptyDigitInputs: Array<String> = ["0b", "0x", "0o", "0B", "0X", "0O"]
        for (input in emptyDigitInputs) {
            var ret: Option<Int64> = Int64.tryParse(input)
            @Expect(ret, Option<Int64>.None)
        }
    }

    @TestCase
    func tryParseInvalidUnderscores(): Unit {
        let invalidUnderscoreInputs: Array<String> = [
            "0x___", "0b___", "0o___",
            "0x_FF", "0b_11", "0o_77",
            "0xFF_", "0b11_", "0o77_", "123_",
            "1__000", "0xFF__FF", "0b11__00", "0o77__77"
        ]
        for (input in invalidUnderscoreInputs) {
            var ret: Option<Int64> = Int64.tryParse(input)
            @Expect(ret, Option<Int64>.None)
        }
    }

    @TestCase
    func parseValidUnderscores(): Unit {
        let testVars: Array<(String, Int64)> = [
            ("0xFF_FF", 65535),
            ("0b1111_0000", 240),
            ("0o77_77", 4095),
            ("123_456_789", 123456789),
            ("1_000", 1000)
        ]
        for (testVar in testVars) {
            @Expect(Int64.parse(testVar[0]), testVar[1])
        }
    }
}
