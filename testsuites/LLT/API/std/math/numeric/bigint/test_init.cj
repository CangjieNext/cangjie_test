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
import std.random.*

@Test
class BigInitTest {
    @TestCase
    func complementInit(): Unit {
        var bytes: Array<Byte> = [128, 0, 0, 0, 0, 0, 0, 0]
        var i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-8000000000000000")
        @Expect(i.toBytes(), bytes)
        bytes = [255, 255, 255, 128, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-8000000000000000")
        @Expect(i.toBytes(), [128u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8])
        bytes = [128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-8000000000000000000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [127, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "7F00000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [0, 129, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "8100000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [129, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-7F00000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
        i = BigInt(bytes)
        @Expect(i.toString(), "42649378395939397566720")
        @Expect(i.toBytes(), bytes)

        bytes = [0, 128, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "8000000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "8000000000000000000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [255, 124, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-8400000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [247, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-840000000000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [247, 192, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(radix: 16), "-84000000000000000")
        @Expect(i.toBytes(), bytes)

        bytes = [0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.toString(), "0")
        @Expect(i.toBytes(), [0u8])

        bytes = Array<Byte>()
        try {
            i = BigInt(bytes)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The size of bytes cannot be zero!")
        }

        bytes = [0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255]
        i = BigInt(bytes)
        @Expect(i.toBytes(), bytes)
    }

    @TestCase
    func magnitudeInit(): Unit {
        var bytes: Array<Byte> = [128, 0, 0, 0, 0, 0, 0, 0]
        var i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "8000000000000000")
        bytes = [255, 255, 255, 128, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "FFFFFF8000000000000000")
        bytes = [128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(true, bytes)
        @Expect(i.toString(radix: 16), "8000000000000000000000000000")

        bytes = [127, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-7F00000000000000")
        bytes = [0, 128, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-8000000000000000")
        bytes = [0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(false, bytes)
        @Expect(i.toString(radix: 16), "-8000000000000000000000000000")

        bytes = [0, 0, 0, 0, 0, 0, 0]
        try {
            i = BigInt(false, bytes)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The size or the value of magnitude cannot be zero if sign is true!")
        }

        bytes = Array<Byte>()
        try {
            i = BigInt(false, bytes)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The size or the value of magnitude cannot be zero if sign is true!")
        }
        i = BigInt(true, bytes)
        @Expect(i.toString(), "0")
    }

    @TestCase
    func intUIntInit(): Unit {
        var i = BigInt(Int8(-1))
        @Expect(i.toString(), "-1")
        i = BigInt(Int16(-1))
        @Expect(i.toString(), "-1")
        i = BigInt(Int32(-1))
        @Expect(i.toString(), "-1")
        i = BigInt(Int64(-1))
        @Expect(i.toString(), "-1")
        i = BigInt(IntNative(-1))
        @Expect(i.toString(), "-1")

        i = BigInt(UInt8(1))
        @Expect(i.toString(), "1")
        i = BigInt(UInt16(1))
        @Expect(i.toString(), "1")
        i = BigInt(UInt32(1))
        @Expect(i.toString(), "1")
        i = BigInt(UInt64(1))
        @Expect(i.toString(), "1")
        i = BigInt(UIntNative(1))
        @Expect(i.toString(), "1")
        i = BigInt(Int8.Min)
        @Expect(i.toString(), Int8.Min.toString())
        i = BigInt(Int16.Min)
        @Expect(i.toString(), Int16.Min.toString())
        i = BigInt(Int32.Min)
        @Expect(i.toString(), Int32.Min.toString())
        i = BigInt(Int64.Min)
        @Expect(i.toString(), Int64.Min.toString())
        i = BigInt(IntNative.Min)
        @Expect(i.toString(), IntNative.Min.toString())
    }

    @TestCase
    func randomInit(): Unit {
        let rand1 = Random(7)
        let rand2 = Random(7)
        var b1 = BigInt(false, 96, rand: rand1)
        var b2 = BigInt(false, 96, rand: rand2)
        @Expect(b1 == b2)

        try {
            BigInt(false, 0, rand: rand1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 0.")
        }

        try {
            BigInt(false, -1, rand: rand1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 0.")
        }
    }

    @TestCase
    func randomProbablePrime(): Unit {
        let rand1 = Random(7)
        let rand2 = Random(7)
        var b1 = BigInt.randomProbablePrime(50, 5, rand: rand1)
        var b2 = BigInt.randomProbablePrime(50, 5, rand: rand2)
        @Expect(b1 == b2)
        @Expect(b1.isProbablePrime(5))

        b1 = BigInt.randomProbablePrime(50, 5, rand: rand1)
        b2 = BigInt.randomProbablePrime(50, 5, rand: rand2)
        @Expect(b1 == b2)
        @Expect(b1.isProbablePrime(5))

        b1 = BigInt.randomProbablePrime(5, 5, rand: rand1)
        b2 = BigInt.randomProbablePrime(5, 5, rand: rand2)
        @Expect(b1 == b2)
        @Expect(b1.isProbablePrime(5))

        b1 = BigInt.randomProbablePrime(100, 5)
        b2 = BigInt.randomProbablePrime(100, 5)
        @Expect(b1.isProbablePrime(5))
        @Expect(b2.isProbablePrime(5))

        try {
            BigInt.randomProbablePrime(1, 5)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 1.")
        }
    }

    @TestCase
    func stringInit(): Unit {
        try {
            BigInt.parse("", radix: 10)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("-", radix: 10)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("+", radix: 10)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("3", radix: 1)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The radix should in the range of [2, 36].")
        }
        try {
            BigInt.parse("3", radix: 37)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The radix should in the range of [2, 36].")
        }
        try {
            BigInt.parse("3", radix: 3)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("3+", radix: 4)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }

        var i = BigInt.parse("-zzzzz", radix: 36)
        // 35 × 36 ^ 4 + 35 × 36 ^ 3 + 35 × 36 ^ 2 + 35 × 36 + 35 = 60466175
        @Expect(i.toString(), "-60466175")
        i = BigInt.parse("f" * 600, radix: 16)
        var s = "1" * 4 * 600
        @Expect(i.toString(radix: 2), s)
        i = BigInt.parse("o" * 600, radix: 25)
        s = "4" * 2 * 600
        @Expect(i.toString(radix: 5), s)
    }

    @TestCase
    func testFloat(): Unit {
        let f16: Float16 = 123.456
        let f32: Float32 = 123.456
        let f64: Float64 = 123.456
        @Expect(BigInt(f16).toFloat16().toString(), "123.000000")
        @Expect(BigInt(f32).toFloat32().toString(), "123.000000")
        @Expect(BigInt(f32).toFloat64().toString(), "123.000000")

        @ExpectThrows[IllegalArgumentException](BigInt(Float16.NaN))
        @ExpectThrows[IllegalArgumentException](BigInt(Float32.NaN))
        @ExpectThrows[IllegalArgumentException](BigInt(Float64.NaN))
        @ExpectThrows[IllegalArgumentException](BigInt(Float16.Inf))
        @ExpectThrows[IllegalArgumentException](BigInt(Float32.Inf))
        @ExpectThrows[IllegalArgumentException](BigInt(Float64.Inf))
    }
}
