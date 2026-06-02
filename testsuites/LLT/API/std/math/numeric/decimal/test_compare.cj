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

/*
 * Test description: Test the compare func for decimal
 * Test class:
 * public struct Decimal <: Comparable<Decimal> & Hashable & ToString
 */
struct TestCaseStruct {
    let d1: Decimal
    let d2: Decimal
    let result: String

    public init(d1: Decimal, d2: Decimal, result: String) {
        this.d1 = d1
        this.d2 = d2
        this.result = result
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

func printStructInfo(tcStruct: TestCaseStruct, oper: String, execRes: String, verifyResult: Bool, isDetail: Bool): Unit {
    if (isDetail) {
        println(
            "result: ${verifyResult}, ${tcStruct.d1} ${oper} ${tcStruct.d2} = ${execRes}, expectResult: ${tcStruct.result}")
    } else {
        println("result: ${verifyResult}, execResult: ${execRes}, expectResult: ${tcStruct.result}")
    }
}

let isDebug: Bool = false
let isDetail: Bool = true
let compareTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("4165153151"), Decimal.parse("4311684186416851"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("481151"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("464131168146844"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("0"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("481151"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("684684"), Decimal.parse("-481151"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("-0"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("-4641311653153168146844"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("-46813131161635"), Decimal.parse("-481151"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("-4641315"), Decimal.parse("-4641315"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("1515"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("16551"), Decimal.parse("461615156.464684"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("465131"), Decimal.parse("465131.0000"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("156151"), Decimal.parse("-4646531.41611"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("-46456465"), Decimal.parse("-6846135135135.5641156"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("-456465465465465.000000"), Decimal.parse("-456465465465465"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("151.165156"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("168135.465156151"), Decimal.parse("461615156.464684"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("465131.165153"), Decimal.parse("465131.165153000"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("156151.354351"), Decimal.parse("-4646531.41611"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135.68461351"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0.000"), "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("-46456465.6543413465413141"), Decimal.parse("-6846135135135.5641156"), "Ordering.GT"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615.64343413514643131351"), "Ordering.LT"),
    TestCaseStruct(Decimal.parse("-456465465465465.65413511"), Decimal.parse("-456465465465465.6541351100000"),
        "Ordering.EQ"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("-0.0000"), "Ordering.EQ")
]
let GTTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("4165153151"), Decimal.parse("4311684186416851"), "false"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("481151"), "true"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("464131168146844"), "false"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("0"), "false"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("481151"), "false"),
    TestCaseStruct(Decimal.parse("684684"), Decimal.parse("-481151"), "true"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("-0"), "false"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("-4641311653153168146844"), "true"),
    TestCaseStruct(Decimal.parse("-46813131161635"), Decimal.parse("-481151"), "false"),
    TestCaseStruct(Decimal.parse("-4641315"), Decimal.parse("-4641315"), "false"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("1515"), "true"),
    TestCaseStruct(Decimal.parse("16551"), Decimal.parse("461615156.464684"), "false"),
    TestCaseStruct(Decimal.parse("465131"), Decimal.parse("465131.0000"), "false"),
    TestCaseStruct(Decimal.parse("156151"), Decimal.parse("-4646531.41611"), "true"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0"), "false"),
    TestCaseStruct(Decimal.parse("-46456465"), Decimal.parse("-6846135135135.5641156"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.000000"), Decimal.parse("-456465465465465"), "false"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("151.165156"), "true"),
    TestCaseStruct(Decimal.parse("168135.465156151"), Decimal.parse("461615156.464684"), "false"),
    TestCaseStruct(Decimal.parse("465131.165153"), Decimal.parse("465131.165153000"), "false"),
    TestCaseStruct(Decimal.parse("156151.354351"), Decimal.parse("-4646531.41611"), "true"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135.68461351"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0.000"), "false"),
    TestCaseStruct(Decimal.parse("-46456465.6543413465413141"), Decimal.parse("-6846135135135.5641156"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615.64343413514643131351"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.65413511"), Decimal.parse("-456465465465465.6541351100000"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("-0.0000"), "false")
]
let GTEQTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("4165153151"), Decimal.parse("4311684186416851"), "false"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("481151"), "true"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("464131168146844"), "true"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("0"), "true"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("481151"), "false"),
    TestCaseStruct(Decimal.parse("684684"), Decimal.parse("-481151"), "true"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("-0"), "true"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("-4641311653153168146844"), "true"),
    TestCaseStruct(Decimal.parse("-46813131161635"), Decimal.parse("-481151"), "false"),
    TestCaseStruct(Decimal.parse("-4641315"), Decimal.parse("-4641315"), "true"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("1515"), "true"),
    TestCaseStruct(Decimal.parse("16551"), Decimal.parse("461615156.464684"), "false"),
    TestCaseStruct(Decimal.parse("465131"), Decimal.parse("465131.0000"), "true"),
    TestCaseStruct(Decimal.parse("156151"), Decimal.parse("-4646531.41611"), "true"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0"), "true"),
    TestCaseStruct(Decimal.parse("-46456465"), Decimal.parse("-6846135135135.5641156"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.000000"), Decimal.parse("-456465465465465"), "true"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("151.165156"), "true"),
    TestCaseStruct(Decimal.parse("168135.465156151"), Decimal.parse("461615156.464684"), "false"),
    TestCaseStruct(Decimal.parse("465131.165153"), Decimal.parse("465131.165153000"), "true"),
    TestCaseStruct(Decimal.parse("156151.354351"), Decimal.parse("-4646531.41611"), "true"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135.68461351"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0.000"), "true"),
    TestCaseStruct(Decimal.parse("-46456465.6543413465413141"), Decimal.parse("-6846135135135.5641156"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615.64343413514643131351"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.65413511"), Decimal.parse("-456465465465465.6541351100000"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("-0.0000"), "true")
]
let LTTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("4165153151"), Decimal.parse("4311684186416851"), "true"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("481151"), "false"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("464131168146844"), "false"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("0"), "false"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("481151"), "true"),
    TestCaseStruct(Decimal.parse("684684"), Decimal.parse("-481151"), "false"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("-0"), "false"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("-4641311653153168146844"), "false"),
    TestCaseStruct(Decimal.parse("-46813131161635"), Decimal.parse("-481151"), "true"),
    TestCaseStruct(Decimal.parse("-4641315"), Decimal.parse("-4641315"), "false"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("1515"), "false"),
    TestCaseStruct(Decimal.parse("16551"), Decimal.parse("461615156.464684"), "true"),
    TestCaseStruct(Decimal.parse("465131"), Decimal.parse("465131.0000"), "false"),
    TestCaseStruct(Decimal.parse("156151"), Decimal.parse("-4646531.41611"), "false"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0"), "false"),
    TestCaseStruct(Decimal.parse("-46456465"), Decimal.parse("-6846135135135.5641156"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.000000"), Decimal.parse("-456465465465465"), "false"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("151.165156"), "false"),
    TestCaseStruct(Decimal.parse("168135.465156151"), Decimal.parse("461615156.464684"), "true"),
    TestCaseStruct(Decimal.parse("465131.165153"), Decimal.parse("465131.165153000"), "false"),
    TestCaseStruct(Decimal.parse("156151.354351"), Decimal.parse("-4646531.41611"), "false"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135.68461351"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0.000"), "false"),
    TestCaseStruct(Decimal.parse("-46456465.6543413465413141"), Decimal.parse("-6846135135135.5641156"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615.64343413514643131351"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.65413511"), Decimal.parse("-456465465465465.6541351100000"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("-0.0000"), "false")
]
let LTEQTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("4165153151"), Decimal.parse("4311684186416851"), "true"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("481151"), "false"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("464131168146844"), "true"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("0"), "true"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("481151"), "true"),
    TestCaseStruct(Decimal.parse("684684"), Decimal.parse("-481151"), "false"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("-0"), "true"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("-4641311653153168146844"), "false"),
    TestCaseStruct(Decimal.parse("-46813131161635"), Decimal.parse("-481151"), "true"),
    TestCaseStruct(Decimal.parse("-4641315"), Decimal.parse("-4641315"), "true"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("1515"), "false"),
    TestCaseStruct(Decimal.parse("16551"), Decimal.parse("461615156.464684"), "true"),
    TestCaseStruct(Decimal.parse("465131"), Decimal.parse("465131.0000"), "true"),
    TestCaseStruct(Decimal.parse("156151"), Decimal.parse("-4646531.41611"), "false"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0"), "true"),
    TestCaseStruct(Decimal.parse("-46456465"), Decimal.parse("-6846135135135.5641156"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.000000"), Decimal.parse("-456465465465465"), "true"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("151.165156"), "false"),
    TestCaseStruct(Decimal.parse("168135.465156151"), Decimal.parse("461615156.464684"), "true"),
    TestCaseStruct(Decimal.parse("465131.165153"), Decimal.parse("465131.165153000"), "true"),
    TestCaseStruct(Decimal.parse("156151.354351"), Decimal.parse("-4646531.41611"), "false"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135.68461351"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0.000"), "true"),
    TestCaseStruct(Decimal.parse("-46456465.6543413465413141"), Decimal.parse("-6846135135135.5641156"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615.64343413514643131351"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.65413511"), Decimal.parse("-456465465465465.6541351100000"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("-0.0000"), "true")
]
let EQTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("4165153151"), Decimal.parse("4311684186416851"), "false"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("481151"), "false"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("464131168146844"), "true"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("0"), "true"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("481151"), "false"),
    TestCaseStruct(Decimal.parse("684684"), Decimal.parse("-481151"), "false"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("-0"), "true"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("-4641311653153168146844"), "false"),
    TestCaseStruct(Decimal.parse("-46813131161635"), Decimal.parse("-481151"), "false"),
    TestCaseStruct(Decimal.parse("-4641315"), Decimal.parse("-4641315"), "true"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("1515"), "false"),
    TestCaseStruct(Decimal.parse("16551"), Decimal.parse("461615156.464684"), "false"),
    TestCaseStruct(Decimal.parse("465131"), Decimal.parse("465131.0000"), "true"),
    TestCaseStruct(Decimal.parse("156151"), Decimal.parse("-4646531.41611"), "false"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0"), "true"),
    TestCaseStruct(Decimal.parse("-46456465"), Decimal.parse("-6846135135135.5641156"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.000000"), Decimal.parse("-456465465465465"), "true"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("151.165156"), "false"),
    TestCaseStruct(Decimal.parse("168135.465156151"), Decimal.parse("461615156.464684"), "false"),
    TestCaseStruct(Decimal.parse("465131.165153"), Decimal.parse("465131.165153000"), "true"),
    TestCaseStruct(Decimal.parse("156151.354351"), Decimal.parse("-4646531.41611"), "false"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135.68461351"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0.000"), "true"),
    TestCaseStruct(Decimal.parse("-46456465.6543413465413141"), Decimal.parse("-6846135135135.5641156"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615.64343413514643131351"), "false"),
    TestCaseStruct(Decimal.parse("-456465465465465.65413511"), Decimal.parse("-456465465465465.6541351100000"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("-0.0000"), "true")
]
let NotEQTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("4165153151"), Decimal.parse("4311684186416851"), "true"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("481151"), "true"),
    TestCaseStruct(Decimal.parse("464131168146844"), Decimal.parse("464131168146844"), "false"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("0"), "false"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("481151"), "true"),
    TestCaseStruct(Decimal.parse("684684"), Decimal.parse("-481151"), "true"),
    TestCaseStruct(Decimal.parse("0"), Decimal.parse("-0"), "false"),
    TestCaseStruct(Decimal.parse("-464131168146844"), Decimal.parse("-4641311653153168146844"), "true"),
    TestCaseStruct(Decimal.parse("-46813131161635"), Decimal.parse("-481151"), "true"),
    TestCaseStruct(Decimal.parse("-4641315"), Decimal.parse("-4641315"), "false"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("1515"), "true"),
    TestCaseStruct(Decimal.parse("16551"), Decimal.parse("461615156.464684"), "true"),
    TestCaseStruct(Decimal.parse("465131"), Decimal.parse("465131.0000"), "false"),
    TestCaseStruct(Decimal.parse("156151"), Decimal.parse("-4646531.41611"), "true"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0"), "false"),
    TestCaseStruct(Decimal.parse("-46456465"), Decimal.parse("-6846135135135.5641156"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.000000"), Decimal.parse("-456465465465465"), "false"),
    TestCaseStruct(Decimal.parse("154151.1651531"), Decimal.parse("151.165156"), "true"),
    TestCaseStruct(Decimal.parse("168135.465156151"), Decimal.parse("461615156.464684"), "true"),
    TestCaseStruct(Decimal.parse("465131.165153"), Decimal.parse("465131.165153000"), "false"),
    TestCaseStruct(Decimal.parse("156151.354351"), Decimal.parse("-4646531.41611"), "true"),
    TestCaseStruct(Decimal.parse("-46816113135.46465413"), Decimal.parse("468135.68461351"), "true"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("0.000"), "false"),
    TestCaseStruct(Decimal.parse("-46456465.6543413465413141"), Decimal.parse("-6846135135135.5641156"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.46456"), Decimal.parse("-45615.64343413514643131351"), "true"),
    TestCaseStruct(Decimal.parse("-456465465465465.65413511"), Decimal.parse("-456465465465465.6541351100000"), "false"),
    TestCaseStruct(Decimal.parse("-0.0000000000"), Decimal.parse("-0.0000"), "false")
]
let stringTestArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("1"), Decimal.parse("0"), "1"),
    TestCaseStruct(Decimal.parse("0.1"), Decimal.parse("0"), "0.1"),
    TestCaseStruct(Decimal.parse("1234.56789"), Decimal.parse("0"), "1234.56789"),
    TestCaseStruct(Decimal.parse("-45801681351.515616810"), Decimal.parse("0"), "-45801681351.515616810"),
    TestCaseStruct(Decimal.parse("-00000000002561616816.168518616"), Decimal.parse("0"), "-2561616816.168518616"),
    TestCaseStruct(Decimal.parse("+16518616.561861685"), Decimal.parse("0"), "16518616.561861685"),
    TestCaseStruct(Decimal.parse("00.000000"), Decimal.parse("0"), "0.000000"),
    TestCaseStruct(Decimal.parse("-00.000000"), Decimal.parse("0"), "0.000000"),
    TestCaseStruct(Decimal.parse("-15165E12"), Decimal.parse("0"), "-15165000000000000"),
    TestCaseStruct(Decimal.parse("+16810631E-20"), Decimal.parse("0"), "0.00000000000016810631"),
    TestCaseStruct(Decimal.parse("+18616161.51125312e-10"), Decimal.parse("0"), "0.001861616151125312"),
    TestCaseStruct(Decimal.parse("0E5"), Decimal.parse("0"), "0"),
    TestCaseStruct(Decimal.parse("0E-5"), Decimal.parse("0"), "0.00000"),
    TestCaseStruct(Decimal.parse("0.e0"), Decimal.parse("0"), "0"),
    TestCaseStruct(Decimal.parse(".0e-0"), Decimal.parse("0"), "0.0"),
    TestCaseStruct(Decimal.parse("156161.1681E0"), Decimal.parse("0"), "156161.1681"),
    TestCaseStruct(Decimal.parse("24515668.89118"), Decimal.parse("0"), "24515668.89118"),
    TestCaseStruct(Decimal.parse("148611161"), Decimal.parse("0"), "148611161"),
    TestCaseStruct(Decimal.parse("115613615631E-10"), Decimal.parse("0"), "11.5613615631"),
    TestCaseStruct(Decimal.parse("-.2168168464e+5"), Decimal.parse("0"), "-21681.68464")
]
let hashTestArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("3465156.15115000"), Decimal.parse("3465156.15115"), "true"),
    TestCaseStruct(Decimal.parse("0E5"), Decimal.parse("0E-5"), "true"),
    TestCaseStruct(Decimal.parse("0E5"), Decimal.parse("-0E-5"), "true"),
    TestCaseStruct(Decimal.parse("3.4615115E5"), Decimal.parse("3.46151150000E5"), "true"),
    TestCaseStruct(Decimal.parse("3465156.15115000"), Decimal.parse("-3465156.15115000"), "true"),
    TestCaseStruct(Decimal.parse("534.1511505435300"), Decimal.parse("-55645.434343"), "false")
]

@Test
class DecimalCompareTest {
    @TestCase
    func compareTest(): Unit {
        for (tc in compareTCArray) {
            let result = tc.d1.compare(tc.d2)
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "compare", result.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "compare", result.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func compareOperatorTest(): Unit {
        var resultRecord: ArrayList<(TestCaseStruct, String, String, Bool)> = ArrayList()
        for (tc in GTTCArray) {
            let result = (tc.d1 > tc.d2)
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            resultRecord.add((tc, ">", result.toString(), checkResult))
        }

        for (tc in GTEQTCArray) {
            let result = (tc.d1 >= tc.d2)
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            resultRecord.add((tc, ">=", result.toString(), checkResult))
        }

        for (tc in LTTCArray) {
            let result = (tc.d1 < tc.d2)
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            resultRecord.add((tc, "<", result.toString(), checkResult))
        }

        for (tc in LTEQTCArray) {
            let result = (tc.d1 <= tc.d2)
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            resultRecord.add((tc, "<=", result.toString(), checkResult))
        }

        for (tc in EQTCArray) {
            let result = (tc.d1 == tc.d2)
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            resultRecord.add((tc, "==", result.toString(), checkResult))
        }

        for (tc in NotEQTCArray) {
            let result = (tc.d1 != tc.d2)
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            resultRecord.add((tc, "!=", result.toString(), checkResult))
        }

        for (record in resultRecord) {
            if (!record[3]) {
                printStructInfo(record[0], record[1], record[2], record[3], isDetail)
            }

            if (record[3] && isDebug) {
                printStructInfo(record[0], record[1], record[2], record[3], isDetail)
            }
        }
    }

    @TestCase
    func hashCodeTest(): Unit {
        for (tc in hashTestArray) {
            let result = (tc.d1.hashCode() == tc.d2.hashCode())
            let checkResult = result.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "hashCode", result.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "hashCode", result.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func toStringTest(): Unit {
        for (tc in stringTestArray) {
            let result = tc.d1.toString()
            let checkResult = result == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "toString", result, checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "toString", result, checkResult, isDetail)
            }
        }
    }
}
