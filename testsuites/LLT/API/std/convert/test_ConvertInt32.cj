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
class ConvertInt32Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Int32)> = [("0xf", 15), ("0b0001_1000", 24), ("-0o30", -24), ("24", 24),
            ("2147483647", 2147483647), ("-2147483648", -2147483648), ("0o00000000030", 24), ("0x00000000030", 48)]

        for (testVar in testVars) {
            @Expect(Int32.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseRadix(): Unit {
        let testVars: Array<(String, Int, Int32)> = [("8jmdnkm", 25, 2147483647), ("-282ba4aab", 13, -2147483648),
            ("-494hd6", 19, -11111111), ("-ad26", 29, -254887)]
        for (testVar in testVars) {
            @Expect(Int32.parse(testVar[0], radix:testVar[1]), testVar[2])
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("2147483648", "The part of value convert failed."), ("-2147483649", "The part of value convert failed."),
            ("+32", "Starting with \"+\" is illegal in Int32.")]

        for (testVar in testVars) {
            try {
                var _ = Int32.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func parseExceptionRadix(): Unit {
        let testVars: Array<(String, Int, String)> = [("", 3, "The string is empty."),
            ("2147483648", 2, "The part of value convert failed."),
            ("-2147483649", 2, "The part of value convert failed."), ("0o1", 8, "The part of value convert failed."),
            ("0x1", 16, "The part of value convert failed."), ("+32", 10, "Starting with \"+\" is illegal in Int32."),
            ("-", 2, "The value part is empty.")]

        for (testVar in testVars) {
            try {
                var _ = Int32.parse(testVar[0], radix: testVar[1])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message,  testVar[2])
            }
        }
    }

    @TestCase
    func parsePlusSignInconsistency(): Unit {
        try {
            var _ = Int32.parse("+10")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("+") || e.message.contains("illegal"))
        }

        @Expect(Int32.parse("+10", radix: 10), 10)
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Int32)> = [("0xf", 15), ("-0b0001_1000", -24), ("0o30", 24), ("-24", -24), ("", 0),
            ("+12", 0), ("-2147483648", -2147483648), ("2147483648", 0), ("32", 32), ("1234abcsf56778", 0)]

        for (testVar in testVars) {
            var ret: Option<Int32> = Int32.tryParse(testVar[0])
            var int32Ret: Int32 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[1], int32Ret)
        }
    }

    @TestCase
    func tryParseRadix(): Unit {
        let testVars: Array<(String, Int, Int32)> = [("0xf", 16, 0), ("-0b0001_1000", 2, 0), ("0o30", 8, 0),
            ("-24", 10, -24), ("", 10, 0), ("+12", 10, 12), ("-4nw", 33, -5147), ("02gg", 21, 1234), ("0xgg", 35, 41001)]

        for (testVar in testVars) {
            var ret: Option<Int32> = Int32.tryParse(testVar[0], radix: testVar[1])
            var int8Ret: Int32 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[2], int8Ret)
        }
    }

    @TestCase
    func toStringRadix(): Unit {
        let testVars: Array<(Int32, Int, String)> = [(125, 2, "1111101"), (2147483647, 35, "15v22um"),
            (-2147483648, 25, "-8jmdnkn"), (0, 4, "0")]
        for (testVar in testVars) {
            @Expect(testVar[0].toString(radix: testVar[1]), testVar[2])
        }
    }
}
