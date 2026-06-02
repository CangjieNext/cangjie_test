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
 * Test description: Test the property func for decimal
 * Test class:
 * public struct Decimal <: Comparable<Decimal> & Hashable & ToString
 */
struct PropTCStruct {
    let d: Decimal
    let result: String

    public init(d: Decimal, result: String) {
        this.d = d
        this.result = result
    }
}

struct ReScaleTCStruct {
    let d: Decimal
    let newScale: Int32
    let roundingMode: RoundingMode
    let result: String

    public init(d: Decimal, newScale: Int32, roundingMode: RoundingMode, result: String) {
        this.d = d
        this.newScale = newScale
        this.roundingMode = roundingMode
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

func printStructInfo(tcStruct: PropTCStruct, propName: String, propVal: String, verifyResult: Bool, isDetail: Bool): Unit {
    if (isDetail) {
        println(
            "result: ${verifyResult}, decimal: ${tcStruct.d}, prop: ${propName},  propVal: ${propVal}, expectResult: ${tcStruct.result}")
    } else {
        println("result: ${verifyResult}, propVal: ${propVal}, expectResult: ${tcStruct.result}")
    }
}

let isDebug: Bool = false
let isDetail: Bool = true
let signTCArray: Array<PropTCStruct> = [
    PropTCStruct(Decimal.parse("1"), "1"),
    PropTCStruct(Decimal.parse("0.1"), "1"),
    PropTCStruct(Decimal.parse("1234.56789"), "1"),
    PropTCStruct(Decimal.parse("-45801681351.515616810"), "-1"),
    PropTCStruct(Decimal.parse("-00000000002561616816.168518616"), "-1"),
    PropTCStruct(Decimal.parse("+16518616.561861685"), "1"),
    PropTCStruct(Decimal.parse("00.000000"), "0"),
    PropTCStruct(Decimal.parse("-00.000000"), "0"),
    PropTCStruct(Decimal.parse("-15165E12"), "-1"),
    PropTCStruct(Decimal.parse("+16810631E-20"), "1"),
    PropTCStruct(Decimal.parse("+18616161.51125312e-10"), "1"),
    PropTCStruct(Decimal.parse("0E5"), "0"),
    PropTCStruct(Decimal.parse("0E-5"), "0"),
    PropTCStruct(Decimal.parse("0.e0"), "0"),
    PropTCStruct(Decimal.parse(".0e-0"), "0"),
    PropTCStruct(Decimal.parse("156161.1681E0"), "1"),
    PropTCStruct(Decimal.parse("24515668.89118"), "1"),
    PropTCStruct(Decimal.parse("148611161"), "1"),
    PropTCStruct(Decimal.parse("115613615631E-10"), "1"),
    PropTCStruct(Decimal.parse("-.2168168464e+5"), "-1")
]
let scaleTCArray: Array<PropTCStruct> = [
    PropTCStruct(Decimal.parse("1"), "0"),
    PropTCStruct(Decimal.parse("0.1"), "1"),
    PropTCStruct(Decimal.parse("1234.56789"), "5"),
    PropTCStruct(Decimal.parse("-45801681351.515616810"), "9"),
    PropTCStruct(Decimal.parse("-00000000002561616816.168518616"), "9"),
    PropTCStruct(Decimal.parse("+16518616.561861685"), "9"),
    PropTCStruct(Decimal.parse("00.000000"), "6"),
    PropTCStruct(Decimal.parse("-00.000000"), "6"),
    PropTCStruct(Decimal.parse("-15165E12"), "-12"),
    PropTCStruct(Decimal.parse("+16810631E-20"), "20"),
    PropTCStruct(Decimal.parse("+18616161.51125312e-10"), "18"),
    PropTCStruct(Decimal.parse("0E5"), "-5"),
    PropTCStruct(Decimal.parse("0E-5"), "5"),
    PropTCStruct(Decimal.parse("0.e0"), "0"),
    PropTCStruct(Decimal.parse(".0e-0"), "1"),
    PropTCStruct(Decimal.parse("156161.1681E0"), "4"),
    PropTCStruct(Decimal.parse("24515668.89118"), "5"),
    PropTCStruct(Decimal.parse("148611161"), "0"),
    PropTCStruct(Decimal.parse("115613615631E-10"), "10"),
    PropTCStruct(Decimal.parse("-.2168168464e+5"), "5")
]
let valueTCArray: Array<PropTCStruct> = [
    PropTCStruct(Decimal.parse("1"), "1"),
    PropTCStruct(Decimal.parse("0.1"), "1"),
    PropTCStruct(Decimal.parse("1234.56789"), "123456789"),
    PropTCStruct(Decimal.parse("-45801681351.515616810"), "-45801681351515616810"),
    PropTCStruct(Decimal.parse("-00000000002561616816.168518616"), "-2561616816168518616"),
    PropTCStruct(Decimal.parse("+16518616.561861685"), "16518616561861685"),
    PropTCStruct(Decimal.parse("00.000000"), "0"),
    PropTCStruct(Decimal.parse("-00.000000"), "0"),
    PropTCStruct(Decimal.parse("-15165E12"), "-15165"),
    PropTCStruct(Decimal.parse("+16810631E-20"), "16810631"),
    PropTCStruct(Decimal.parse("+18616161.51125312e-10"), "1861616151125312"),
    PropTCStruct(Decimal.parse("0E5"), "0"),
    PropTCStruct(Decimal.parse("0E-5"), "0"),
    PropTCStruct(Decimal.parse("0.e0"), "0"),
    PropTCStruct(Decimal.parse(".0e-0"), "0"),
    PropTCStruct(Decimal.parse("156161.1681E0"), "1561611681"),
    PropTCStruct(Decimal.parse("24515668.89118"), "2451566889118"),
    PropTCStruct(Decimal.parse("148611161"), "148611161"),
    PropTCStruct(Decimal.parse("115613615631E-10"), "115613615631"),
    PropTCStruct(Decimal.parse("-.2168168464e+5"), "-2168168464")
]
let precisionTCArray: Array<PropTCStruct> = [
    PropTCStruct(Decimal.parse("1"), "1"),
    PropTCStruct(Decimal.parse("0.1"), "1"),
    PropTCStruct(Decimal.parse("1234.56789"), "9"),
    PropTCStruct(Decimal.parse("-45801681351.515616810"), "20"),
    PropTCStruct(Decimal.parse("-00000000002561616816.168518616"), "19"),
    PropTCStruct(Decimal.parse("+16518616.561861685"), "17"),
    PropTCStruct(Decimal.parse("00.000000"), "1"),
    PropTCStruct(Decimal.parse("-00.000000"), "1"),
    PropTCStruct(Decimal.parse("-15165E12"), "5"),
    PropTCStruct(Decimal.parse("+16810631E-20"), "8"),
    PropTCStruct(Decimal.parse("+18616161.51125312e-10"), "16"),
    PropTCStruct(Decimal.parse("0E5"), "1"),
    PropTCStruct(Decimal.parse("0E-5"), "1"),
    PropTCStruct(Decimal.parse("0.e0"), "1"),
    PropTCStruct(Decimal.parse(".0e-0"), "1"),
    PropTCStruct(Decimal.parse("156161.1681E0"), "10"),
    PropTCStruct(Decimal.parse("24515668.89118"), "13"),
    PropTCStruct(Decimal.parse("148611161"), "9"),
    PropTCStruct(Decimal.parse("115613615631E-10"), "12"),
    PropTCStruct(Decimal.parse("-.2168168464e+5"), "10")
]
let reReScaleTCArray: Array<ReScaleTCStruct> = [
    ReScaleTCStruct(Decimal.parse("1"), 5, Up, "1.00000"),
    ReScaleTCStruct(Decimal.parse("1"), 5, Down, "1.00000"),
    ReScaleTCStruct(Decimal.parse("1"), 5, HalfEven, "1.00000"),
    ReScaleTCStruct(Decimal.parse("1"), 5, HalfUp, "1.00000"),
    ReScaleTCStruct(Decimal.parse("1"), 5, Ceiling, "1.00000"),
    ReScaleTCStruct(Decimal.parse("1"), 5, Floor, "1.00000"),
    ReScaleTCStruct(Decimal.parse("1"), -5, Up, "100000"),
    ReScaleTCStruct(Decimal.parse("1"), -5, Down, "0"),
    ReScaleTCStruct(Decimal.parse("1"), -5, HalfEven, "0"),
    ReScaleTCStruct(Decimal.parse("1"), -5, HalfUp, "0"),
    ReScaleTCStruct(Decimal.parse("1"), -5, Ceiling, "100000"),
    ReScaleTCStruct(Decimal.parse("1"), -5, Floor, "0"),
    ReScaleTCStruct(Decimal.parse("-20"), 5, Up, "-20.00000"),
    ReScaleTCStruct(Decimal.parse("-20"), 5, Down, "-20.00000"),
    ReScaleTCStruct(Decimal.parse("-20"), 5, HalfEven, "-20.00000"),
    ReScaleTCStruct(Decimal.parse("-20"), 5, HalfUp, "-20.00000"),
    ReScaleTCStruct(Decimal.parse("-20"), 5, Ceiling, "-20.00000"),
    ReScaleTCStruct(Decimal.parse("-20"), 5, Floor, "-20.00000"),
    ReScaleTCStruct(Decimal.parse("-20"), -5, Up, "-100000"),
    ReScaleTCStruct(Decimal.parse("-20"), -5, Down, "0"),
    ReScaleTCStruct(Decimal.parse("-20"), -5, HalfEven, "0"),
    ReScaleTCStruct(Decimal.parse("-20"), -5, HalfUp, "0"),
    ReScaleTCStruct(Decimal.parse("-20"), -5, Ceiling, "0"),
    ReScaleTCStruct(Decimal.parse("-20"), -5, Floor, "-100000"),
    ReScaleTCStruct(Decimal.parse("0.1"), -5, Up, "100000"),
    ReScaleTCStruct(Decimal.parse("0.1"), -5, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0.5"), -1, HalfUp, "0"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), 5, Up, "5151551.46517"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), 5, Down, "5151551.46516"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), 5, HalfEven, "5151551.46517"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), 5, HalfUp, "5151551.46517"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), 5, Ceiling, "5151551.46517"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), 5, Floor, "5151551.46516"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), -5, Up, "5200000"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), -5, Down, "5100000"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), -5, HalfEven, "5200000"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), -5, HalfUp, "5200000"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), -5, Ceiling, "5200000"),
    ReScaleTCStruct(Decimal.parse("5151551.4651651"), -5, Floor, "5100000"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), 5, Up, "-416145668.48616"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), 5, Down, "-416145668.48615"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), 5, HalfEven, "-416145668.48616"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), 5, HalfUp, "-416145668.48616"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), 5, Ceiling, "-416145668.48615"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), 5, Floor, "-416145668.48616"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), -5, Up, "-416200000"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), -5, Down, "-416100000"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), -5, HalfEven, "-416100000"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), -5, HalfUp, "-416100000"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), -5, Ceiling, "-416100000"),
    ReScaleTCStruct(Decimal.parse("-416145668.486156111"), -5, Floor, "-416200000"),
    ReScaleTCStruct(Decimal.parse("0.1"), -5, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0"), -1, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0"), -2, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0"), -3, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0"), -4, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0"), -5, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0"), -6, Down, "0"),
    ReScaleTCStruct(Decimal.parse("0"), 1, Down, "0.0"),
    ReScaleTCStruct(Decimal.parse("0"), 2, Down, "0.00"),
    ReScaleTCStruct(Decimal.parse("0"), 3, Down, "0.000"),
    ReScaleTCStruct(Decimal.parse("0"), 4, Down, "0.0000"),
    ReScaleTCStruct(Decimal.parse("0"), 5, Down, "0.00000"),
    ReScaleTCStruct(Decimal.parse("0"), 6, Down, "0.000000")
]
let removTrailZeroTCArray: Array<PropTCStruct> = [
    PropTCStruct(Decimal.parse("1000000000000"), "1000000000000"),
    PropTCStruct(Decimal.parse("0.1000000"), "0.1"),
    PropTCStruct(Decimal.parse("1234.567890000"), "1234.56789"),
    PropTCStruct(Decimal.parse("-45801681351.5156168100000"), "-45801681351.51561681"),
    PropTCStruct(Decimal.parse("-00000000002561616816.168518616"), "-2561616816.168518616"),
    PropTCStruct(Decimal.parse("+16518616.561861685000000000"), "16518616.561861685"),
    PropTCStruct(Decimal.parse("00.000000"), "0"),
    PropTCStruct(Decimal.parse("-00.000000"), "0"),
    PropTCStruct(Decimal.parse("-15165E12"), "-15165000000000000"),
    PropTCStruct(Decimal.parse("+16810631E-20"), "0.00000000000016810631"),
    PropTCStruct(Decimal.parse("+18616161.51125312e-10"), "0.001861616151125312"),
    PropTCStruct(Decimal.parse("0E5"), "0"),
    PropTCStruct(Decimal.parse("0E-5"), "0"),
    PropTCStruct(Decimal.parse("0.e0"), "0"),
    PropTCStruct(Decimal.parse(".0e-0"), "0"),
    PropTCStruct(Decimal.parse("156161.1681E0"), "156161.1681"),
    PropTCStruct(Decimal.parse("24515668.8911800000000"), "24515668.89118"),
    PropTCStruct(Decimal.parse("148611161"), "148611161"),
    PropTCStruct(Decimal.parse("115613615631E2"), "11561361563100"),
    PropTCStruct(Decimal.parse("-.2168168464e+5"), "-21681.68464")
]
let scaleUnitTCArray: Array<PropTCStruct> = [
    PropTCStruct(Decimal.parse("1"), "1"),
    PropTCStruct(Decimal.parse("0.1"), "0.1"),
    PropTCStruct(Decimal.parse("1234.56789"), "0.00001"),
    PropTCStruct(Decimal.parse("-45801681351.515616810"), "0.000000001"),
    PropTCStruct(Decimal.parse("-00000000002561616816.168518616"), "0.000000001"),
    PropTCStruct(Decimal.parse("+16518616.561861685"), "0.000000001"),
    PropTCStruct(Decimal.parse("00.000000"), "0.000001"),
    PropTCStruct(Decimal.parse("-00.000000"), "0.000001"),
    PropTCStruct(Decimal.parse("-15165E12"), "1000000000000"),
    PropTCStruct(Decimal.parse("+16810631E-20"), "0.00000000000000000001"),
    PropTCStruct(Decimal.parse("+18616161.51125312e-10"), "0.000000000000000001"),
    PropTCStruct(Decimal.parse("0E5"), "100000"),
    PropTCStruct(Decimal.parse("0E-5"), "0.00001"),
    PropTCStruct(Decimal.parse("0.e0"), "1"),
    PropTCStruct(Decimal.parse(".0e-0"), "0.1"),
    PropTCStruct(Decimal.parse("156161.1681E0"), "0.0001"),
    PropTCStruct(Decimal.parse("24515668.89118"), "0.00001"),
    PropTCStruct(Decimal.parse("148611161"), "1"),
    PropTCStruct(Decimal.parse("115613615631E-10"), "0.0000000001"),
    PropTCStruct(Decimal.parse("-.2168168464e+5"), "0.00001")
]
let isIntegerTCArray: Array<PropTCStruct> = [
    PropTCStruct(Decimal.parse("1"), "true"),
    PropTCStruct(Decimal.parse("0.1"), "false"),
    PropTCStruct(Decimal.parse("1234.56789"), "false"),
    PropTCStruct(Decimal.parse("-45801681351.515616810"), "false"),
    PropTCStruct(Decimal.parse("-00000000002561616816.168518616"), "false"),
    PropTCStruct(Decimal.parse("+16518616.561861685"), "false"),
    PropTCStruct(Decimal.parse("00.000000"), "true"),
    PropTCStruct(Decimal.parse("-00.000000"), "true"),
    PropTCStruct(Decimal.parse("-15165E12"), "true"),
    PropTCStruct(Decimal.parse("+16810631E-20"), "false"),
    PropTCStruct(Decimal.parse("+18616161.51125312e-10"), "false"),
    PropTCStruct(Decimal.parse("0E5"), "true"),
    PropTCStruct(Decimal.parse("0E-5"), "true"),
    PropTCStruct(Decimal.parse("0.e0"), "true"),
    PropTCStruct(Decimal.parse(".0e-0"), "true"),
    PropTCStruct(Decimal.parse("156161.1681E0"), "false"),
    PropTCStruct(Decimal.parse("24515668.89118"), "false"),
    PropTCStruct(Decimal.parse("148611161"), "true"),
    PropTCStruct(Decimal.parse("115613615631E-10"), "false"),
    PropTCStruct(Decimal.parse("-.2168168464e+5"), "false")
]

@Test
class DecimalPropertyTest {
    @TestCase
    func propSignTest() {
        for (tc in signTCArray) {
            let sign = tc.d.sign
            let checkResult = sign.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "sign", sign.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "sign", sign.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func propScaleTest() {
        for (tc in scaleTCArray) {
            let scale = tc.d.scale
            let checkResult = scale.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "scale", scale.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "scale", scale.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func propValueTest() {
        for (tc in valueTCArray) {
            let value = tc.d.value
            let checkResult = value.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "value", value.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "value", value.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func propPrecision() {
        for (tc in precisionTCArray) {
            let precision = tc.d.precision
            let checkResult = precision.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "precision", precision.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "precision", precision.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func reScaleTest() {
        for (tc in reReScaleTCArray) {
            let result = tc.d.reScale(tc.newScale, roundingMode: tc.roundingMode)
            @Expect(result.toString(), tc.result)
        }
    }

    @TestCase
    func removeTrailingZerosTest() {
        for (tc in removTrailZeroTCArray) {
            let result = tc.d.removeTrailingZeros()
            @Expect(result.toString(), tc.result)
        }
    }

    @TestCase
    func scaleUnitTest() {
        for (tc in scaleUnitTCArray) {
            let result = tc.d.scaleUnit()
            @Expect(result.toString(), tc.result)
        }
    }

    @TestCase
    func isIntegerTest() {
        for (tc in isIntegerTCArray) {
            let result = tc.d.isInteger()
            @Expect(result.toString(), tc.result)
        }
    }
}
