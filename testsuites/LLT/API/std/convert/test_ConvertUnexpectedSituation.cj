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

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

func getResultParse<T>(f: (String) -> Option<T>, arg: String, default: T): T {
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

@Test
class ConvertUnexpectedSituationTest {
    @TestCase
    func decBeginWithZero(): Unit {
        var opt = Int64.tryParse("021")
        var res = matchResult<Int64>(opt, 0)
        @Expect(res, 21)
    }

    @TestCase
    func numericOverflowReturnNone(): Unit {
        var str1 = "-129"
        var parse8 = Int8.tryParse(str1)
        var parse8_1 = Int8.tryParse("128")

        var res1 = matchResult<Int8>(parse8, 0)
        @Expect(res1, 0)

        var res1_1 = matchResult<Int8>(parse8_1, 0)
        @Expect(res1_1, 0)

        var res2 = getResultParse<Int16>(Int16.tryParse, "0b1000000000000001", 0)
        @Expect(res2, 0)

        var res2_1 = getResultParse<Int16>(Int16.tryParse, "-32769", 0)
        @Expect(res2_1, 0)

        var res3 = getResultParse<Int32>(Int32.tryParse, "-2147483649", 0)
        @Expect(res3, 0)

        var res3_1 = getResultParse<Int32>(Int32.tryParse, "2147483648", 0)
        @Expect(res3_1, 0)

        var res4 = getResultParse<Int64>(Int64.tryParse, "-9223372036854775809", 0)
        @Expect(res4, 0)

        var res4_1 = getResultParse<Int64>(Int64.tryParse, "0x8000000000000000", 0)
        @Expect(res4_1, 0)

        var res5 = getResultParse<UInt8>(UInt8.tryParse, "257", 0)
        @Expect(res5, 0)

        var res5_1 = getResultParse<UInt8>(UInt8.tryParse, "-1", 0)
        @Expect(res5_1, 0)

        var res6 = getResultParse<UInt16>(UInt16.tryParse, "0o200000", 0)
        @Expect(res6, 0)

        var res6_1 = getResultParse<UInt16>(UInt16.tryParse, "-1", 0)
        @Expect(res6_1, 0)

        var res7 = getResultParse<UInt32>(UInt32.tryParse, "4294967296", 0)
        @Expect(res7, 0)

        var res7_1 = getResultParse<UInt32>(UInt32.tryParse, "-1", 0)
        @Expect(res7_1, 0)

        var res8 = getResultParse<UInt64>(UInt64.tryParse, "18446744073709551616", 0)
        @Expect(res8, 0)

        var res8_1 = getResultParse<UInt64>(UInt64.tryParse, "-1", 0)
        @Expect(res8_1, 0)

        var res9 = getResultParse<Float16>(Float16.tryParse, "-65505", 0.0)
        @Expect(res9, -Float16.Inf)

        var res9_1 = getResultParse<Float16>(Float16.tryParse, "65505", 0.0)
        @Expect(res9_1, Float16.Inf)

        var res10 = getResultParse<Float32>(Float32.tryParse, "-3.4e39", 0.0)
        @Expect(res10, -Float32.Inf)

        var res10_1 = getResultParse<Float32>(Float32.tryParse, "3.4e39", 0.0)
        @Expect(res10_1, Float32.Inf)

        var res11 = getResultParse<Float64>(Float64.tryParse, "-2.5e308", 0.0)
        @Expect(res11, -Float64.Inf)

        var res11_1 = getResultParse<Float64>(Float64.tryParse, "2.24e-307", 0.0)
        @Expect(res11_1, 2.24e-307)

        var res11_2 = getResultParse<Float64>(Float64.tryParse, "1.8e309", 0.0)
        @Expect(res11_2, Float64.Inf)
    }

    @TestCase
    func scientificNotationWithPlusSign(): Unit {
        try {
            let res = Float64.tryParse("1.42367e+06").getOrThrow()
            @Assert(res, 1423670.0f64)
        } catch (e: Exception) {
            @Assert(false)
        }
    }

    @TestCase
    func convertIntToFloat(): Unit {
        let testVars: Array<(String, Float64)> = [("0", 0.0), ("1", 1.0), ("2", 2.0), ("3", 3.0), ("4", 4.0), ("6", 6.0),
            ("10", 10.0), ("101", 101.0)]

        for (testVar in testVars) {
            @Expect(matchResult<Float64>(Float64.tryParse(testVar[0]), -1.0), testVar[1])
        }
    }

    @TestCase
    func invalidPrefixParse(): Unit {
        let invalidPrefixInputs: Array<String> = ["0z", "0!", "0q", "0@", "0#", "0z1"]
        for (input in invalidPrefixInputs) {
            try {
                var _ = Int64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("prefix") || e.message.contains("Invalid"))
            }
        }
    }

    @TestCase
    func symbolOnlyParse(): Unit {
        let symbolOnlyInputs: Array<String> = ["+", "-", "."]
        for (input in symbolOnlyInputs) {
            try {
                var _ = Float64.parse(input)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("floating point") || e.message.contains("syntax"))
            }
        }
    }

    @TestCase
    func doubleDecimalPointParse(): Unit {
        let doubleDecimalInputs: Array<String> = ["1.2.", "3.14.", "0.001.", "..", "1.2.3"]
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
    func formatWidthOverflow(): Unit {
        let largeWidthInputs: Array<String> = ["999999999", "1000000000", "999999999999"]
        for (fmt in largeWidthInputs) {
            try {
                var result = Int64(1).format(fmt)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message.contains("width") || e.message.contains("overflow") || e.message.contains("limit"))
            } catch (e: OutOfMemoryError) {
                @Assert(true)
            }
        }
    }

    @TestCase
    func parsePlusSignBehaviorDifference(): Unit {
        try {
            var _ = Int64.parse("+10")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("+") || e.message.contains("illegal"))
        }

        @Expect(Int64.parse("+10", radix: 10), 10)
    }
}
