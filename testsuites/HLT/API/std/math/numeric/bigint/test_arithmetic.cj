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
import std.collection.*

@Test
class BigIntaArithmeticTest {
    @TestCase
    func opposite_case(): Unit {
        let exp_map = HashMap<String, String>(
            [("0", "0"), ("FFFFFFFFFFFFFFFFFFFFFFFF", "-FFFFFFFFFFFFFFFFFFFFFFFF"),
                ("-FFFFFFFFFFFFFFFFFFFFFFFF", "FFFFFFFFFFFFFFFFFFFFFFFF"),
                ("1000000000000000000000000", "-1000000000000000000000000")])
        for ((k, v) in exp_map) {
            var orig_num = BigInt.parse(k, radix: 16)
            var opp_num = -orig_num
            @Expect(opp_num.toString(radix: 16), v)
        }
    }

    @TestCase
    func divAndMod_case(): Unit {
        let exp_map = HashMap<String, String>(
            [("1000000000000000000000000", "1000000000000000000000000"), ("FFFFFFFFFFFFFFFFFFFFFFFF", "1"),
                ("0", "-FFFFFFFFFFFFFFFFFFFFFFFF")])
        for ((k, v) in exp_map) {
            var dividend = BigInt.parse(k, radix: 16)
            var divisor = BigInt.parse(v, radix: 16)
            var div_result = dividend.divAndMod(divisor)[0]
            var mod_result = dividend.divAndMod(divisor)[1]
            var div_expect = dividend / divisor
            var mod_expect = dividend % divisor
            @Expect(div_result, div_expect)
            @Expect(mod_result, mod_expect)
        }

        let exp_map2 = HashMap<String, String>(
            [
                ("3463030059235137452437514702408010676904665091090740193055907072902802333571907856641798",
                    "-34630300592351374524375147024080106769046650910"),
                ("-3463030059235137452437514702408010676904665091090740193055907072902802333571907856641798",
                    "34630300592351374524375147024080106769046650910"),
                ("-3463030059235137452437514702408010676904665091090740193055907072902802333571907856641798",
                    "-34630300592351374524375147024080106769046650910")
            ]
        )
        for ((k, v) in exp_map2) {
            var dividend = BigInt.parse(k, radix: 10)
            var divisor = BigInt.parse(v, radix: 10)
            var div_result = dividend.divAndMod(divisor)[0]
            var mod_result = dividend.divAndMod(divisor)[1]
            var div_expect = dividend / divisor
            var mod_expect = dividend % divisor
            @Expect(div_result, div_expect)
            @Expect(mod_result, mod_expect)
        }

        try {
            var dividend = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
            var divisor = BigInt.parse("0", radix: 16)
            dividend.divAndMod(divisor)[0]
            @Expect(1,2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }
    }

    @TestCase
    func quoAndRem_case(): Unit {
        var dividend = BigInt.parse("-1", radix: 16)
        var divisor = BigInt.parse("10", radix: 10)
        var quo_result = dividend.quo(divisor)
        var rem_result = dividend.rem(divisor)
        @Expect(quo_result.toString(), "-1")
        @Expect(dividend.quoAndRem(divisor)[0].toString(), "-1")
        @Expect(rem_result.toString(), "9")
        @Expect(dividend.quoAndRem(divisor)[1].toString(), "9")

        dividend = BigInt.parse("-1", radix: 16)
        divisor = BigInt.parse("-1", radix: 16)
        quo_result = dividend.quo(divisor)
        rem_result = dividend.rem(divisor)
        @Expect(quo_result.toString(), "1")
        @Expect(dividend.quoAndRem(divisor)[0].toString(), "1")
        @Expect(rem_result.toString(), "0")
        @Expect(dividend.quoAndRem(divisor)[1].toString(), "0")

        dividend = BigInt.parse("-10", radix: 10)
        divisor = BigInt.parse("3", radix: 16)
        quo_result = dividend.quo(divisor)
        rem_result = dividend.rem(divisor)
        @Expect(quo_result.toString(), "-4")
        @Expect(dividend.quoAndRem(divisor)[0].toString(), "-4")
        @Expect(rem_result.toString(), "2")
        @Expect(dividend.quoAndRem(divisor)[1].toString(), "2")

        dividend = BigInt.parse("10", radix: 10)
        divisor = BigInt.parse("3", radix: 16)
        quo_result = dividend.quo(divisor)
        rem_result = dividend.rem(divisor)
        @Expect(quo_result.toString(), "3")
        @Expect(dividend.quoAndRem(divisor)[0].toString(), "3")
        @Expect(rem_result.toString(), "1")
        @Expect(dividend.quoAndRem(divisor)[1].toString(), "1")

        dividend = BigInt.parse("10", radix: 10)
        divisor = BigInt.parse("-3", radix: 16)
        quo_result = dividend.quo(divisor)
        rem_result = dividend.rem(divisor)
        @Expect(quo_result.toString(), "-3")
        @Expect(dividend.quoAndRem(divisor)[0].toString(), "-3")
        @Expect(rem_result.toString(), "1")
        @Expect(dividend.quoAndRem(divisor)[1].toString(), "1")

        try {
            dividend = BigInt.parse("0", radix: 16)
            divisor = BigInt.parse("0", radix: 16)
            quo_result = dividend.quo(divisor)
            @Expect(1,2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }

        try {
            dividend = BigInt.parse("-1", radix: 16)
            divisor = BigInt.parse("0", radix: 16)
            quo_result = dividend.rem(divisor)
            @Expect(1,2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }

        try {
            dividend = BigInt.parse("1000000000000000000000000", radix: 16)
            divisor = BigInt.parse("0", radix: 8)
            quo_result = dividend.quoAndRem(divisor)[0]
            @Expect(1,2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }
    }
}
