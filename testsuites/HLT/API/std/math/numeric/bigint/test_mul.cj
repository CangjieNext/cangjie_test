/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./bigint_mul.txt
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.math.numeric.*

var count = 0
var str_1 = ""
var str_2 = ""
var exp_result = ""

@Test
class Test_bigint_mul {
    @TestCase
    func test_mul_case_01(): Unit {
        var filename = "bigint_mul.txt"
        var arr = File.readFrom(filename)
        var arr_str = String.fromUtf8(arr)

        var arr_raw = arr_str.split("\r\n")
        for (i in 0..arr_raw.size) {
            var bigint_raw = arr_raw[i]
            str_1 = bigint_raw.split(" ")[0]
            str_2 = bigint_raw.split(" ")[1]
            exp_result = bigint_raw.split(" ")[2]

            let mulnum_1 = BigInt(str_1)
            let mulnum_2 = BigInt.parse(str_2, radix: 10)
            let mul_result = mulnum_1 * mulnum_2
            @Expect(mul_result.toString(), exp_result)
            count++
        }
        @Expect(count, 1000)
    }

    @TestCase
    func test_mul_case_02(): Unit {
        var mulnum_1 = BigInt(0)
        var mulnum_2 = BigInt.parse("0", radix: 16)
        var mul_result = mulnum_1 * mulnum_2
        @Expect(mul_result.toString(), "0")

        mulnum_1 = BigInt(0)
        mulnum_2 = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        mul_result = mulnum_1 * mulnum_2
        @Expect(mul_result.toString(), "0")

        mulnum_1 = BigInt(1)
        mulnum_2 = BigInt.parse("1", radix: 16)
        mul_result = mulnum_1 * mulnum_2
        @Expect(mul_result.toString(), "1")

        mulnum_1 = BigInt(-1)
        mulnum_2 = BigInt.parse("0", radix: 16)
        mul_result = mulnum_1 * mulnum_2
        @Expect(mul_result.toString(), "0")

        mulnum_1 = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        mulnum_2 = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        mul_result = mulnum_1 * mulnum_2
        @Expect(mul_result.toString(radix: 16), "FFFFFFFFFFFFFFFFFFFFFFFE000000000000000000000001")
    }

    @TestCase
    func test_complex_case_03(): Unit {
        var num_1 = BigInt(0)
        var num_2 = BigInt.parse("-1", radix: 16)
        var num_3 = BigInt(1)
        var result = num_1 + num_2 * num_3 + num_2 ** 2 - num_2 + (-num_2) / num_3
        @Expect(result.toString(), "2")
    }
}
