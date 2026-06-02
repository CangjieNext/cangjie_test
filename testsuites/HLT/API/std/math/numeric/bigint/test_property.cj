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
class BigIntPropertyTest {
    @TestCase
    func sign_case(): Unit {
        let exp_map = HashMap<String, Int64>([("0", 0), ("-0", 0), ("-ffffffffffffffffffffffff", -1)])
        for ((k, v) in exp_map) {
            var param_a = BigInt.parse(k, radix: 16)
            var sign_result = param_a.sign
            @Expect(sign_result, v)
        }
    }

    @TestCase
    func bitLen_case(): Unit {
        let exp_map = HashMap<String, Int64>(
            [("0", 1), ("-0", 1), ("-ffffffffffffffffffffffff", 97), ("ffffffffffffffffffffffff", 96)])
        for ((k, v) in exp_map) {
            var param_a = BigInt.parse(k, radix: 16)
            var len_result = param_a.bitLen
            @Expect(len_result, v)
        }
    }

    @TestCase
    func testBit_case(): Unit {
        var param_a = BigInt(0)
        var flag = param_a.testBit(96)
        @Expect(flag.toString(), "false")

        param_a = BigInt("-0")
        flag = param_a.testBit(96)
        @Expect(flag.toString(), "false")

        param_a = BigInt("-1")
        flag = param_a.testBit(10086)
        @Expect(flag.toString(), "true")

        param_a = BigInt("1")
        flag = param_a.testBit(10086)
        @Expect(flag.toString(), "false")

        param_a = BigInt("2")
        flag = param_a.testBit(0)
        @Expect(flag.toString(), "false")

        try {
            param_a = BigInt("-100")
            flag = param_a.testBit(-96)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
    }

    @TestCase
    func trailingZeros_case(): Unit {
        let exp_map = HashMap<String, Int64>([("0", -1), ("-0", -1), ("-1", 0), ("-50", 4)])
        for ((k, v) in exp_map) {
            var param_a = BigInt.parse(k, radix: 16)
            var result = trailingZeros(param_a)
            @Expect(result, v)
        }
    }

    @TestCase
    func setBit_case(): Unit {
        let exp_index0map = HashMap<String, String>([("0", "1"), ("-0", "1"), ("-1", "-1")])
        for ((k, v) in exp_index0map) {
            var param_a = BigInt.parse(k, radix: 16)
            var index = 0
            var set_result = param_a.setBit(index)
            @Expect(set_result.toString(radix: 16), v)
        }

        let exp_index5map = HashMap<String, String>([("0", "20"), ("-0", "20"), ("-1", "-1"), ("40", "60"),
            ("1DF", "1FF")])
        for ((k, v) in exp_index5map) {
            var param_a = BigInt.parse(k, radix: 16)
            var index = 5
            var set_result = param_a.setBit(index)
            @Expect(set_result.toString(radix: 16), v)
        }

        var param_a = BigInt.parse("-ffffffffffffffffffffffff", radix: 16)
        var index = -1
        try {
            param_a.setBit(index)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
    }

    @TestCase
    func clearBit_case(): Unit {
        let exp_index0map = HashMap<String, String>([("0", "0"), ("1", "0"), ("-1", "-2")])
        for ((k, v) in exp_index0map) {
            var param_a = BigInt.parse(k, radix: 16)
            var index = 0
            var set_result = param_a.clearBit(index)
            @Expect(set_result.toString(radix: 16), v)
        }

        let exp_index96map = HashMap<String, String>(
            [("1000000000000000000000000", "0"), ("-1000000000000000000000000", "-2000000000000000000000000"), ("0", "0")])
        for ((k, v) in exp_index96map) {
            var param_a = BigInt.parse(k, radix: 16)
            var index = 96
            var set_result = param_a.clearBit(index)
            @Expect(set_result.toString(radix: 16), v)
        }

        var param_a = BigInt(0)
        var index = -96
        try {
            param_a.clearBit(index)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
    }

    @TestCase
    func flipBit_case(): Unit {
        let exp_index96map = HashMap<String, String>(
            [("1000000000000000000000000", "0"), ("-1000000000000000000000000", "-2000000000000000000000000"),
                ("0", "1000000000000000000000000"), ("-0", "1000000000000000000000000")])
        for ((k, v) in exp_index96map) {
            var param_a = BigInt.parse(k, radix: 16)
            var index = 96
            var set_result = param_a.flipBit(index)
            @Expect(set_result.toString(radix: 16), v)
        }

        let exp_index0map = HashMap<String, String>([("0", "1"), ("1", "0"), ("-1", "-2")])
        for ((k, v) in exp_index0map) {
            var param_a = BigInt.parse(k, radix: 16)
            var index = 0
            var set_result = param_a.flipBit(index)
            @Expect(set_result.toString(radix: 16), v)
        }

        var param_a = BigInt(0)
        var index = -32
        try {
            param_a.flipBit(index)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
    }

    @TestCase
    func isPrime_case(): Unit {
        var param_a = BigInt(5)
        var flag = param_a.isProbablePrime(5)
        @Expect(flag)

        param_a = BigInt(-1)
        flag = param_a.isProbablePrime(1)
        @Expect(flag, false)

        param_a = BigInt(0)
        flag = param_a.isProbablePrime(0)
        @Expect(flag)
    }
}
