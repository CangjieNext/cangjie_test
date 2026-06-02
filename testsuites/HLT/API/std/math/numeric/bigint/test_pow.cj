/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./bigint_pow.txt
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.math.numeric.*
import std.convert.*

var str_1 = ""
var str_2 = ""
var exp_result = ""

@Test
class Test_bigint_pow {
    @TestCase
    func test_pow_case_01(): Unit {
        var filename = "bigint_pow.txt"
        var arr = File.readFrom(filename)
        var arr_str = String.fromUtf8(arr)
        var count = 0

        var arr_raw = arr_str.split("\r\n")
        for (i in 0..arr_raw.size) {
            var bigint_raw = arr_raw[i]
            str_1 = bigint_raw.split(" ")[0]
            str_2 = bigint_raw.split(" ")[1]
            exp_result = bigint_raw.split(" ")[2]

            let basenum = BigInt(str_1)
            var powernum = UInt64.parse(str_2)
            let pow_result = basenum ** powernum
            @Expect(pow_result.toString(), exp_result)
            count++
        }
        @Expect(count, 1000)
    }

    @TestCase
    func test_pow_case_02(): Unit {
        var basenum = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        var powernum: UInt64 = 0
        var pow_result = basenum ** powernum
        @Expect(pow_result.toString(), "1")

        basenum = BigInt.parse("0", radix: 16)
        powernum = 0
        pow_result = basenum ** powernum
        @Expect(pow_result.toString(), "1")

        basenum = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        powernum = 2
        pow_result = basenum ** powernum
        @Expect(pow_result.toString(radix: 16), "FFFFFFFFFFFFFFFFFFFFFFFE000000000000000000000001")
    }

    @TestCase
    func test_modPow_case_03(): Unit {
        var filename = "bigint_pow.txt"
        var arr = File.readFrom(filename)
        var arr_str = String.fromUtf8(arr)
        var count = 0

        var arr_raw = arr_str.split("\r\n")
        for (i in 0..arr_raw.size) {
            var bigint_raw = arr_raw[i]
            str_1 = bigint_raw.split(" ")[0]
            str_2 = bigint_raw.split(" ")[1]
            exp_result = bigint_raw.split(" ")[2]

            let basenum = BigInt(str_1)
            let powernum = BigInt(str_2)
            let pow_result = basenum.modPow(powernum)
            @Expect(pow_result.toString(), exp_result)
            count++
        }
        @Expect(count, 1000)
    }

    @TestCase
    func test_modPow_case_04(): Unit {
        var param_a = BigInt(-1)
        try {
            param_a.modPow(BigInt(-1))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The exponent can not be negative.")
        }
        try {
            param_a.modPow(BigInt(1), m: BigInt(0))
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }
    }
}
