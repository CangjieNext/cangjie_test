/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*
import std.random.*
import std.math.*

@Test
class BigInitTest {
    @TestCase
    func intUIntInit(): Unit {
        var param_a = BigInt(Int8(0))
        @Expect(param_a.toString(), "0")
        param_a = BigInt(Int16(0))
        @Expect(param_a.toString(), "0")
        param_a = BigInt(Int32(0))
        @Expect(param_a.toString(), "0")
        param_a = BigInt(Int64(0))
        @Expect(param_a.toString(), "0")
        param_a = BigInt(IntNative(0))
        @Expect(param_a.toString(), "0")

        param_a = BigInt(Int8.Max)
        @Expect(param_a.toString(), Int8.Max.toString())
        param_a = BigInt(Int16.Max)
        @Expect(param_a.toString(), Int16.Max.toString())
        param_a = BigInt(Int32.Max)
        @Expect(param_a.toString(), Int32.Max.toString())
        param_a = BigInt(Int64.Max)
        @Expect(param_a.toString(), Int64.Max.toString())
        param_a = BigInt(IntNative.Max)
        @Expect(param_a.toString(), IntNative.Max.toString())

        param_a = BigInt(UInt8.Max)
        @Expect(param_a.toString(), UInt8.Max.toString())
        param_a = BigInt(UInt16.Max)
        @Expect(param_a.toString(), UInt16.Max.toString())
        param_a = BigInt(UInt32.Max)
        @Expect(param_a.toString(), UInt32.Max.toString())
        param_a = BigInt(UInt64.Max)
        @Expect(param_a.toString(), UInt64.Max.toString())
        param_a = BigInt(UIntNative.Max)
        @Expect(param_a.toString(), UIntNative.Max.toString())

        param_a = BigInt(UInt8.Min)
        @Expect(param_a.toString(), UInt8.Min.toString())
        param_a = BigInt(UInt16.Min)
        @Expect(param_a.toString(), UInt16.Min.toString())
        param_a = BigInt(UInt32.Min)
        @Expect(param_a.toString(), UInt32.Min.toString())
        param_a = BigInt(UInt64.Min)
        @Expect(param_a.toString(), UInt64.Min.toString())
        param_a = BigInt(UIntNative.Min)
        @Expect(param_a.toString(), UIntNative.Min.toString())
    }

    @TestCase
    func randomInit(): Unit {
        let rand1 = Random(1)
        let rand2 = Random(2)
        var param_a = BigInt(false, 1, rand: rand1)
        var param_b = BigInt(false, 1, rand: rand2)
        @Expect(param_a, param_b)

        try {
            BigInt(true, 0, rand: rand1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 0.")
        }
        try {
            BigInt(false, -2, rand: rand1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 0.")
        }

        try {
            BigInt.randomProbablePrime(1, 5, rand: rand1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 1.")
        }
        try {
            BigInt.randomProbablePrime(0, 5, rand: rand1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 1.")
        }
        try {
            BigInt.randomProbablePrime(-1, 5, rand: rand1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The bitLen of the BigInt must > 1.")
        }
    }

    @TestCase
    func stringInit(): Unit {
        try {
            BigInt.parse("", radix: 10)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("-", radix: 10)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("+", radix: 10)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("1", radix: 1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The radix should in the range of [2, 36].")
        }
        try {
            BigInt.parse("0", radix: 37)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The radix should in the range of [2, 36].")
        }
        try {
            BigInt.parse("z", radix: 10)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("9", radix: 8)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
        try {
            BigInt.parse("0+", radix: 4)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid string.")
        }
    }
}
