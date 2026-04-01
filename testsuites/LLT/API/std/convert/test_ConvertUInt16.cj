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
class ConvertUInt16Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, UInt16)> = [("0xf", 15), ("0b0001_1000", 24), ("0o30", 24), ("24", 24),
            ("65535", 65535), ("0", 0), ("0o00000000030", 24), ("0x00000000030", 48)]

        for (testVar in testVars) {
            @Expect(UInt16.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseRadix(): Unit {
        let testVars: Array<(String, Int, UInt16)> = [("1111111", 2, 127), ("1333", 4, 127), ("14640", 15, 65535),
            ("0", 10, 0), ]
        for (testVar in testVars) {
            @Expect(UInt16.parse(testVar[0], radix:testVar[1]), testVar[2])
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("65536", "The part of value convert failed."), ("-1", "Starting with \"-\" is illegal in UInt16."),
            ("0o1234567890", "The part of value convert failed."), ("0x1234567890", "The part of value convert failed."),
            ("+32", "Starting with \"+\" is illegal in UInt16.")]

        for (testVar in testVars) {
            try {
                var _ = UInt16.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func parseExceptionRadix(): Unit {
        let testVars: Array<(String, Int, String)> = [("", 3, "The string is empty."),
            ("65536", 2, "The part of value convert failed."), ("-1", 2, "Starting with \"-\" is illegal in UInt16."),
            ("0o1", 8, "The part of value convert failed."), ("0x1", 16, "The part of value convert failed.")]

        for (testVar in testVars) {
            try {
                var _ = UInt16.parse(testVar[0], radix: testVar[1])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message,  testVar[2])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, UInt16)> = [("0xf", 15), ("0b0001_1000", 24), ("0o30", 24), ("24", 24),
            ("65535", 65535), ("65536", 0), ("0o00000000030", 24), ("0x00000000030", 48), ("+24", 0), ("", 0), ("16", 16),
            ("123o456", 0)]

        for (testVar in testVars) {
            var ret: Option<UInt16> = UInt16.tryParse(testVar[0])
            var uInt16Ret: UInt16 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[1], uInt16Ret)
        }
    }

    @TestCase
    func tryParseRadix(): Unit {
        let testVars: Array<(String, Int, UInt16)> = [("0xf", 16, 0), ("-0b0001_1000", 2, 0), ("0o30", 8, 0),
            ("-24", 10, 0), ("00012", 10, 12), ("", 10, 0), ("+12", 10, 12), ("-bc", 17, 0), ("2coe", 30, 65534)]

        for (testVar in testVars) {
            var ret: Option<UInt16> = UInt16.tryParse(testVar[0], radix: testVar[1])
            var int8Ret: UInt16 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[2], int8Ret)
        }
    }

    @TestCase
    func toStringRadix(): Unit {
        let testVars: Array<(UInt16, Int, String)> = [(125, 2, "1111101"), (65535, 35, "1ihf"), (0, 4, "0")]
        for (testVar in testVars) {
            @Expect(testVar[0].toString(radix: testVar[1]), testVar[2])
        }
    }
}
