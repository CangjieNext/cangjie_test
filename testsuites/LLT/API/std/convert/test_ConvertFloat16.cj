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
class ConvertFloat16Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Float16)> = [("3.14", 3.14), ("2.4e-1", 0.24), ("-.123e2", -12.3),
            ("0x1.1p0", 1.0625), ("0x1p2", 4.000000), ("0x.2p4", 2.0), ("+32.0", 32.0), ("4e+40", Float16.Inf),
            ("-4e+40", -Float16.Inf), (" 3.14  ", 3.14), (" 3.14", 3.14)]

        for (testVar in testVars) {
            @Expect(Float16.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("   ", "The string does not comply with the floating point number syntax."),
            ("\t\t", "The string does not comply with the floating point number syntax."),
            ("\n", "The string does not comply with the floating point number syntax."),
            (" \t\n ", "The string does not comply with the floating point number syntax."),
            ("3.1 4", "The string does not comply with the floating point number syntax."),
            ("+", "The string does not comply with the floating point number syntax."),
            ("-", "The string does not comply with the floating point number syntax."),
            (".", "The string does not comply with the floating point number syntax."),
            (" + ", "The string does not comply with the floating point number syntax."),
            (" - ", "The string does not comply with the floating point number syntax."),
            (" . ", "The string does not comply with the floating point number syntax.")]

        for (testVar in testVars) {
            try {
                var _ = Float16.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Float16)> = [("3.14", 3.14), ("2.4e-1", 0.24), ("-.123e2", -12.3),
            ("0x1.1p0", 1.0625), ("0x1p2", 4.000000), ("0x.2p4", 2.0), ("", 0.0), ("+0x.2p4", 2.0), ("+32.0000", 32.0),
            ("9223372036854775808", Float16.Inf), ("3.1244646", 3.125), ("6.104e-5", 6.104e-5), ("65504.0", 65504.0),
            ("-65504.0", -65504.0), ("#$%$1234", 0.0)]

        for (testVar in testVars) {
            var ret: Option<Float16> = Float16.tryParse(testVar[0])
            var float16Ret: Float16 = match (ret) {
                case Some(s) => s
                case None => 0.0
            }
            @Expect(testVar[1], float16Ret)
        }
    }

    @TestCase
    func tryParseWhitespace(): Unit {
        let whitespaceInputs: Array<String> = ["   ", "\t\t", "\n", " \t\n ", "\r\n"]
        for (input in whitespaceInputs) {
            var ret: Option<Float16> = Float16.tryParse(input)
            @Assert(ret.isNone())
        }
    }
}
