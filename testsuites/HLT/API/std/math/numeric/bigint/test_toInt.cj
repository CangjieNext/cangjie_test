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
class BigIntTypeConvertTest {
    @TestCase
    func toInt8_case(): Unit {
        var convert_result: Int8 = 0
        let expthr_map = HashMap<String, Int8>([("0", 0), ("127", 127), ("-128", -128)])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert_result = param_a.toInt8(overflowHandling: Throwing)
            @Expect(convert_result, v)
        }

        try {
            var param_a = BigInt(-129)
            convert_result = param_a.toInt8(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
        }
        try {
            var param_a = BigInt(128)
            convert_result = param_a.toInt8(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
        }

        let expwra_map = HashMap<String, Int8>([("0", 0), ("127", 127), ("-128", -128), ("-129", 127), ("128", -128)])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert_result = param_a.toInt8(overflowHandling: Wrapping)
            @Expect(convert_result, v)
        }

        let expsta_map = HashMap<String, Int8>([("0", 0), ("127", 127), ("-128", -128), ("-129", -128), ("128", 127)])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert_result = param_a.toInt8(overflowHandling: Saturating)
            @Expect(convert_result, v)
        }
    }

    @TestCase
    func toInt16_case(): Unit {
        var convert_result: Int16 = 0
        let expthr_map = HashMap<String, String>([("0", "0"), ("7fff", "32767"), ("-8000", "-32768")])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt16(overflowHandling: Throwing)
            @Expect(convert_result.toString(), v)
        }

        try {
            var param_a = BigInt.parse("-8001", radix: 16)
            convert_result = param_a.toInt16(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int16.")
        }
        try {
            var param_a = BigInt.parse("8000", radix: 16)
            convert_result = param_a.toInt16(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int16.")
        }

        let expwra_map = HashMap<String, String>(
            [("0", "0"), ("7fff", "32767"), ("-8000", "-32768"), ("-8001", "32767"), ("8000", "-32768")])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt16(overflowHandling: Wrapping)
            @Expect(convert_result.toString(), v)
        }

        let expsta_map = HashMap<String, String>(
            [("0", "0"), ("7fff", "32767"), ("-8000", "-32768"), ("-8001", "-32768"), ("8000", "32767")])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt16(overflowHandling: Saturating)
            @Expect(convert_result.toString(), v)
        }
    }

    @TestCase
    func toInt32_case(): Unit {
        var convert_result: Int32 = 0
        let expthr_map = HashMap<String, String>([("0", "0"), ("7fffffff", "2147483647"), ("-80000000", "-2147483648")])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt32(overflowHandling: Throwing)
            @Expect(convert_result.toString(), v)
        }

        try {
            var param_a = BigInt.parse("-80000001", radix: 16)
            convert_result = param_a.toInt32(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int32.")
        }
        try {
            var param_a = BigInt.parse("80000000", radix: 16)
            convert_result = param_a.toInt32(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int32.")
        }

        let expwra_map = HashMap<String, String>(
            [("0", "0"), ("7fffffff", "2147483647"), ("-80000000", "-2147483648"), ("-80000001", "2147483647"),
                ("80000000", "-2147483648")])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt32(overflowHandling: Wrapping)
            @Expect(convert_result.toString(), v)
        }

        let expsta_map = HashMap<String, String>(
            [("0", "0"), ("7fffffff", "2147483647"), ("-80000000", "-2147483648"), ("-80000001", "-2147483648"),
                ("80000000", "2147483647")])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt32(overflowHandling: Saturating)
            @Expect(convert_result.toString(), v)
        }
    }

    @TestCase
    func toInt64_case(): Unit {
        var convert_result: Int64 = 0
        let expthr_map = HashMap<String, String>(
            [("0", "0"), ("7fffffffffffffff", "9223372036854775807"), ("-8000000000000000", "-9223372036854775808")])
        for ((k, v) in expthr_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt64(overflowHandling: Throwing)
            @Expect(convert_result.toString(), v)
        }

        try {
            var param_a = BigInt.parse("-10000000000000001", radix: 16)
            convert_result = param_a.toInt64(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int64.")
        }
        try {
            var param_a = BigInt.parse("10000000000000000", radix: 16)
            convert_result = param_a.toInt64(overflowHandling: Throwing)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int64.")
        }

        let expwra_map = HashMap<String, String>(
            [("0", "0"), ("7fffffffffffffff", "9223372036854775807"), ("-8000000000000000", "-9223372036854775808"),
                ("-8000000000000001", "9223372036854775807"), ("8000000000000000", "-9223372036854775808")])
        for ((k, v) in expwra_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt64(overflowHandling: Wrapping)
            @Expect(convert_result.toString(), v)
        }

        let expsta_map = HashMap<String, String>(
            [("0", "0"), ("7fffffffffffffff", "9223372036854775807"), ("-8000000000000000", "-9223372036854775808"),
                ("-8000000000000001", "-9223372036854775808"), ("8000000000000000", "9223372036854775807")])
        for ((k, v) in expsta_map) {
            var param_a = BigInt.parse(k, radix: 16)
            convert_result = param_a.toInt64(overflowHandling: Saturating)
            @Expect(convert_result.toString(), v)
        }
    }

    @TestCase
    func lowtohigh_warp_case(): Unit {
        var convert16_result: Int16 = 0
        let to16_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to16_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert16_result = param_a.toInt16(overflowHandling: Wrapping)
            @Expect(convert16_result.toString(), v)
        }

        var convert32_result: Int32 = 0
        let to32_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to32_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert32_result = param_a.toInt32(overflowHandling: Wrapping)
            @Expect(convert32_result.toString(), v)
        }

        var convert64_result: Int64 = 0
        let to64_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to64_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert64_result = param_a.toInt64(overflowHandling: Wrapping)
            @Expect(convert64_result.toString(), v)
        }
    }

    @TestCase
    func lowtohigh_throw_case(): Unit {
        var convert16_result: Int16 = 0
        let to16_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to16_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert16_result = param_a.toInt16(overflowHandling: Throwing)
            @Expect(convert16_result.toString(), v)
        }

        var convert32_result: Int32 = 0
        let to32_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to32_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert32_result = param_a.toInt32(overflowHandling: Throwing)
            @Expect(convert32_result.toString(), v)
        }

        var convert64_result: Int64 = 0
        let to64_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to64_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert64_result = param_a.toInt64(overflowHandling: Throwing)
            @Expect(convert64_result.toString(), v)
        }
    }

    @TestCase
    func lowtohigh_satur_case(): Unit {
        var convert16_result: Int16 = 0
        let to16_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to16_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert16_result = param_a.toInt16(overflowHandling: Saturating)
            @Expect(convert16_result.toString(), v)
        }

        var convert32_result: Int32 = 0
        let to32_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to32_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert32_result = param_a.toInt32(overflowHandling: Saturating)
            @Expect(convert32_result.toString(), v)
        }

        var convert64_result: Int64 = 0
        let to64_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("-1", "-1"), ("1", "1"), ("-129", "-129"), ("128", "128")])
        for ((k, v) in to64_map) {
            var param_a = BigInt.parse(k, radix: 10)
            convert64_result = param_a.toInt64(overflowHandling: Saturating)
            @Expect(convert64_result.toString(), v)
        }
    }
}
