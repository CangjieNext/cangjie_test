/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./bigint_mod.txt
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.math.numeric.*

var count = 0
var str_1 = ""
var str_2 = ""
var exp_result = ""

@Test
class Test_bigint_mod {
    @TestCase
    func test_mod_case_01(): Unit {
        var filename = "bigint_mod.txt"
        var arr = File.readFrom(filename)
        var arr_str = String.fromUtf8(arr)

        var arr_raw = arr_str.split("\r\n")
        for (i in 0..arr_raw.size) {
            var bigint_raw = arr_raw[i]
            str_1 = bigint_raw.split(" ")[0]
            str_2 = bigint_raw.split(" ")[1]
            exp_result = bigint_raw.split(" ")[2]

            let modnum_1 = BigInt(str_1)
            let modnum_2 = BigInt.parse(str_2, radix: 10)
            let mod_result = modnum_1 % modnum_2
            @Expect(mod_result.toString(), exp_result)
            count++
        }
        @Expect(count, 1000)
    }

    @TestCase
    func test_mod_case_02(): Unit {
        var modnum_1 = BigInt(0)
        var modnum_2 = BigInt.parse("1", radix: 16)
        var mod_result = modnum_1 % modnum_2
        @Expect(mod_result.toString(), "0")

        modnum_1 = BigInt(0)
        modnum_2 = BigInt.parse("-1", radix: 10)
        mod_result = modnum_1 % modnum_2
        @Expect(mod_result.toString(), "0")

        modnum_1 = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        modnum_2 = BigInt(1)
        mod_result = modnum_1 % modnum_2
        @Expect(mod_result.toString(), "0")

        modnum_1 = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        modnum_2 = BigInt(2)
        mod_result = modnum_1 % modnum_2
        @Expect(mod_result.toString(), "-1")

        modnum_1 = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        modnum_2 = BigInt(-2)
        mod_result = modnum_1 % modnum_2
        @Expect(mod_result.toString(), "1")

        try {
            modnum_1 = BigInt(0)
            modnum_2 = BigInt.parse("0", radix: 10)
            mod_result = modnum_1 % modnum_2
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }
    }

    @TestCase
    func test_modInverse_case_03(): Unit {
        var modnum_1 = BigInt(0)
        var modnum_2 = BigInt.parse("1", radix: 16)
        var modInv_result = modnum_1.modInverse(modnum_2)
        @Expect(modInv_result.toString(), "0")

        modnum_1 = BigInt(4)
        modnum_2 = BigInt.parse("2", radix: 16)
        try {
            modInv_result = modnum_1.modInverse(modnum_2)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The BigInt is not relatively prime with the input.")
        }

        modnum_1 = BigInt(2)
        modnum_2 = BigInt.parse("0", radix: 16)
        try {
            modInv_result = modnum_1.modInverse(modnum_2)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The BigInt is not relatively prime with the input.")
        }
    }
}
