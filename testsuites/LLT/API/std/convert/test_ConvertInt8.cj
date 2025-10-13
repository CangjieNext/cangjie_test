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
class ConvertInt8Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Int8)> = [("0xf", 15), ("-0b0001_1000", -24), ("0o30", 24), ("-24", -24),
            ("127", 127), ("-128", -128), ("0o00000000030", 24), ("0x00000000030", 48)]

        for (testVar in testVars) {
            @Expect(Int8.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseRadix(): Unit {
        let testVars: Array<(String, Int, Int8)> = [("1111111", 2, 127), ("1333", 4, 127), ("7F", 16, 127),
            ("4j", 27, 127), ("-3T", 33, -128), ("-26", 23, -52), ("+32", 10, 32)]
        for (testVar in testVars) {
            @Expect(Int8.parse(testVar[0], radix:testVar[1]), testVar[2])
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."), ("-", "The value part is empty."),
            ("128", "The part of value convert failed."), ("-129", "The part of value convert failed."),
            ("0o1234567890", "The part of value convert failed."), ("0x1234567890", "The part of value convert failed."),
            ("+32", "Starting with \"+\" is illegal in Int8.")]

        for (testVar in testVars) {
            try {
                var _ = Int8.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func parseExceptionRadix(): Unit {
        let testVars: Array<(String, Int, String)> = [("", 3, "The string is empty."), ("-", 10, "The value part is empty."),
            ("128", 2, "The part of value convert failed."), ("-129", 2, "The part of value convert failed."),
            ("0o1", 8, "The part of value convert failed."), ("0x1", 16, "The part of value convert failed."),
            ("+32", 37, "The radix out of range."), ("-", 2, "The value part is empty.")]

        for (testVar in testVars) {
            try {
                var _ = Int8.parse(testVar[0], radix: testVar[1])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message,  testVar[2])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Int8)> = [("0xf", 15), ("-0b0001_1000", -24), ("0o30", 24), ("-24", -24), ("", 0),
            ("+12", 0), ("-128", -128), ("128", 0), ("50", 50), (#"1.23"#, 0), ("a_123456", 0), ("h456o", 0)]

        for (testVar in testVars) {
            var ret: Option<Int8> = Int8.tryParse(testVar[0])
            var int8Ret: Int8 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[1], int8Ret)
        }
    }

    @TestCase
    func tryParseRadix(): Unit {
        let testVars: Array<(String, Int, Int8)> = [("0xf", 16, 0), ("-0b0001_1000", 2, 0), ("0o30", 8, 0),
            ("-24", 10, -24), ("", 10, 0), ("+12", 10, 12), ("-128", 2, 0), ("6d", 17, 115), ("6d", 37, 0)]

        for (testVar in testVars) {
            var ret: Option<Int8> = Int8.tryParse(testVar[0], radix: testVar[1])
            var int8Ret: Int8 = match (ret) {
                case Some(s) => s
                case None => 0
            }
            @Expect(testVar[2], int8Ret)
        }
    }

    @TestCase
    func toStringRadix(): Unit {
        let testVars: Array<(Int8, Int, String)> = [(125, 2, "1111101"), (125, 35, "3k"), (127, 10, "127"),
            (-128, 4, "-2000"), (0, 3, "0")]
        for (testVar in testVars) {
            @Expect(testVar[0].toString(radix: testVar[1]), testVar[2])
        }
    }
}
