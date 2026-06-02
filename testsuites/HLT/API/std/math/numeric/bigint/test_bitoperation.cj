/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*
import std.collection.*

@Test
class BigIntBitOpertTest {
    @TestCase
    func bit_operation_case(): Unit {
        var param_a = BigInt.parse("10000000000000000", radix: 16)
        var param_b = BigInt.parse("ffffffffffffffffffffffff", radix: 16)
        var and_result = param_a & param_b
        @Expect(and_result.toString(radix: 16), "10000000000000000")
        var or_result = param_a | param_b
        @Expect(or_result.toString(radix: 16), "FFFFFFFFFFFFFFFFFFFFFFFF")
        var xor_result = param_a ^ param_b
        @Expect(xor_result.toString(radix: 16), "FFFFFFFEFFFFFFFFFFFFFFFF")

        param_a = BigInt.parse("ffffffffffffffffffffffff", radix: 16)
        param_b = BigInt.parse("-8000000000000000", radix: 16)
        and_result = param_a & param_b
        @Expect(and_result.toString(radix: 16), "FFFFFFFF8000000000000000")
        or_result = param_a | param_b
        @Expect(or_result.toString(radix: 16), "-1")
        xor_result = param_a ^ param_b
        @Expect(xor_result.toString(radix: 16), "-FFFFFFFF8000000000000001")

        param_a = BigInt.parse("-10000000000000000", radix: 16)
        param_b = BigInt.parse("-8000000000000001", radix: 16)
        and_result = param_a & param_b
        @Expect(and_result.toString(radix: 16), "-10000000000000000")
        or_result = param_a | param_b
        @Expect(or_result.toString(radix: 16), "-8000000000000001")
        xor_result = param_a ^ param_b
        @Expect(xor_result.toString(radix: 16), "7FFFFFFFFFFFFFFF")

        param_a = BigInt.parse("-8000000000000000", radix: 16)
        param_b = BigInt.parse("10000000000000000", radix: 16)
        and_result = param_a & param_b
        @Expect(and_result.toString(radix: 16), "10000000000000000")
        or_result = param_a | param_b
        @Expect(or_result.toString(radix: 16), "-8000000000000000")
        xor_result = param_a ^ param_b
        @Expect(xor_result.toString(radix: 16), "-18000000000000000")

        param_a = BigInt.parse("-0", radix: 10)
        param_b = BigInt(0)
        and_result = param_a & param_b
        @Expect(and_result.toString(radix: 16), "0")
        or_result = param_a | param_b
        @Expect(or_result.toString(radix: 16), "0")
        xor_result = param_a ^ param_b
        @Expect(xor_result.toString(radix: 16), "0")

        param_a = BigInt.parse("10000000000000000", radix: 16)
        param_b = BigInt.parse("-0", radix: 16)
        and_result = param_a & param_b
        @Expect(and_result.toString(radix: 16), "0")
        or_result = param_a | param_b
        @Expect(or_result.toString(radix: 16), "10000000000000000")
        xor_result = param_a ^ param_b
        @Expect(xor_result.toString(radix: 16), "10000000000000000")

        param_a = BigInt.parse("+0", radix: 16)
        param_b = BigInt.parse("-8000000000000000", radix: 16)
        and_result = param_a & param_b
        @Expect(and_result.toString(radix: 16), "0")
        or_result = param_a | param_b
        @Expect(or_result.toString(radix: 16), "-8000000000000000")
        xor_result = param_a ^ param_b
        @Expect(xor_result.toString(radix: 16), "-8000000000000000")
    }

    @TestCase
    func shift_case(): Unit {
        var param_a = BigInt.parse("0", radix: 10)
        var right_result = param_a >> 0
        @Expect(right_result.toString(radix: 16), "0")
        var left_result = param_a << 0
        @Expect(left_result.toString(radix: 16), "0")

        param_a = BigInt.parse("-0", radix: 10)
        right_result = param_a >> 96
        @Expect(right_result.toString(radix: 16), "0")
        left_result = param_a << 96
        @Expect(left_result.toString(radix: 16), "0")

        param_a = BigInt.parse("-1", radix: 10)
        right_result = param_a >> 96
        @Expect(right_result.toString(radix: 16), "-1")
        left_result = param_a << 96
        @Expect(left_result.toString(radix: 16), "-1000000000000000000000000")

        param_a = BigInt.parse("ffffffffffffffffffffffff", radix: 16)
        right_result = param_a >> 97
        @Expect(right_result.toString(radix: 16), "0")
        left_result = param_a << 97
        @Expect(left_result.toString(radix: 16), "1FFFFFFFFFFFFFFFFFFFFFFFE000000000000000000000000")

        param_a = BigInt.parse("-8000000000000000", radix: 16)
        right_result = param_a >> 96
        @Expect(right_result.toString(radix: 16), "-1")
        left_result = param_a << 96
        @Expect(left_result.toString(radix: 16), "-8000000000000000000000000000000000000000")

        try {
            param_a = BigInt.parse("0", radix: 10)
            param_a >> -1
            @Expect(1,2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The parameter n must >= 0.")
        }

        try {
            param_a = BigInt.parse("1", radix: 10)
            param_a << -32
            @Expect(1,2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The parameter n must >= 0.")
        }
    }

    @TestCase
    func not_bitwise_case(): Unit {
        let exp_map = HashMap<String, String>(
            [("+0", "-1"), ("-0", "-1"), ("-1", "0"), ("ffffffffffffffffffffffff", "-1000000000000000000000000"),
                ("-8000000000000000", "7FFFFFFFFFFFFFFF")])
        for ((k, v) in exp_map) {
            var param_a = BigInt.parse(k, radix: 16)
            var not_result = !param_a
            @Expect(not_result.toString(radix: 16), v)
        }
    }
}
