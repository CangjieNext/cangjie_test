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
import std.sync.*

@Test
class ConvertFloat64Test {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Float64)> = [("3.14", 3.14), ("2.4e-1", 0.24), ("-.123e2", -12.3),
            ("0x1.1p0", 1.0625), ("0x1p2", 4.000000), ("0x.2p4", 2.0), ("+32.0", 32.0), ("  3.14", 3.14),
            (" 3.14  ", 3.14), ("1.7976931348623157e308", 1.7976931348623157e308)]

        for (testVar in testVars) {
            @Expect(Float64.parse(testVar[0]), testVar[1])
        }
    }

    @TestCase
    func parseOverflow(): Unit {
        @Expect(Float64.parse("1.8e309"), Float64.Inf)
        @Expect(Float64.parse("-2.5e308"), -Float64.Inf)
        @Expect(Float64.parse("1e999999"), Float64.Inf)
        @Expect(Float64.parse("-1e999999"), -Float64.Inf)
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "The string is empty."),
            ("   ", "The string does not comply with the floating point number syntax."),
            ("\t\t", "The string does not comply with the floating point number syntax."),
            ("\n", "The string does not comply with the floating point number syntax."),
            (" \t\n ", "The string does not comply with the floating point number syntax."),
            ("0xP", "The string does not comply with the floating point number syntax."),
            ("3.1 4", "The string does not comply with the floating point number syntax."),
            ("+", "The string does not comply with the floating point number syntax."),
            ("-", "The string does not comply with the floating point number syntax."),
            (".", "The string does not comply with the floating point number syntax."),
            (" + ", "The string does not comply with the floating point number syntax."),
            (" - ", "The string does not comply with the floating point number syntax."),
            (" . ", "The string does not comply with the floating point number syntax.")]

        for (testVar in testVars) {
            try {
                var _ = Float64.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func parseDoubleDecimalPoint(): Unit {
        let doubleDecimalInputs: Array<String> = ["1.2.", "3.14.", "0.001.", "..", "1.2.3", "1..2", "1.2.3.4"]
        for (input in doubleDecimalInputs) {
            try {
                var _ = Float64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("floating point") || e.message.contains("syntax"))
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Float64)> = [("3.14", 3.14), ("2.4e-1", 0.24), ("-.123e2", -12.3),
            ("0x1.1p0", 1.0625), ("0x1p2", 4.000000), ("0x.2p4", 2.0), ("", 0.0), ("+0x.2p4", 2.0), ("+32.0000", 32.0),
            ("2.23e-308", 2.23e-308), ("-1.79e308", -1.79e308), ("124.2214", 124.2214),
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

    @TestCase
    func tryParseOverflow(): Unit {
        @Expect(Float64.tryParse("1.8e309"), Some(Float64.Inf))
        @Expect(Float64.tryParse("-2.5e308"), Some(-Float64.Inf))
        @Expect(Float64.tryParse("1e999999"), Some(Float64.Inf))
        @Expect(Float64.tryParse("-1e999999"), Some(-Float64.Inf))
    }

    @TestCase
    func tryParseWhitespace(): Unit {
        let whitespaceInputs: Array<String> = ["   ", "\t\t", "\n", " \t\n ", "\r\n"]
        for (input in whitespaceInputs) {
            var ret: Option<Float64> = Float64.tryParse(input)
            @Assert(ret.isNone())
        }
    }

    @TestCase
    func parseConcurrent(): Unit {
        let testVars: Array<(String, Float64)> = [("3.14", 3.14), ("2.4e-1", 0.24), ("-.123e2", -12.3),
            ("0x1.1p0", 1.0625), ("0x1p2", 4.000000), ("0x.2p4", 2.0), ("+32.0", 32.0)]
        let successCount = AtomicInt64(0)
        let iterations = 100

        for (i in 0..iterations) {
            for (testVar in testVars) {
                spawn {
                    let result = Float64.parse(testVar[0])
                    if (result == testVar[1]) {
                        successCount.fetchAdd(1)
                    }
                }
            }
        }

        let expectedSuccess = iterations * testVars.size
        var waitCount = 0
        while (successCount.load() < expectedSuccess && waitCount < 10000) {
            sleep(Duration.millisecond * 10)
            waitCount++
        }
        @Expect(successCount.load(), expectedSuccess)
    }
}
