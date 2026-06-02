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
 * Test description: Test the init func for decimal
 * Test class:
 * public struct Decimal <: Comparable<Decimal> & Hashable & ToString
 */
struct InitStruct {
    public let input: Any
    public let expectOutput: String
    public let inputScale: Int32

    InitStruct(input: Any, expectOutput: String, inputScale!: Int32 = 0) {
        this.input = input
        this.expectOutput = expectOutput
        this.inputScale = inputScale
    }
}

func verifyResult(initStruct: InitStruct, isDebug!: Bool = false): Bool {
    let (input, expect) = buildDecimalFrominitStruct(initStruct)
    println(input)
    println(expect)
    if (input == expect) {
        if (isDebug) {
            printStructInfo(initStruct, true)
        }
        return true
    } else {
        printStructInfo(initStruct, false)
        return false
    }
}

func buildDecimalFrominitStruct(initStruct: InitStruct): (String, String) {
    var decimalStr: String
    try {
        let (decimal, _) = getDecimalAndInputStr(initStruct)
        decimalStr = decimal.toString()
    } catch (e: Exception) {
        decimalStr = e.message
    }

    return (decimalStr, initStruct.expectOutput)
}

func getDecimalAndInputStr(initStruct: InitStruct): (Decimal, String) {
    let decimal: Decimal
    let inputStr: String
    if (initStruct.input is BigInt) {
        let inputClarifyType = (initStruct.input as BigInt) ?? throw Exception("transfor BigInt error.")
        decimal = Decimal(inputClarifyType, initStruct.inputScale)
        inputStr = inputClarifyType.toString()
    } else {
        if (initStruct.input is Int8) {
            let inputClarifyType = (initStruct.input as Int8) ?? throw Exception("transfor Int8 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is Int16) {
            let inputClarifyType = (initStruct.input as Int16) ?? throw Exception("transfor Int16 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is Int32) {
            let inputClarifyType = (initStruct.input as Int32) ?? throw Exception("transfor Int32 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is Int64) {
            let inputClarifyType = (initStruct.input as Int64) ?? throw Exception("transfor Int64 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is IntNative) {
            let inputClarifyType = (initStruct.input as IntNative) ?? throw Exception("transfor IntNative error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is UInt8) {
            let inputClarifyType = (initStruct.input as UInt8) ?? throw Exception("transfor UInt8 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is UInt16) {
            let inputClarifyType = (initStruct.input as UInt16) ?? throw Exception("transfor UInt16 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is UInt32) {
            let inputClarifyType = (initStruct.input as UInt32) ?? throw Exception("transfor UInt32 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is UInt64) {
            let inputClarifyType = (initStruct.input as UInt64) ?? throw Exception("transfor UInt64 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is UIntNative) {
            let inputClarifyType = (initStruct.input as UIntNative) ?? throw Exception("transfor UIntNative error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is Float16) {
            let inputClarifyType = (initStruct.input as Float16) ?? throw Exception("transfor Float16 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is Float32) {
            let inputClarifyType = (initStruct.input as Float32) ?? throw Exception("transfor Float32 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is Float64) {
            let inputClarifyType = (initStruct.input as Float64) ?? throw Exception("transfor Float64 error.")
            decimal = Decimal(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else if (initStruct.input is String) {
            let inputClarifyType = (initStruct.input as String) ?? throw Exception("transfor String error.")
            decimal = Decimal.parse(inputClarifyType)
            inputStr = inputClarifyType.toString()
        } else {
            throw Exception("Build unexpect type!")
        }
    }

    return (decimal, inputStr)
}

func printStructInfo(initStruct: InitStruct, verifyResult: Bool): Unit {
    var decimalStr: String
    var inputStr: String
    try {
        let (decimal, input) = getDecimalAndInputStr(initStruct)
        decimalStr = decimal.toString()
        inputStr = input
    } catch (e: Exception) {
        decimalStr = e.message
        inputStr = "can not get value"
    }
    println(
        "result: ${verifyResult}, decimal: ${decimalStr}, expectOutput: ${initStruct.expectOutput}, input: ${inputStr}, inputScale: ${initStruct.inputScale}")
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

let initBigIntArray: Array<InitStruct> = [
    InitStruct(BigInt("0"), "0"),
    InitStruct(BigInt("18711541654861132515321"), "18711541654861132515321"),
    InitStruct(BigInt("-1131151561561148654649846465"), "-1131151561561148654649846465"),
    InitStruct(BigInt("1"), "0.1", inputScale: 1),
    InitStruct(BigInt("123456789"), "1234.56789", inputScale: 5),
    InitStruct(BigInt("-800000000000000000"), "-8000000000000.00000", inputScale: 5),
    InitStruct(BigInt(Int64.Max), "92233720368547758070000", inputScale: -4),
    InitStruct(BigInt(Int64.Max) * BigInt(Int64.Max), "850705917302346158473969077842325012490000", inputScale: -4),
    InitStruct(BigInt("-784637716923335095224261902710254454442933591094742482943"),
        "-7846377169233350952242619027102544544429335910947424829430000000000", inputScale: -10),
    InitStruct(BigInt("-151561515116165156341"), "-1515615151161651563410000000000", inputScale: -10),
    InitStruct(BigInt("486468468161816851886468168168168181312346803518046817151"),
        "486468468161816851886468168.168168181312346803518046817151", inputScale: 30)
]
let initStringArray: Array<InitStruct> = [
    InitStruct("1", "1"),
    InitStruct("0.1", "0.1"),
    InitStruct("1234.56789", "1234.56789"),
    InitStruct("-45801681351.515616810", "-45801681351.515616810"),
    InitStruct("-00000000002561616816.168518616", "-2561616816.168518616"),
    InitStruct("+16518616.561861685", "16518616.561861685"),
    InitStruct("00.000000", "0.000000"),
    InitStruct("-00.000000", "0.000000"),
    InitStruct("-15165E12", "-15165000000000000"),
    InitStruct("+16810631E-20", "0.00000000000016810631"),
    InitStruct("+18616161.51125312e-10", "0.001861616151125312"),
    InitStruct("0E5", "0"),
    InitStruct("0E-5", "0.00000"),
    InitStruct("0.e0", "0"),
    InitStruct(".0e-0", "0.0"),
    InitStruct("156161.1681E0", "156161.1681"),
    InitStruct("24515668.89118", "24515668.89118"),
    InitStruct("115613615631E-10", "11.5613615631"),
    InitStruct("", "String value cannot be empty."),
    InitStruct("fdfdsa", "String value not allow contains other character beyond [digit, '.', e, sign]."),
    InitStruct("+.", "String value not allow without digits."),
    InitStruct("+.123.4154E-", "String value not allow contains more than one dot."),
    InitStruct("+.1234154E-", "String value not allow without digits after e.")
]
let initIntArray: Array<InitStruct> = [
    InitStruct(1i8, "1"),
    InitStruct(Int8.Max, Int8.Max.toString()),
    InitStruct(Int8.Min, Int8.Min.toString()),
    InitStruct(Int8.Max, Int8.Max.toString()),
    InitStruct(Int8.Min, Int8.Min.toString()),
    InitStruct(1i16, "1"),
    InitStruct(Int16.Max, Int16.Max.toString()),
    InitStruct(Int16.Min, Int16.Min.toString()),
    InitStruct(Int16.Max, Int16.Max.toString()),
    InitStruct(Int16.Min, Int16.Min.toString()),
    InitStruct(1i32, "1"),
    InitStruct(Int32.Max, Int32.Max.toString()),
    InitStruct(Int32.Min, Int32.Min.toString()),
    InitStruct(Int32.Max, Int32.Max.toString()),
    InitStruct(Int32.Min, Int32.Min.toString()),
    InitStruct(1i64, "1"),
    InitStruct(Int64.Max, Int64.Max.toString()),
    InitStruct(Int64.Min, Int64.Min.toString()),
    InitStruct(Int64.Max, Int64.Max.toString()),
    InitStruct(Int64.Min, Int64.Min.toString()),
    InitStruct(IntNative(1), "1"),
    InitStruct(IntNative.Max, IntNative.Max.toString()),
    InitStruct(IntNative.Min, IntNative.Min.toString())
]
let initUIntArray: Array<InitStruct> = [
    InitStruct(1u8, "1"),
    InitStruct(UInt8.Max, UInt8.Max.toString()),
    InitStruct(UInt8.Min, UInt8.Min.toString()),
    InitStruct(UInt8.Min, UInt8.Min.toString()),
    InitStruct(1u16, "1"),
    InitStruct(UInt16.Min, UInt16.Min.toString()),
    InitStruct(1u32, "1"),
    InitStruct(UInt32.Min, UInt32.Min.toString()),
    InitStruct(1u64, "1"),
    InitStruct(UInt64.Min, UInt64.Min.toString()),
    InitStruct(UIntNative(1), "1"),
    InitStruct(UIntNative.Max, UIntNative.Max.toString()),
    InitStruct(UIntNative.Min, UIntNative.Min.toString())
]
let initFloatArray: Array<InitStruct> = [
    InitStruct(0.1f16, "0.0999755859375"),
    InitStruct(0.1f32, "0.100000001490116119384765625"),
    InitStruct(0.1f64, "0.1000000000000000055511151231257827021181583404541015625"),
    InitStruct(-12.48606811663f16, "-12.484375"),
    InitStruct(-1515.1468168186163f32, "-1515.1468505859375"),
    InitStruct(-1265168516.15136513f64, "-1265168516.1513650417327880859375"),
    InitStruct(3.0f64, "3"),
    InitStruct(Float64.NaN, "Float value cannot be Inf or NaN."),
    InitStruct(Float64.Inf, "Float value cannot be Inf or NaN."),
    InitStruct(0.25f64, "0.25")
]

@Test
class DecimalInitTest {
    @TestCase
    func bigIntInit(): Unit {
        for (i in initBigIntArray) {
            @Expect(verifyResult(i), true)
        }
    }

    @TestCase
    func stringInit(): Unit {
        for (i in initStringArray) {
            @Expect(verifyResult(i), true)
        }
    }

    @TestCase
    func intValInit(): Unit {
        for (i in initIntArray) {
            @Expect(verifyResult(i), true)
        }
    }

    @TestCase
    func uintValInit(): Unit {
        for (i in initUIntArray) {
            @Expect(verifyResult(i), true)
        }
    }

    @TestCase
    func floatValInit(): Unit {
        for (i in initFloatArray) {
            @Expect(verifyResult(i), true)
        }
    }
}
