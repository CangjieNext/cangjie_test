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

struct TP {
    TP(let origin: Decimal, let n: Int64, let result: String) {}
}

struct TPC {
    TPC(let origin: Decimal, let n: Int64, let precision: Int64, let roundingMode: RoundingMode, let result: String) {}
}

let tc4Pow = [
    TP(Decimal.parse("1"), 0, "1"),
    TP(Decimal.parse("1"), Int64.Min, "1"),
    TP(Decimal.parse("10"), 1, "10"),
    TP(Decimal.parse("10"), 2, "100"),
    TP(Decimal.parse("10"), 4, "10000"),
    TP(Decimal.parse("10"), 8, "100000000"),
    TP(Decimal.parse("123456789"), 10,
        "822526259147102579504761143661535547764137892295514168093701699676416207799736601"),
    TP(Decimal.parse("-1"), 0, "1"),
    TP(Decimal.parse("-10"), 1, "-10"),
    TP(Decimal.parse("-10"), 3, "-1000"),
    TP(Decimal.parse("-10"), 5, "-100000"),
    TP(Decimal.parse("-10"), 9, "-1000000000"),
    TP(Decimal.parse("-0987654321"), 9,
        "-894220687831492019250297979565814868578596665098830988949577166415194442181407281"),
    TP(Decimal.parse("1.1"), 0, "1"),
    TP(Decimal.parse("1.1"), Int64(Int32.Min) - 1, "Scale overflow during calculation."),
    TP(Decimal.parse("1.1"), Int64(Int32.Max) + 2, "Scale overflow during calculation."),
    TP(Decimal.parse("1.1"), Int64.Min, "Scale overflow during calculation."),
    TP(Decimal.parse("22.22"), 1, "22.22"),
    TP(Decimal.parse("333.333"), 2, "111110.888889"),
    TP(Decimal.parse("4444.4444"), 4, "390184407498857.1156835832586496"),
    TP(Decimal.parse("55555.55555"), 8,
        "90744426198571547437811813814605065970.7006196824564756047297859226024875390625"),
    TP(Decimal.parse("666666.666666"), 16,
        "1522438840323085793224711919869575276124748273376630010906376324273352314390868453145784553505.096202797868164410478571057997379166551123650048032125838341166562721467399673020391006121558016"),
    TP(Decimal.parse("-1.1"), 0, "1"),
    TP(Decimal.parse("-22.22"), 1, "-22.22"),
    TP(Decimal.parse("-333.333"), 3, "-37036925.926037037"),
    TP(Decimal.parse("-4444.4444"), 5, "-1734152904875613514.20005378583896628224"),
    TP(Decimal.parse("-55555.55555"), 9,
        "-5041357010527616934330814392823549143846672.949188134090915785464562750497044569513671875"),
    TP(Decimal.parse("-666666.666666"), 15,
        "-2283658260486912348097554792152460468979274870533924291230098410701258569997003938288673.834195932978030998179593748854766589817604593275292676641464050188391308132389490817662976"),
    TP(Decimal.parse("10"), -1, "0.1"),
    TP(Decimal.parse("10"), -2, "0.01"),
    TP(Decimal.parse("10"), -5, "0.00001"),
    TP(Decimal.parse("10"), -9, "0.000000001"),
    TP(Decimal.parse("123456789"), -10,
        "0.000000000000000000000000000000000000000000000000000000000000000000000000000000001215766656540454094787775300490056"),
    TP(Decimal.parse("-1"), -1, "-1"),
    TP(Decimal.parse("-4294967295"), -7,
        "-0.00000000000000000000000000000000000000000000000000000000000000000003709206156732739379927987616731351"),
    TP(Decimal.parse("-4294967295"), -8,
        "0.000000000000000000000000000000000000000000000000000000000000000000000000000008636168571180562109327977121956992"),
    TP(Decimal.parse("-18446744073709551615"), -2,
        "0.000000000000000000000000000000000000002938735877055718770240459725282105"),
    TP(Decimal.parse("1.1"), -0, "1"),
    TP(Decimal.parse("22.2"), -3, "0.00009139892266261879117978460564289637"),
    TP(Decimal.parse("333.33"), -5, "0.0000000000002430121503645085051701030618510308"),
    TP(Decimal.parse("4444.444"), -7, "0.00000000000000000000000002919294646044701679517681577418439"),
    TP(Decimal.parse("55555.5555"), -9, "0.0000000000000000000000000000000000000000001983592921532336222381680992892830"),
    TP(Decimal.parse("666666.66666"), -11,
        "0.00000000000000000000000000000000000000000000000000000000000000008649755860326473144588338388674349")
]
let tc4PowCtx = [
    TPC(Decimal.parse("6"), 2, 1, HalfEven, "40"),
    TPC(Decimal.parse("6"), 2, 2, HalfEven, "36"),
    TPC(Decimal.parse("6"), 2, 3, HalfEven, "36"),
    TPC(Decimal.parse("6"), 2, 1, HalfUp, "40"),
    TPC(Decimal.parse("6"), 2, 1, Up, "40"),
    TPC(Decimal.parse("6"), 2, 1, Ceiling, "40"),
    TPC(Decimal.parse("6"), 2, 1, Down, "30"),
    TPC(Decimal.parse("6"), 2, 1, Floor, "30"),
    TPC(Decimal.parse("1"), Int64.Min, 25, HalfEven, "1"),
    TPC(Decimal.parse("1.00"), 2, 1, HalfEven, "1"),
    TPC(Decimal.parse("1.00"), 2, 2, HalfEven, "1.0"),
    TPC(Decimal.parse("1.00"), 2, 3, HalfEven, "1.00"),
    TPC(Decimal.parse("1.00"), 2, 4, HalfEven, "1.000"),
    TPC(Decimal.parse("1.00"), 2, 5, HalfEven, "1.0000"),
    TPC(Decimal.parse("-1.23456789"), 3, 14, HalfEven, "-1.8816763717892"),
    TPC(Decimal.parse("-1.23456789"), 3, 14, HalfUp, "-1.8816763717892"),
    TPC(Decimal.parse("-1.23456789"), 3, 14, Up, "-1.8816763717892"),
    TPC(Decimal.parse("-1.23456789"), 3, 14, Ceiling, "-1.8816763717891"),
    TPC(Decimal.parse("-1.23456789"), 3, 14, Down, "-1.8816763717891"),
    TPC(Decimal.parse("-1.23456789"), 3, 14, Floor, "-1.8816763717892"),
    TPC(Decimal.parse("35.71"), 111, 20, HalfEven,
        "22891453615158987219000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
    TPC(Decimal.parse("35.71"), 111, 20, HalfUp,
        "22891453615158987219000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
    TPC(Decimal.parse("35.71"), 111, 20, Up,
        "22891453615158987220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
    TPC(Decimal.parse("35.71"), 111, 20, Ceiling,
        "22891453615158987220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
    TPC(Decimal.parse("35.71"), 111, 20, Down,
        "22891453615158987219000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
    TPC(Decimal.parse("35.71"), 111, 20, Floor,
        "22891453615158987219000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
    TPC(Decimal.parse("9.9"), 2, 3, Floor, "98.0"),
    TPC(Decimal.parse("9.9"), 2, 2, Up, "99"),
    TPC(Decimal.parse("9.9"), 2, 1, Floor, "90"),
    TPC(Decimal.parse("9.9"), 2, 1, Up, "100"),
    TPC(Decimal.parse("1600"), -4, 11, HalfEven, "0.00000000000015258789062"),
    TPC(Decimal.parse("1600"), -4, 11, HalfUp, "0.00000000000015258789063"),
    TPC(Decimal.parse("1600"), -4, 11, Up, "0.00000000000015258789063"),
    TPC(Decimal.parse("1600"), -4, 11, Ceiling, "0.00000000000015258789063"),
    TPC(Decimal.parse("1600"), -4, 11, Down, "0.00000000000015258789062"),
    TPC(Decimal.parse("1600"), -4, 11, Floor, "0.00000000000015258789062")
]

@Test
class DecimalPowTest {
    @TestCase
    func powTest() {
        for (tc in tc4Pow) {
            try {
                let actual = (tc.origin ** tc.n).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func powWithCtxTest() {
        for (tc in tc4PowCtx) {
            try {
                let actual = tc.origin.powWithPrecision(tc.n, tc.precision, roundingMode: tc.roundingMode).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }
}
