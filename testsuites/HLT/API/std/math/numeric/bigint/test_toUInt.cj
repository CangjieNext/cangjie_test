/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*
import std.collection.*

@Test
class BigIntToUIntTest {
    @TestCase
    func toUInt8_case(): Unit {
        var convert_result: UInt8 = 0
        let expthr_map = HashMap<String, UInt8>([("0", 0), ("-0", 0), ("127", 127), ("128", 128), ("255", 255)])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert_result = param_a.toUInt8(overflowHandling: Throwing)
            @Expect(convert_result, v)
        }

        try {
            var param_a = BigInt(-129)
            convert_result = param_a.toUInt8(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
        }
        try {
            var param_a = BigInt(-128)
            convert_result = param_a.toUInt8(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
        }
        try {
            var param_a = BigInt(256)
            convert_result = param_a.toUInt8(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
        }

        let expwra_map = HashMap<String, UInt8>(
            [("0", 0), ("-0", 0), ("127", 127), ("128", 128), ("255", 255), ("-128", 128), ("-129", 127), ("256", 0)])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert_result = param_a.toUInt8(overflowHandling: Wrapping)
            @Expect(convert_result, v)
        }

        let expsta_map = HashMap<String, UInt8>(
            [("0", 0), ("-0", 0), ("127", 127), ("128", 128), ("255", 255), ("-128", 0), ("-129", 0), ("256", 255)])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert_result = param_a.toUInt8(overflowHandling: Saturating)
            @Expect(convert_result, v)
        }
    }

    @TestCase
    func toUInt16_case(): Unit {
        var convert_result: UInt16 = 0
        let expthr_map = HashMap<String, String>([("0", "0"), ("ffff", "65535"), ("7FFF", "32767")])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt16(overflowHandling: Throwing)
            @Expect(convert_result.toString(), v)
        }

        try {
            var param_a = BigInt.parse("10000", radix: 16)
            convert_result = param_a.toUInt16(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt16.")
        }
        try {
            var param_a = BigInt.parse("-8001", radix: 16)
            convert_result = param_a.toUInt16(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt16.")
        }

        let expwra_map = HashMap<String, String>(
            [("0", "0"), ("ffff", "65535"), ("7fff", "32767"), ("-8001", "32767"), ("10000", "0")])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt16(overflowHandling: Wrapping)
            @Expect(convert_result.toString(), v)
        }

        let expsta_map = HashMap<String, String>(
            [("0", "0"), ("ffff", "65535"), ("7fff", "32767"), ("-8001", "0"), ("10000", "65535")])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt16(overflowHandling: Saturating)
            @Expect(convert_result.toString(), v)
        }
    }

    @TestCase
    func toUInt32_case(): Unit {
        var convert_result: UInt32 = 0
        let expthr_map = HashMap<String, String>([("0", "0"), ("ffffffff", "4294967295")])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt32(overflowHandling: Throwing)
            @Expect(convert_result.toString(), v)
        }

        try {
            var param_a = BigInt.parse("-100000001", radix: 16)
            convert_result = param_a.toUInt32(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt32.")
        }
        try {
            var param_a = BigInt.parse("100000000", radix: 16)
            convert_result = param_a.toUInt32(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt32.")
        }

        let expwra_map = HashMap<String, String>(
            [("0", "0"), ("ffffffff", "4294967295"), ("100000000", "0"), ("100000001", "1"), ("-100000001", "4294967295")])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt32(overflowHandling: Wrapping)
            @Expect(convert_result.toString(), v)
        }

        let expsta_map = HashMap<String, String>(
            [("0", "0"), ("ffffffff", "4294967295"), ("100000000", "4294967295"), ("100000001", "4294967295"),
                ("-100000001", "0")])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt32(overflowHandling: Saturating)
            @Expect(convert_result.toString(), v)
        }
    }

    @TestCase
    func toUInt64_case(): Unit {
        var convert_result: UInt64 = 0
        let expthr_map = HashMap<String, String>([("0", "0"), ("ffffffffffffffff", "18446744073709551615")])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt64(overflowHandling: Throwing)
            @Expect(convert_result.toString(), v)
        }

        try {
            var param_a = BigInt.parse("10000000000000000", radix: 16)
            convert_result = param_a.toUInt64(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
        }
        try {
            var param_a = BigInt.parse("-1", radix: 16)
            convert_result = param_a.toUInt64(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
        }

        let expwra_map = HashMap<String, String>(
            [("0", "0"), ("ffffffffffffffff", "18446744073709551615"), ("10000000000000000", "0"),
                ("-10000000000000001", "18446744073709551615")])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt64(overflowHandling: Wrapping)
            @Expect(convert_result.toString(), v)
        }

        let expsta_map = HashMap<String, String>(
            [("0", "0"), ("ffffffffffffffff", "18446744073709551615"), ("10000000000000000", "18446744073709551615"),
                ("-10000000000000001", "0")])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toUInt64(overflowHandling: Saturating)
            @Expect(convert_result.toString(), v)
        }
    }

    @TestCase
    func lowtohigh_warp_case(): Unit {
        var convert16_result: UInt16 = 0
        let to16_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "65535"), ("1", "1"), ("-128", "65408"), ("256", "256")])
        for ((k, v) in to16_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert16_result = param_a.toUInt16(overflowHandling: Wrapping)
            @Expect(convert16_result.toString(), v)
        }

        var convert32_result: UInt32 = 0
        let to32_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "4294967295"), ("1", "1"), ("-128", "4294967168"), ("256", "256")])
        for ((k, v) in to32_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert32_result = param_a.toUInt32(overflowHandling: Wrapping)
            @Expect(convert32_result.toString(), v)
        }

        var convert64_result: UInt64 = 0
        let to64_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "18446744073709551615"), ("1", "1"), ("-128", "18446744073709551488"),
                ("256", "256")])
        for ((k, v) in to64_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert64_result = param_a.toUInt64(overflowHandling: Wrapping)
            @Expect(convert64_result.toString(), v)
        }
    }

    @TestCase
    func lowtohigh_throw_case(): Unit {
        var convert16_result: UInt16 = 0
        let to16_map = HashMap<String, String>([("0", "0"), ("-0", "0"), ("1", "1"), ("256", "256")])
        for ((k, v) in to16_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert16_result = param_a.toUInt16(overflowHandling: Throwing)
            @Expect(convert16_result.toString(), v)
        }

        var convert32_result: UInt32 = 0
        let to32_map = HashMap<String, String>([("0", "0"), ("-0", "0"), ("1", "1"), ("256", "256")])
        for ((k, v) in to32_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert32_result = param_a.toUInt32(overflowHandling: Throwing)
            @Expect(convert32_result.toString(), v)
        }

        var convert64_result: UInt64 = 0
        let to64_map = HashMap<String, String>([("0", "0"), ("-0", "0"), ("1", "1"), ("256", "256")])
        for ((k, v) in to64_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert64_result = param_a.toUInt64(overflowHandling: Throwing)
            @Expect(convert64_result.toString(), v)
        }

        var param_a = BigInt("-1")
        try {
            param_a.toUInt16(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt16." )
        }

        try {
            param_a.toUInt32(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt32." )
        }

        try {
            param_a.toUInt64(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64." )
        }
    }

    @TestCase
    func lowtohigh_satur_case(): Unit {
        var convert16_result: UInt16 = 0
        let to16_map = HashMap<String, String>([("0", "0"), ("-0", "0"), ("-1", "0"), ("1", "1"), ("-128", "0"),
            ("256", "256")])
        for ((k, v) in to16_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert16_result = param_a.toUInt16(overflowHandling: Saturating)
            @Expect(convert16_result.toString(), v)
        }

        var convert32_result: UInt32 = 0
        let to32_map = HashMap<String, String>([("0", "0"), ("-0", "0"), ("-1", "0"), ("1", "1"), ("-128", "0"),
            ("256", "256")])
        for ((k, v) in to32_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert32_result = param_a.toUInt32(overflowHandling: Saturating)
            @Expect(convert32_result.toString(), v)
        }

        var convert64_result: UInt64 = 0
        let to64_map = HashMap<String, String>([("0", "0"), ("-0", "0"), ("-1", "0"), ("1", "1"), ("-128", "0"),
            ("256", "256")])
        for ((k, v) in to64_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert64_result = param_a.toUInt64(overflowHandling: Saturating)
            @Expect(convert64_result.toString(), v)
        }
    }
}
