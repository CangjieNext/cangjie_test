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
import std.collection.*

struct RoundStruct {
    public let input: Decimal
    public let expectOutput: String
    public let inputPrecision: Int64
    public let inputRoundingMode: RoundingMode

    RoundStruct(input: Decimal, expectOutput: String, inputPrecision: Int64, inputRoundingMode: RoundingMode) {
        this.input = input
        this.expectOutput = expectOutput
        this.inputPrecision = inputPrecision
        this.inputRoundingMode = inputRoundingMode
    }
}

func printRoundingMode(roundingMode: RoundingMode): String {
    match (roundingMode) {
        case RoundingMode.Up => "Up"
        case RoundingMode.Down => "Down"
        case RoundingMode.Ceiling => "Ceiling"
        case RoundingMode.Floor => "Floor"
        case RoundingMode.HalfEven => "HalfEven"
        case RoundingMode.HalfUp => "HalfUp"
    }
}

func printStructInfo(tcStruct: RoundStruct, execRes: String, verifyResult: Bool, isDetail: Bool): Unit {
    if (isDetail) {
        println(
            "result: ${verifyResult}, expectResult: ${tcStruct.expectOutput}, precision: (${tcStruct.inputPrecision}, ${printRoundingMode(tcStruct.inputRoundingMode)})")
    } else {
        println("result: ${verifyResult}, execResult: ${execRes}, expectResult: ${tcStruct.expectOutput}")
    }
}

let isDebug: Bool = false
let isDetail: Bool = false
let roundArray: Array<RoundStruct> = [
    RoundStruct(Decimal.parse("0.5"), "1", 0, Up),
    RoundStruct(Decimal.parse("0.5"), "0", 0, Down),
    RoundStruct(Decimal.parse("0.5"), "1", 0, HalfUp),
    RoundStruct(Decimal.parse("0.5"), "0", 0, HalfEven),
    RoundStruct(Decimal.parse("0.5"), "1", 0, Ceiling),
    RoundStruct(Decimal.parse("0.5"), "0", 0, Floor),
    RoundStruct(Decimal.parse("-0.5"), "-1", 0, Up),
    RoundStruct(Decimal.parse("-0.5"), "0", 0, Down),
    RoundStruct(Decimal.parse("-0.5"), "-1", 0, HalfUp),
    RoundStruct(Decimal.parse("-0.5"), "0", 0, HalfEven),
    RoundStruct(Decimal.parse("-0.5"), "0", 0, Ceiling),
    RoundStruct(Decimal.parse("-0.5"), "-1", 0, Floor),
    RoundStruct(Decimal.parse("1.5"), "2", 0, Up),
    RoundStruct(Decimal.parse("1.5"), "1", 0, Down),
    RoundStruct(Decimal.parse("1.5"), "2", 0, HalfUp),
    RoundStruct(Decimal.parse("1.5"), "2", 0, HalfEven),
    RoundStruct(Decimal.parse("1.5"), "2", 0, Ceiling),
    RoundStruct(Decimal.parse("1.5"), "1", 0, Floor),
    RoundStruct(Decimal.parse("-1.5"), "-2", 0, Up),
    RoundStruct(Decimal.parse("-1.5"), "-1", 0, Down),
    RoundStruct(Decimal.parse("-1.5"), "-2", 0, HalfUp),
    RoundStruct(Decimal.parse("-1.5"), "-2", 0, HalfEven),
    RoundStruct(Decimal.parse("-1.5"), "-1", 0, Ceiling),
    RoundStruct(Decimal.parse("-1.5"), "-2", 0, Floor),
    RoundStruct(Decimal.parse("-2.5"), "-2", 0, HalfEven),
    RoundStruct(Decimal.parse("2.5"), "2", 0, HalfEven),
    RoundStruct(Decimal.parse("100"), "100", 0, HalfEven),
    RoundStruct(Decimal.parse("0.99"), "1", 0, HalfEven),
    RoundStruct(Decimal.parse("0.01"), "0", 0, HalfEven),
    RoundStruct(Decimal.parse("1.99"), "1", 0, Down),
    RoundStruct(Decimal.parse("1.01"), "1", 0, HalfEven),
    RoundStruct(Decimal.parse("-1.99"), "-2", 0, HalfEven),
    RoundStruct(Decimal.parse("-1.01"), "-1", 0, HalfEven)
]
let roundWithPrecisionArray: Array<RoundStruct> = [
    RoundStruct(Decimal(BigInt("-784637716923335095224261902710254454442933591094742482943")),
        "-784637716923335095224261902710300000000000000000000000000", 31, Up),
    RoundStruct(Decimal(148611161), "148610000", 5, Floor),
    RoundStruct(Decimal(Int8.Max), "130", 2, HalfUp),
    RoundStruct(Decimal(Int8.Min), "-130", 2, HalfEven),
    RoundStruct(Decimal(Int8.Max), "127", 0, HalfUp),
    RoundStruct(Decimal(Int8.Min), "-128", 0, HalfEven),
    RoundStruct(Decimal(Int8.Min), "-120", 2, Ceiling),
    RoundStruct(Decimal(Int8.Min), "-130", 2, Floor),
    RoundStruct(Decimal(Int8.Max), "120", 2, Down),
    RoundStruct(Decimal(Int8.Min), "-120", 2, Down),
    RoundStruct(Decimal(Int8.Max), "130", 2, Up),
    RoundStruct(Decimal(Int8.Min), "-130", 2, Up),
    RoundStruct(Decimal(Int64.Max), "9223372037000000000", 10, HalfUp),
    RoundStruct(Decimal(Int64.Min), "-9223372037000000000", 10, HalfEven),
    RoundStruct(Decimal(0.1f16), "0.099976", 5, Up),
    RoundStruct(Decimal(0.1f32), "0.1000000015", 10, HalfUp),
    RoundStruct(Decimal(0.1f64), "0.1000000000000000055", 19, Down),
    RoundStruct(Decimal(-12.48606811663f16), "-12.484", 5, HalfEven),
    RoundStruct(Decimal(-1515.1468168186163f32), "-1515.1468", 8, Ceiling),
    RoundStruct(Decimal.parse("-1265168516.15136513"), "-1265168517", 10, Floor),
    RoundStruct(Decimal.parse("0.99"), "1", 1, HalfEven),
    RoundStruct(Decimal.parse("0.99"), "0.9", 1, Down),
    RoundStruct(Decimal.parse("0.99"), "1", 1, Up),
    RoundStruct(Decimal.parse("9.99"), "10", 2, Up),
    RoundStruct(Decimal.parse("9.99"), "9", 1, Down),
    RoundStruct(Decimal.parse("9.99"), "9.9", 2, Down)
]

@Test
class RoundTest {
    @TestCase
    func roundTest(): Unit {
        for (item in roundArray) {
            let roundResult = round(item.input, roundingMode: item.inputRoundingMode)
            let checkResult = item.expectOutput == roundResult.toString()
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(item, roundResult.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(item, roundResult.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func roundWithPrecisionTest(): Unit {
        for (item in roundWithPrecisionArray) {
            let roundResult = item.input.roundWithPrecision(item.inputPrecision, roundingMode: item.inputRoundingMode)
            let checkResult = item.expectOutput == roundResult.toString()
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(item, roundResult.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(item, roundResult.toString(), checkResult, isDetail)
            }
        }
    }
}
