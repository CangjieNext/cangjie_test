/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.math.numeric.*
import std.math.*
import std.collection.*

var sum = 0

@Test
class Test_decimal_math_operation_default_22 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_decimal_math_operation_default_01(): Unit {
        let dec1 = Decimal(-100i8)
        let dec2 = Decimal(3200i16)
        @Expect((dec1 + dec2).toString(), "3100")
        @Expect((dec1 - dec2).toString(), "-3300")
        @Expect((dec1 * dec2).toString(), "-320000")
        @Expect((dec1 / dec2).toString(), "-0.03125")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-100")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "-32")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "0")
        @Expect(dec2.divAndMod(Decimal(-101i8))[0].toString(), "-31")
        @Expect(dec2.divAndMod(Decimal(-101i8))[1].toString(), "69")
        @Expect((-dec2).toString(), "-3200")
        @Expect((dec1 ** 5).toString(), "-10000000000")
        @Expect((dec1 ** 5).toSciString(), "-1.0000000000E10")
        @Expect((dec1 ** 5).toEngString(), "-10.000000000E9")
        @Expect((dec1 ** -1).toString(), "-0.01")
        @Expect((dec1 ** -1).toSciString(), "-1E-2")
        @Expect((dec1 ** -1).toEngString(), "-10E-3")
        @Expect(dec1.shiftPoint(5).toString(), "-0.00100")
        @Expect(round(dec1, roundingMode: Floor).toString(), "-100")
        @Expect(abs(dec1).toString(), "100")
        @Expect(sqrt(dec2).toString(), "56.56854249492380195206754896838792")
        try {
            sqrt(dec1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Negative decimal cannot be squared.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_decimal_math_operation_default_02(): Unit {
        let dec1 = Decimal(-29000i16)
        let dec2 = Decimal(421232435u32)
        @Expect((dec1 + dec2).toString(), "421203435")
        @Expect((dec1 - dec2).toString(), "-421261435")
        @Expect((dec1 * dec2).toString(), "-12215740615000")
        @Expect((dec1 / dec2).toString(), "-0.00006884560064801277707876412698371625")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-29000")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "-14525")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "7435")
        @Expect((-dec2).toString(), "-421232435")
        @Expect((dec1 ** -5).toString(), "-0.00000000000000000000004875397277841431506348084156572604")
        @Expect((dec1 ** -5).toSciString(), "-4.875397277841431506348084156572604E-23")
        @Expect((dec1 ** -5).toEngString(), "-48.75397277841431506348084156572604E-24")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 0).toSciString(), "1E0")
        @Expect((dec1 ** 0).toEngString(), "1E0")
        @Expect(dec2.shiftPoint(-5).toString(), "42123243500000")
        @Expect(dec2.roundWithPrecision(1, roundingMode:Floor).toString(), "400000000")
        @Expect(abs(dec2).toString(), "421232435")
        @Expect(sqrt(dec2).toString(), "20523.94784148507818459244687852529")
    }

    @TestCase
    func test_decimal_math_operation_default_03(): Unit {
        let dec1 = Decimal(0i32)
        let dec2 = Decimal(0u64)
        @Expect((dec1 + dec2).toString(), "0")
        @Expect((dec1 - dec2).toString(), "0")
        @Expect((dec1 * dec2).toString(), "0")
        @Expect((dec1 * dec2).toString(), "0")
        try {
            let a = dec1 / dec2
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 1)

        try {
            let a = dec1 / dec2
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 2)

        try {
            let a = dec1.divAndMod(dec2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 3)

        try {
            let a = dec2.divAndMod(dec1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 4)
        @Expect((-dec2).toString(), "0")
        @Expect((dec1 ** 10).toString(), "0")
        @Expect((dec1 ** Int64.Max).toString(), "0")
        try {
            (dec1 ** Int64.Min)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 5)
        @Expect((dec1 ** 0).toSciString(), "1E0")
        try {
            (dec1 ** -10)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 6)
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 0).toSciString(), "1E0")
        @Expect((dec1 ** 0).toEngString(), "1E0")
        @Expect(dec2.shiftPoint(-5).toString(), "0")
        @Expect(dec2.roundWithPrecision(1, roundingMode: Ceiling).toString(), "0")
        @Expect(abs(dec2).toString(), "0")
    }

    @TestCase
    func test_decimal_math_operation_default_04(): Unit {
        let dec1 = Decimal(-10372847387i64)
        let dec2 = Decimal(65500.0914739353f16)
        @Expect((dec1 + dec2).toString(), "-10372781883")
        @Expect((dec1 - dec2).toString(), "-10372912891")
        @Expect((dec1 * dec2).toString(), "-679462995238048")
        @Expect((dec1 * dec2).toString(), "-679462995238048")
        @Expect((dec1 / dec2).toString(), "-158354.4117458475818270639960918417")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "-158354")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-26971")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "0")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "65504")
        @Expect((-dec2).divAndMod((-dec1))[0].toString(), "0")
        @Expect((-dec2).divAndMod((-dec1))[1].toString(), "-65504")
        @Expect((-dec2).toString(), "-65504")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 5).toSciString(), "-1.20085326000591086313375462397277218555508915385707E50")
        @Expect((dec1 ** -5).toEngString(), "-8.327412126899482961523149517655354E-51")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 5).toSciString(), "-1.20085326000591086313375462397277218555508915385707E50")
        @Expect((dec1 ** (-5)).toEngString(), "-8.327412126899482961523149517655354E-51")
        @Expect(dec2.shiftPoint(0).toString(), "65504")
        @Expect(dec2.roundWithPrecision(2, roundingMode: Up).toString(), "66000")
        @Expect(abs(dec2).toString(), "65504")
    }

    @TestCase
    func test_decimal_math_operation_default_05(): Unit {
        let dec1 = Decimal(IntNative(-139823877842))
        let dec2 = Decimal(10.09438832929887328f32)
        @Expect((dec1 + dec2).toString(), "-139823877831.90561199188232421875")
        @Expect((dec1 - dec2).toString(), "-139823877852.09438800811767578125")
        @Expect((dec1 * dec2).toString(), "-1411436475736.79560279846191406250")
        @Expect((dec1 * dec2).toString(), "-1411436475736.79560279846191406250")
        @Expect((dec1 / dec2).toString(), "-13851644867.38144382102033183076040")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "-13851644867")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-3.85044193267822265625")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "0")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "10.09438800811767578125")
        @Expect((-dec2).toString(), "-10.09438800811767578125")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** -10).toSciString(), "3.500955368146363745884626637016213E-112")
        @Expect((dec1 ** 9).toEngString(), "-20.428293233501156440550290006866927028011599922742119329003309328440807368576524385319903231689052672E99")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 **(-10)).toSciString(), "3.500955368146363745884626637016213E-112")
        @Expect((dec1 ** 9).toEngString(), "-20.428293233501156440550290006866927028011599922742119329003309328440807368576524385319903231689052672E99")
        @Expect(dec2.shiftPoint(5).toString(), "0.0001009438800811767578125")
        @Expect(dec2.roundWithPrecision(5, roundingMode: Down).toString(), "10.094")
        @Expect(abs(dec2).toString(), "10.09438800811767578125")
    }

    @TestCase
    func test_decimal_math_operation_default_06(): Unit {
        let dec1 = Decimal(1u8)
        let dec2 = Decimal(-1.00832943294f64)
        @Expect((dec1 + dec2).toString(), "-0.0083294329400001032581712934188544750213623046875")
        @Expect((dec1 - dec2).toString(), "2.0083294329400001032581712934188544750213623046875")
        @Expect((dec1 * dec2).toString(), "-1.0083294329400001032581712934188544750213623046875")
        @Expect((dec1 * dec2).toString(), "-1.0083294329400001032581712934188544750213623046875")
        @Expect((dec1 / dec2).toString(), "-0.9917393733953457451028573200656328")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "1")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "-1")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "-0.0083294329400001032581712934188544750213623046875")
        @Expect((-dec2).toString(), "1.0083294329400001032581712934188544750213623046875")

        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** Int64.Min).toSciString(), "1E0")
        @Expect((dec1 ** Int64.Max).toEngString(), "1E0")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 **(Int64.Max)).toSciString(), "1E0")
        @Expect((dec1 ** Int64.Min).toEngString(), "1E0")
        @Expect(dec2.shiftPoint(-5).toString(), "-100832.94329400001032581712934188544750213623046875")
        @Expect(dec2.roundWithPrecision(5, roundingMode: HalfUp).toString(), "-1.0083")
        @Expect(abs(dec2).toString(), "1.0083294329400001032581712934188544750213623046875")
    }

    @TestCase
    func test_decimal_math_operation_default_07(): Unit {
        let dec1 = Decimal(UInt16.Max)
        let dec2 = Decimal(Int64.Max)
        @Expect((dec1 + dec2).toString(), "9223372036854841342")
        @Expect((dec1 - dec2).toString(), "-9223372036854710272")
        @Expect((dec1 * dec2).toString(), "604453686435277732511745")
        @Expect((dec1 * dec2).toString(), "604453686435277732511745")
        @Expect((dec1 / dec2).toString(), "0.000000000000007105318937383753309038202153312549")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "65535")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "140739635871744")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "32767")
        @Expect((-dec2).toString(), "-9223372036854775807")

        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** -1).toSciString(), "1.525902189669642175936522468909743E-5")
        @Expect((dec1 ** 1).toEngString(), "65.535E3")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 **(-1)).toSciString(), "1.525902189669642175936522468909743E-5")
        @Expect((dec1 ** 1).toEngString(), "65.535E3")
        @Expect(dec2.shiftPoint(-5).toString(), "922337203685477580700000")
        @Expect(dec2.roundWithPrecision(11).toString(), "9223372036900000000")
        @Expect(abs(dec2).toString(), "9223372036854775807")
    }

    @TestCase
    func test_decimal_math_operation_default_08(): Unit {
        let dec1 = Decimal(UInt32.Min)
        let dec2 = Decimal(0.193298f32)
        @Expect((dec1 + dec2).toString(), "0.19329799711704254150390625")
        @Expect((dec1 - dec2).toString(), "-0.19329799711704254150390625")
        @Expect((dec1 * dec2).toString(), "0.00000000000000000000000000")
        @Expect((dec1 * dec2).toString(), "0.00000000000000000000000000")
        @Expect((dec1 / dec2).toString(), "0")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toSciString(), "0E0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "0")
        try {
            let a = dec2.divAndMod(dec1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 1)
        @Expect((-dec2).toString(), "-0.19329799711704254150390625")

        @Expect((dec1 ** 0).toString(), "1")
        try {
            (dec1 ** -1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 2)
        @Expect((dec1 ** 1).toEngString(), "0E0")
        @Expect((dec1 ** 0).toString(), "1")
        try {
            dec1 ** (-1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 3)
        @Expect((dec1 ** 1).toEngString(), "0E0")
        @Expect(dec2.shiftPoint(0).toString(), "0.19329799711704254150390625")
        @Expect(dec2.roundWithPrecision(12, roundingMode: Floor).toString(), "0.193297997117")
        @Expect(abs(dec2).toString(), "0.19329799711704254150390625")
        @Expect(sqrt(dec1).toString(), "0")
    }

    @TestCase
    func test_decimal_math_operation_default_09(): Unit {
        let dec1 = Decimal(UInt64.Max)
        let dec2 = Decimal(UInt16.Min)
        @Expect((dec1 + dec2).toString(), "18446744073709551615")
        @Expect((dec1 - dec2).toString(), "18446744073709551615")
        @Expect((dec1 * dec2).toString(), "0")
        @Expect((dec1 * dec2).toString(), "0")
        try {
            dec1 / dec2
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 1)

        try {
            dec1 / dec2
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 2)

        try {
            dec1.divAndMod(dec2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 3)

        @Expect(dec2.divAndMod(dec1)[0].toString(), "0")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "0")
        @Expect((-dec2).toString(), "0")
    }

    @TestCase
    func test_decimal_math_operation_default_10(): Unit {
        let dec1 = Decimal(UIntNative(0))
        let dec2 = Decimal(-111i8)
        @Expect((dec1 + dec2).toString(), "-111")
        @Expect((dec1 - dec2).toString(), "111")
        @Expect((dec1 * dec2).toString(), "0")
        @Expect((dec1 * dec2).toString(), "0")
        @Expect((dec1 / dec2).toString(), "0")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "0")
        try {
            dec2.divAndMod(dec1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 1)

        @Expect((dec1 ** 0).toString(), "1")
        try {
            (dec1 ** -1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 2)
        @Expect((dec1 ** 1).toEngString(), "0E0")
        @Expect((dec1 ** 0).toString(), "1")
        try {
            dec1 ** (-1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 3)
        @Expect((dec1 ** 1).toEngString(), "0E0")
        @Expect(dec2.shiftPoint(5).toString(), "-0.00111")
        @Expect(dec2.roundWithPrecision(2).toString(), "-110")
        @Expect(abs(dec2).toString(), "111")
    }

    @TestCase
    func test_decimal_math_operation_default_11(): Unit {
        let dec1 = Decimal(BigInt("-11111"), 5)
        let dec2 = Decimal(0i8)
        @Expect((dec1 + dec2).toString(), "-0.11111")
        @Expect((dec1 - dec2).toString(), "-0.11111")
        @Expect((dec1 * dec2).toString(), "0.00000")
        @Expect((dec1 * dec2).toString(), "0.00000")
        try {
            dec1 / dec2
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 1)

        try {
            dec1 / dec2
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 2)

        try {
            dec1.divAndMod(dec2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 3)

        @Expect(dec2.divAndMod(dec1)[0].toString(), "0")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "0")
        @Expect((-dec2).toString(), "0")

        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 20).toSciString(), "8.22361844357259214718871547200063585555616158316434383354626854764091644538511201E-20")
        @Expect((dec1 ** -20).toEngString(), "12.16009724747843870837560598531429E18")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 **(-20)).toSciString(), "1.216009724747843870837560598531429E19")
        @Expect((dec1 ** 20).toEngString(), "82.2361844357259214718871547200063585555616158316434383354626854764091644538511201E-21")
        @Expect(dec2.shiftPoint(-5).toString(), "0")
        @Expect(dec2.roundWithPrecision(11).toString(), "0")
        @Expect(abs(dec2).toString(), "0")
        @Expect(sqrt(dec2).toString(), "0")
    }

    @TestCase
    func test_decimal_math_operation_default_12(): Unit {
        let dec1 = Decimal(BigInt("12832"), -1)
        let dec2 = Decimal(18343u16)
        @Expect((dec1 + dec2).toString(), "146663")
        @Expect((dec1 - dec2).toString(), "109977")
        @Expect((dec1 * dec2).toString(), "2353773760")
        @Expect((dec1 * dec2).toString(), "2353773760")
        @Expect((dec1 / dec2).toString(), "6.995584146540914790383252466881099")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "6")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "18262")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "0")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "18343")
        @Expect((-dec2).toString(), "-18343")

        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 30).toSciString(), "1.773497285996783321619187902622124587712977521078797514293022235420090672006741878156645443456082527914622630738666532634624E153")
        @Expect((dec1 ** -30).toEngString(), "563.8576432542754670394864579741861E-156")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 30).toSciString(), "1.773497285996783321619187902622124587712977521078797514293022235420090672006741878156645443456082527914622630738666532634624E153")
        @Expect((dec1 ** (-30)).toEngString(), "563.8576432542754670394864579741861E-156")
        @Expect(dec2.shiftPoint(-5).toString(), "1834300000")
        @Expect(dec2.roundWithPrecision(1).toString(), "20000")
        @Expect(abs(dec2).toString(), "18343")
        @Expect(sqrt(dec2).toString(), "135.4363319054381360204662581998904")
    }

    @TestCase
    func test_decimal_math_operation_default_13(): Unit {
        let dec1 = Decimal(BigInt("-13824376"), 0)
        let dec2 = Decimal(-120.834783f32)
        @Expect((dec1 + dec2).toString(), "-13824496.83478546142578125")
        @Expect((dec1 - dec2).toString(), "-13824255.16521453857421875")
        @Expect((dec1 * dec2).toString(), "1670465508.09808349609375000")
        @Expect((dec1 * dec2).toString(), "1670465508.09808349609375000")
        @Expect((dec1 / dec2).toString(), "114407.2540635508509661254533936833")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "114407")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "-30.69971466064453125")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "0")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "-120.83478546142578125")
        @Expect((-dec2).toString(), "120.83478546142578125")
    }

    @TestCase
    func test_decimal_math_operation_default_14(): Unit {
        let dec1 = Decimal.parse("0")
        let dec2 = Decimal(-1234i16)
        @Expect((dec1 + dec2).toString(), "-1234")
        @Expect((dec1 - dec2).toString(), "1234")
        @Expect((dec1 * dec2).toString(), "0")
        @Expect((dec1 * dec2).toString(), "0")
        @Expect((dec1 / dec2).toString(), "0")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "0")
        try {
            dec2.divAndMod(dec1)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 1)

        @Expect((-dec2).toString(), "1234")

        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 10000).toSciString(), "0E0")
        try {
            (dec1 ** -10000)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 2)
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 30000).toSciString(), "0E0")
        try {
            (dec1 ** -30000)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
            sum += 1
        }
        @Expect(sum, 3)
        @Expect(dec2.shiftPoint(5).toString(), "-0.01234")
        @Expect(dec2.roundWithPrecision(2, roundingMode: Down).toString(), "-1200")
        @Expect(abs(dec2).toString(), "1234")
    }

    @TestCase
    func test_decimal_math_operation_default_15(): Unit {
        let dec1 = Decimal.parse("300e-2")
        let dec2 = Decimal(UInt32.Max)
        @Expect((dec1 + dec2).toString(), "4294967298.00")
        @Expect((dec1 - dec2).toString(), "-4294967292.00")
        @Expect((dec1 * dec2).toString(), "12884901885.00")
        @Expect((dec1 * dec2).toString(), "12884901885.00")
        @Expect((dec1 / dec2).toString(), "0.0000000006984919311242392126294409885605427")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "3.00")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "1431655765")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "0.00")
        @Expect((-dec2).toString(), "-4294967295")

        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 2).toSciString(), "9.0000E0")
        @Expect((dec1 ** -2).toEngString(), "111.1111111111111111111111111111111E-3")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 40).toSciString(), "1.215766545905692880100000000000000000000000000000000000000000000000000000000000000000000000000000000E19")
        @Expect((dec1 ** (-40)).toEngString(), "82.25263339969959081282058400607250E-21")
        @Expect(dec2.shiftPoint(10).toString(), "0.4294967295")
        @Expect(dec2.roundWithPrecision(1).toString(), "4000000000")
        @Expect(abs(dec2).toString(), "4294967295")
    }

    @TestCase
    func test_decimal_math_operation_default_16(): Unit {
        let dec1 = Decimal.parse("300e-2")
        let dec2 = Decimal(874.8747734f64)
        @Expect((dec1 + dec2).toString(), "877.8747733999999809384462423622608184814453125")
        @Expect((dec1 - dec2).toString(), "-871.8747733999999809384462423622608184814453125")
        @Expect((dec1 * dec2).toString(), "2624.624320199999942815338727086782455444335937500")
        @Expect((dec1 * dec2).toString(), "2624.624320199999942815338727086782455444335937500")
        @Expect((dec1 / dec2).toString(), "0.003429062182626650262680043041255318")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "3.00")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "291")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "1.8747733999999809384462423622608184814453125")
        @Expect((-dec2).toString(), "-874.8747733999999809384462423622608184814453125")
    }

    @TestCase
    func test_decimal_math_operation_default_17(): Unit {
        let dec1 = Decimal(0.1733332f16)
        let dec2 = Decimal(100.98329847387f32)
        @Expect((dec1 + dec2).toString(), "101.15663909912109375")
        @Expect((dec1 - dec2).toString(), "-100.80995941162109375")
        @Expect((dec1 * dec2).toString(), "17.5044293142855167388916015625")
        @Expect((dec1 * dec2).toString(), "17.5044293142855167388916015625")
        @Expect((dec1 / dec2).toString(), "0.001716519910006608450551420688431766")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "0.17333984375")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "582")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "0.09951019287109375")
        @Expect((-dec2).toString(), "-100.98329925537109375")
    }

    @TestCase
    func test_decimal_math_operation_default_18(): Unit {
        let dec1 = Decimal(0.1733332f16)
        let dec2 = Decimal(100.98329847387f64)
        @Expect((dec1 + dec2).toString(), "101.1566383176199934723626938648521900177001953125")
        @Expect((dec1 - dec2).toString(), "-100.8099586301199934723626938648521900177001953125")
        @Expect((dec1 * dec2).toString(), "17.504429178820238126312869297862562234513461589813232421875")
        @Expect((dec1 * dec2).toString(), "17.504429178820238126312869297862562234513461589813232421875")
        @Expect((dec1 / dec2).toString(), "0.001716519923290609058491024658838930")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "0.17333984375")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "582")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "0.0995094113699934723626938648521900177001953125")
        @Expect((-dec2).toString(), "-100.9832984738699934723626938648521900177001953125")

        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 12).toSciString(), "7.35835623184557571223316438425708916844392509654829164338214981721871910152460286892728280605524560087360441684722900390625E-10")
        @Expect((dec1 ** -12).toEngString(), "1.358999168417789979953587968650257E9")
        @Expect((dec1 ** 0).toString(), "1")
        @Expect((dec1 ** 12).toSciString(), "7.35835623184557571223316438425708916844392509654829164338214981721871910152460286892728280605524560087360441684722900390625E-10")
        @Expect((dec1 ** (-12)).toEngString(), "1.358999168417789979953587968650257E9")
        @Expect(dec2.shiftPoint(0).toString(), "100.9832984738699934723626938648521900177001953125")
        @Expect(dec2.roundWithPrecision(1).toString(), "100")
        @Expect(abs(dec2).toString(), "100.9832984738699934723626938648521900177001953125")
    }

    @TestCase
    func test_decimal_math_operation_default_19(): Unit {
        let dec1 = Decimal(2i8)
        let dec2 = Decimal(8i16)
        @Expect((dec1 + dec2).toString(), "10")
        @Expect((dec1 - dec2).toString(), "-6")
        @Expect((dec1 * dec2).toString(), "16")
        @Expect((dec1 * dec2).toString(), "16")
        @Expect((dec1 / dec2).toString(), "0.25")
        @Expect(dec1.divAndMod(dec2)[0].toString(), "0")
        @Expect(dec1.divAndMod(dec2)[1].toString(), "2")
        @Expect(dec2.divAndMod(dec1)[0].toString(), "4")
        @Expect(dec2.divAndMod(dec1)[1].toString(), "0")
        @Expect((-dec2).toString(), "-8")
    }
}
