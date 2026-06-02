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
class BigIntPublicInterfaceTest {
    @TestCase
    func abs_case(): Unit {
        let exp_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("1000000000000000000000000", "1000000000000000000000000"),
                ("-ffffffffffffffff", "FFFFFFFFFFFFFFFF")])
        for ((k, v) in exp_map) {
            var param_a = BigInt.parse(k, radix: 16)
            var abs_result = abs(param_a)
            @Expect(abs_result.toString(radix: 16), v)
        }
    }

    @TestCase
    func sqrt_case(): Unit {
        let exp_map = HashMap<String, String>(
            [("0", "0"), ("-0", "0"), ("1", "1"), ("1000000000000000000000000", "1000000000000")])
        for ((k, v) in exp_map) {
            var param_a = BigInt.parse(k, radix: 16)
            var abs_result = sqrt(param_a)
            @Expect(abs_result.toString(radix: 16), v)
        }

        var param_a = BigInt(-1)
        try {
            sqrt(param_a)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The BigInt be used to calculate the square root must >= 0.")
        }
    }

    @TestCase
    func gcd_case(): Unit {
        var param_a = BigInt.parse("0", radix: 16)
        var param_b = BigInt(0)
        var gcb_result = gcd(param_a, param_b)
        @Expect(gcb_result.toString(radix: 16), "0")

        param_a = BigInt.parse("1000000000000000000000000", radix: 16)
        param_b = BigInt(0)
        gcb_result = gcd(param_a, param_b)
        @Expect(gcb_result.toString(radix: 16), "1000000000000000000000000")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(1)
        gcb_result = gcd(param_a, param_b)
        @Expect(gcb_result.toString(radix: 16), "1")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        gcb_result = gcd(param_a, param_b)
        @Expect(gcb_result.toString(radix: 16), "FFFFFFFFFFFFFFFF")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(-1)
        gcb_result = gcd(param_a, param_b)
        @Expect(gcb_result.toString(radix: 16), "1")
    }

    @TestCase
    func lcm_case(): Unit {
        var param_a = BigInt.parse("0", radix: 16)
        var param_b = BigInt(0)
        var lcm_result = lcm(param_a, param_b)
        @Expect(lcm_result.toString(radix: 16), "0")

        param_a = BigInt.parse("1000000000000000000000000", radix: 16)
        param_b = BigInt(0)
        lcm_result = lcm(param_a, param_b)
        @Expect(lcm_result.toString(radix: 16), "0")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(1)
        lcm_result = lcm(param_a, param_b)
        @Expect(lcm_result.toString(radix: 16), "FFFFFFFFFFFFFFFF")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        lcm_result = lcm(param_a, param_b)
        @Expect(lcm_result.toString(radix: 16), "FFFFFFFFFFFFFFFF")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(-1)
        lcm_result = lcm(param_a, param_b)
        @Expect(lcm_result.toString(radix: 16), "FFFFFFFFFFFFFFFF")
    }

    @TestCase
    func max_case(): Unit {
        var param_a = BigInt.parse("-0", radix: 16)
        var param_b = BigInt(0)
        var max_result = max(param_a, param_b)
        @Expect(max_result.toString(radix: 16), "0")

        param_a = BigInt.parse("1000000000000000000000000", radix: 16)
        param_b = BigInt(0)
        max_result = max(param_a, param_b)
        @Expect(max_result.toString(radix: 16), "1000000000000000000000000")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(1)
        max_result = max(param_a, param_b)
        @Expect(max_result.toString(radix: 16), "1")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        max_result = max(param_a, param_b)
        @Expect(max_result.toString(radix: 16), "-FFFFFFFFFFFFFFFF")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(-1)
        max_result = max(param_a, param_b)
        @Expect(max_result.toString(radix: 16), "-1")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(0)
        max_result = max(param_a, param_b)
        @Expect(max_result.toString(radix: 16), "0")
    }

    @TestCase
    func min_case(): Unit {
        var param_a = BigInt.parse("-0", radix: 16)
        var param_b = BigInt(0)
        var min_result = min(param_a, param_b)
        @Expect(min_result.toString(radix: 16), "0")

        param_a = BigInt.parse("1000000000000000000000000", radix: 16)
        param_b = BigInt(0)
        min_result = min(param_a, param_b)
        @Expect(min_result.toString(radix: 16), "0")

        param_a = BigInt.parse("-1000000000000000000000000", radix: 16)
        param_b = BigInt(1)
        min_result = min(param_a, param_b)
        @Expect(min_result.toString(radix: 16), "-1000000000000000000000000")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        min_result = min(param_a, param_b)
        @Expect(min_result.toString(radix: 16), "-FFFFFFFFFFFFFFFF")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(-1)
        min_result = min(param_a, param_b)
        @Expect(min_result.toString(radix: 16), "-FFFFFFFFFFFFFFFF")

        param_a = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        param_b = BigInt(0)
        min_result = min(param_a, param_b)
        @Expect(min_result.toString(radix: 16), "-FFFFFFFFFFFFFFFF")
    }

    @TestCase
    func countOne_case(): Unit {
        let exp_map = HashMap<String, Int64>(
            [("0", 0), ("-0", 0), ("1", 1), ("1000000000000000000000000", 1), ("-ffffffffffffffff", 2)])
        for ((k, v) in exp_map) {
            var param_a = BigInt.parse(k, radix: 16)
            var countOne_result = countOnes(param_a)
            @Expect(countOne_result, v)
        }
    }

    @TestCase
    func compare_case(): Unit {
        var param_a = BigInt("0")
        var param_b = BigInt("-0")
        @Expect(param_a.compare(param_b), Ordering.EQ)

        param_a = BigInt("0")
        param_b = BigInt.parse("ffffffffffffffffffffffff", radix: 16)
        @Expect(param_a.compare(param_b), Ordering.LT)

        param_a = BigInt("0")
        param_b = BigInt.parse("-10000000000000000", radix: 16)
        @Expect(param_a.compare(param_b), Ordering.GT)

        param_a = BigInt.parse("ffffffffffffffffffffffff", radix: 16)
        param_b = BigInt.parse("-10000000000000000", radix: 16)
        @Expect(param_a.compare(param_b), Ordering.GT)

        param_a = BigInt.parse("ffffffffffffffffffffffff", radix: 16)
        param_b = BigInt.parse("1000000000000000000000000", radix: 16)
        @Expect(param_a.compare(param_b), Ordering.LT)

        param_a = BigInt.parse("-10000000000000000", radix: 16)
        param_b = BigInt.parse("-ffffffffffffffff", radix: 16)
        @Expect(param_a.compare(param_b), Ordering.LT)
    }
}
