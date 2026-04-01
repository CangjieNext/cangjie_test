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
import std.math.*

@Test
class ConvertFloat64Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Float64)> = [("3.14", 3.14), ("2.4e-1", 0.24), ("-.123e2", -12.3),
            ("0x1.1p0", 1.0625), ("0x1p2", 4.000000), ("0x.2p4", 2.0), ("+32.0", 32.0), ("  3.14", 3.14),
            (" 3.14  ", 3.14), ("1.8e309", Float64.Inf), ("-2.5e308", -Float64.Inf)]

        for (testVar in testVars) {
            @Expect(Float64.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseWithTrailingSpacesOver17Digits(): Unit {
        @Expect(Float64.parse("123456789012345678 "), 123456789012345678.0)
        @Expect(Float64.parse(" 123456789012345678"), 123456789012345678.0)
        @Expect(Float64.parse(" 123456789012345678 "), 123456789012345678.0)
        @Expect(Float64.parse("123456789012345678.9 "), 123456789012345678.9)
        @Expect(Float64.parse(" 123456789012345678.9"), 123456789012345678.9)
        @Expect(Float64.parse(" 123456789012345678.9 "), 123456789012345678.9)
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("0xP", "The string does not comply with the floating point number syntax."),
            ("3.1 4", "The string does not comply with the floating point number syntax.")]

        for (testVar in testVars) {
            try {
                var _ = Float64.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Float64)> = [("3.14", 3.14), ("2.4e-1", 0.24), ("-.123e2", -12.3),
            ("0x1.1p0", 1.0625), ("0x1p2", 4.000000), ("0x.2p4", 2.0), ("", 0.0), ("+0x.2p4", 2.0), ("+32.0000", 32.0),
            ("1.8e309", Float64.Inf), ("2.23e-308", 2.23e-308), ("-1.79e308", -1.79e308), ("124.2214", 124.2214),
            ("789456123", 789456123.0), ("\u{5}35454", 0.0)]

        for (testVar in testVars) {
            var ret: Option<Float64> = Float64.tryParse(testVar[0])
            var float64Ret: Float64 = match (ret) {
                case Some(s) => s
                case None => 0.0
            }
            @Expect(testVar[1], float64Ret)
        }
    }
}
