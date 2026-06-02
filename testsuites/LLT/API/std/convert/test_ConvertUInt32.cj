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
class ConvertUInt32Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, UInt32)> = [("0xf", 15), ("0b0001_1000", 24), ("0o30", 24), ("24", 24),
            ("4294967295", 4294967295), ("0", 0), ("0o00000000030", 24), ("0x00000000030", 48)]

        for (testVar in testVars) {
            @Expect(UInt32.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseRadix(): Unit {
        let testVars: Array<(String, Int, UInt32)> = [("1111111", 2, 127), ("1333", 4, 127), ("1fj8b183", 22, 4294967295),
            ("0", 10, 0), ]
        for (testVar in testVars) {
            @Expect(UInt32.parse(testVar[0], radix:testVar[1]), testVar[2])
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("4294967296", "The part of value convert failed."), ("-1", "Starting with \"-\" is illegal in UInt32."),
            ("+32", "Starting with \"+\" is illegal in UInt32.")]

        for (testVar in testVars) {
            try {
                var _ = UInt32.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func parseExceptionRadix(): Unit {
        let testVars: Array<(String, Int, String)> = [("", 3, "The string is empty."),
            ("4294967296", 2, "The part of value convert failed."), ("-1", 2, "Starting with \"-\" is illegal in UInt32."),
            ("0o1", 8, "The part of value convert failed."), ("0x1", 16, "The part of value convert failed.")]

        for (testVar in testVars) {
            try {
                var _ = UInt32.parse(testVar[0], radix: testVar[1])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message,  testVar[2])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, UInt32)> = [("0xf", 15), ("0b0001_1000", 24), ("0o30", 24), ("24", 24),
            ("4294967295", 4294967295), ("4294967296", 0), ("0o00000000030", 24), ("0x00000000030", 48), ("+24", 0),
            ("", 0), ("43", 43), ("3.1415926", 0), ("w467d", 0)]

        for (testVar in testVars) {
            var ret: Option<UInt32> = UInt32.tryParse(testVar[0])
            var uInt32Ret: UInt32 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[1], uInt32Ret)
        }
    }

    @TestCase
    func tryParseRadix(): Unit {
        let testVars: Array<(String, Int, UInt32)> = [("0xf", 16, 0), ("-0b0001_1000", 2, 0), ("0o30", 8, 0),
            ("-24", 10, 0), ("00012", 10, 12), ("", 10, 0), ("+12", 10, 12), ("-bc", 17, 0), ("pkk6g", 36, 42949672)]

        for (testVar in testVars) {
            var ret: Option<UInt32> = UInt32.tryParse(testVar[0], radix: testVar[1])
            var int8Ret: UInt32 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[2], int8Ret)
        }
    }

    @TestCase
    func toStringRadix(): Unit {
        let testVars: Array<(UInt32, Int, String)> = [(125, 2, "1111101"), (4294967295, 35, "2br45qa"), (0, 4, "0")]
        for (testVar in testVars) {
            @Expect(testVar[0].toString(radix: testVar[1]), testVar[2])
        }
    }
}
