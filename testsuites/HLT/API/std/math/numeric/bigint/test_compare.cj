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

@Test
class BigIntCompareTest {
    @TestCase
    func compare_case(): Unit {
        var param_a = BigInt.parse("0", radix: 16)
        var param_b = BigInt.parse("-0", radix: 16)
        var flag = (param_a == param_b)
        @Expect(flag)

        param_a = BigInt.parse("0", radix: 16)
        param_b = BigInt.parse("-1", radix: 16)
        flag = (param_a > param_b)
        @Expect(flag)

        param_a = BigInt.parse("0", radix: 16)
        param_b = BigInt.parse("+1", radix: 16)
        flag = (param_a < param_b)
        @Expect(flag)

        param_a = BigInt.parse("-8000000000000000", radix: 16)
        param_b = BigInt.parse("-8000000000000001", radix: 16)
        flag = (param_a > param_b)
        @Expect(flag)

        param_a = BigInt("79228162514264337593543950335")
        param_b = BigInt.parse("1000000000000000000000000", radix: 16)
        flag = (param_a < param_b)
        @Expect(flag)
        flag = (param_a != param_b)
        @Expect(flag)
    }
}
