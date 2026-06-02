/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*
import std.math.*

struct TS {
    TS(let origin: Decimal, let precision: Int64, let roundingMode: RoundingMode, let result1: String,
        let result2: String) {}
}

let tc4Sqrt = [
    TS(Decimal.parse("3200"), 0, HalfEven, "56.56854249492380195206754896838792", "56.56854249492380195206754896838792"),
    TS(Decimal.parse("1296"), 1, Up, "36", "40"),
    TS(Decimal.parse("129.6"), 1, Down, "11.38419957660616559519601675995779", "10"),
    TS(Decimal.parse("12.96"), 1, Ceiling, "3.6", "4"),
    TS(Decimal.parse("1.296"), 1, Ceiling, "1.138419957660616559519601675995779", "2"),
    TS(Decimal.parse("1.296"), 1, Floor, "1.138419957660616559519601675995779", "1"),
    TS(Decimal.parse("0.1296"), 1, HalfUp, "0.36", "0.4"),
    TS(Decimal.parse("0.01296"), 1, HalfEven, "0.1138419957660616559519601675995779", "0.1"),
    TS(Decimal.parse("1"), 2, Up, "1", "1"),
    TS(Decimal.parse("10"), 2, Down, "3.162277660168379331998893544432719", "3.1"),
    TS(Decimal.parse("100"), 2, Ceiling, "10", "10"),
    TS(Decimal.parse("100000000000000000000"), 2, Floor, "10000000000", "10000000000"),
    TS(Decimal.parse("1000000000000000000000"), 2, HalfUp, "31622776601.68379331998893544432719", "32000000000"),
    TS(Decimal.parse("1000000000000000000000"), 2, HalfEven, "31622776601.68379331998893544432719", "32000000000"),
    TS(Decimal.parse("0.0000"), 6, Up, "0.00", "0.00"),
    TS(Decimal.parse("100.0000"), 6, Down, "10.00", "10.00"),
    TS(Decimal.parse("18446744073709551616.000"), 6, Ceiling, "4294967296.0", "4294970000"),
    TS(Decimal.parse("1291272085159668613120.0000"), 6, Floor, "35934274518.34346708159527772609449", "35934200000"),
    TS(Decimal.parse("4391272085160668623121.159739"), 6, HalfUp, "66266674016.13475140506395066769751", "66266700000"),
    TS(Decimal.parse("43912720851606686231211.59739"), 6, HalfEven, "209553622854.8833422225125476009823",
        "209554000000"),
    TS(Decimal.parse("100000000000000000000000000000000000000000000000000000000000000000000"), 100, HalfEven,
        "10000000000000000000000000000000000", "10000000000000000000000000000000000"),
    TS(Decimal.parse("1000000000000000000000000000000000000000000000000000000000000000000000"), 36, HalfEven,
        "31622776601683793319988935444327190", "31622776601683793319988935444327185.3"),
    TS(Decimal.parse("-00010000"), 1, Up, "Negative decimal cannot be squared.", "Negative decimal cannot be squared."),
    TS(Decimal(BigInt(21), Int32.Min), 1, Up, "Scale overflow during calculation.", "Scale overflow during calculation.")
]

@Test
class DecimalSqrtTest {
    @TestCase
    func sqrtTest() {
        for (tc in tc4Sqrt) {
            try {
                let actual = sqrt(tc.origin).toString()
                @Expect(actual, tc.result1)
            } catch (e: OverflowException | IllegalArgumentException) {
                @Expect(e.message, tc.result1)
            }
        }
    }

    @TestCase
    func sqrtWithPrecisionTest() {
        for (tc in tc4Sqrt) {
            try {
                let actual = tc.origin.sqrtWithPrecision(tc.precision, roundingMode: tc.roundingMode).toString()
                @Expect(actual, tc.result2)
            } catch (e: OverflowException | IllegalArgumentException) {
                @Expect(e.message, tc.result2)
            }
        }
    }
}
