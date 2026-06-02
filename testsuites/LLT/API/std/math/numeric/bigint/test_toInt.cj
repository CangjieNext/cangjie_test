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

struct TI {
    TI(let origin: BigInt, let handle: OverflowStrategy, let result: String) {}
}

let tc4Int8: Array<TI> = [
    TI(BigInt("127"), Throwing, "127"),
    TI(BigInt("-128"), Throwing, "-128"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("721"), Throwing, "Out of range of the Int8."),
    TI(BigInt("721"), Wrapping, "-47"),
    TI(BigInt("721"), Saturating, "127"),
    TI(BigInt("-821"), Throwing, "Out of range of the Int8."),
    TI(BigInt("-821"), Wrapping, "-53"),
    TI(BigInt("-821"), Saturating, "-128"),
    TI(BigInt("18446744073709551777"), Wrapping, "-95"),
    TI(BigInt("-18446744073709551888"), Wrapping, "-16")
]
let tc4Int16: Array<TI> = [
    TI(BigInt("32767"), Throwing, "32767"),
    TI(BigInt("-32768"), Throwing, "-32768"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("2857194873"), Throwing, "Out of range of the Int16."),
    TI(BigInt("2857194873"), Wrapping, "21881"),
    TI(BigInt("2857194873"), Saturating, "32767"),
    TI(BigInt("-834316463"), Throwing, "Out of range of the Int16."),
    TI(BigInt("-834316463"), Wrapping, "22353"),
    TI(BigInt("-834316463"), Saturating, "-32768"),
    TI(BigInt("18446744073709551777"), Wrapping, "161"),
    TI(BigInt("-18446744073709551888"), Wrapping, "-272")
]
let tc4Int32: Array<TI> = [
    TI(BigInt("2147483647"), Throwing, "2147483647"),
    TI(BigInt("-2147483648"), Throwing, "-2147483648"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("2857194873"), Throwing, "Out of range of the Int32."),
    TI(BigInt("2857194873"), Wrapping, "-1437772423"),
    TI(BigInt("2857194873"), Saturating, "2147483647"),
    TI(BigInt("-8343164635"), Throwing, "Out of range of the Int32."),
    TI(BigInt("-8343164635"), Wrapping, "246769957"),
    TI(BigInt("-8343164635"), Saturating, "-2147483648"),
    TI(BigInt("18446744073709551777"), Wrapping, "161"),
    TI(BigInt("-18446744073709551888"), Wrapping, "-272")
]
let tc4Int64: Array<TI> = [
    TI(BigInt("-2147483648"), Throwing, "-2147483648"),
    TI(BigInt("9223372036854775807"), Throwing, "9223372036854775807"),
    TI(BigInt("-9223372036854775808"), Throwing, "-9223372036854775808"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("13835058055282163710"), Throwing, "Out of range of the Int64."),
    TI(BigInt("13835058055282163710"), Wrapping, "-4611686018427387906"),
    TI(BigInt("13835058055282163710"), Saturating, "9223372036854775807"),
    TI(BigInt("-10145709240540253387"), Throwing, "Out of range of the Int64."),
    TI(BigInt("-10145709240540253387"), Wrapping, "8301034833169298229"),
    TI(BigInt("-10145709240540253387"), Saturating, "-9223372036854775808"),
    TI(BigInt("184467440737095517777"), Wrapping, "1617"),
    TI(BigInt("-184467440737095518888"), Wrapping, "-2728")
]
let tc4UInt8: Array<TI> = [
    TI(BigInt("255"), Throwing, "255"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("721"), Throwing, "Out of range of the UInt8."),
    TI(BigInt("721"), Wrapping, "209"),
    TI(BigInt("721"), Saturating, "255"),
    TI(BigInt("-821"), Throwing, "Out of range of the UInt8."),
    TI(BigInt("-821"), Wrapping, "203"),
    TI(BigInt("-821"), Saturating, "0"),
    TI(BigInt("18446744073709551777"), Wrapping, "161"),
    TI(BigInt("-18446744073709551888"), Wrapping, "240")
]
let tc4UInt16: Array<TI> = [
    TI(BigInt("65535"), Throwing, "65535"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("2857194873"), Throwing, "Out of range of the UInt16."),
    TI(BigInt("2857194873"), Wrapping, "21881"),
    TI(BigInt("2857194873"), Saturating, "65535"),
    TI(BigInt("-834316463"), Throwing, "Out of range of the UInt16."),
    TI(BigInt("-834316463"), Wrapping, "22353"),
    TI(BigInt("-834316463"), Saturating, "0"),
    TI(BigInt("18446744073709551777"), Wrapping, "161"),
    TI(BigInt("-18446744073709551888"), Wrapping, "65264")
]
let tc4UInt32: Array<TI> = [
    TI(BigInt("4294967295"), Throwing, "4294967295"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("28571948739"), Throwing, "Out of range of the UInt32."),
    TI(BigInt("28571948739"), Wrapping, "2802144963"),
    TI(BigInt("28571948739"), Saturating, "4294967295"),
    TI(BigInt("-8343164636"), Throwing, "Out of range of the UInt32."),
    TI(BigInt("-8343164636"), Wrapping, "246769956"),
    TI(BigInt("-8343164636"), Saturating, "0"),
    TI(BigInt("18446744073709551777"), Wrapping, "161"),
    TI(BigInt("-18446744073709551888"), Wrapping, "4294967024")
]
let tc4UInt64: Array<TI> = [
    TI(BigInt("18446744073709551615"), Throwing, "18446744073709551615"),
    TI(BigInt("0"), Throwing, "0"),
    TI(BigInt("61427657765452806877"), Throwing, "Out of range of the UInt64."),
    TI(BigInt("61427657765452806877"), Wrapping, "6087425544324152029"),
    TI(BigInt("61427657765452806877"), Saturating, "18446744073709551615"),
    TI(BigInt("-22689495210662748486"), Throwing, "Out of range of the UInt64."),
    TI(BigInt("-22689495210662748486"), Wrapping, "14203992936756354746"),
    TI(BigInt("-22689495210662748486"), Saturating, "0")
]

@Test
class BigToIntTest {
    @TestCase
    func toInt8Test() {
        for (tc in tc4Int8) {
            try {
                let actual = tc.origin.toInt8(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func toInt16Test() {
        for (tc in tc4Int16) {
            try {
                let actual = tc.origin.toInt16(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func toInt32Test() {
        for (tc in tc4Int32) {
            try {
                let actual = tc.origin.toInt32(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func toInt64Test() {
        for (tc in tc4Int64) {
            try {
                let actual = tc.origin.toInt64(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func toUInt8Test() {
        for (tc in tc4UInt8) {
            try {
                let actual = tc.origin.toUInt8(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func toUInt16Test() {
        for (tc in tc4UInt16) {
            try {
                let actual = tc.origin.toUInt16(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func toUInt32Test() {
        for (tc in tc4UInt32) {
            try {
                let actual = tc.origin.toUInt32(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }

    @TestCase
    func toUInt64Test() {
        for (tc in tc4UInt64) {
            try {
                let actual = tc.origin.toUInt64(overflowHandling: tc.handle).toString()
                @Expect(actual, tc.result)
            } catch (e: OverflowException) {
                @Expect(e.message, tc.result)
            }
        }
    }
}
