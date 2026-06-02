/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./bigint_add.txt
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.math.numeric.*

var count = 0
var str_1 = ""
var str_2 = ""
var exp_result = ""

@Test
class Test_bigint_add {
    @TestCase
    func test_add_case_01(): Unit {
        var filename = "bigint_add.txt"
        var arr = File.readFrom(filename)
        var arr_str = String.fromUtf8(arr)

        var arr_raw = arr_str.split("\r\n")
        for (i in 0..arr_raw.size) {
            var bigint_raw = arr_raw[i]
            str_1 = bigint_raw.split(" ")[0]
            str_2 = bigint_raw.split(" ")[1]
            exp_result = bigint_raw.split(" ")[2]

            let addnum_1 = BigInt(str_1)
            let addnum_2 = BigInt.parse(str_2, radix: 10)
            let add_result = addnum_1 + addnum_2
            @Expect(add_result.toString(), exp_result)
            count++
        }
        @Expect(count, 1000)
    }

    @TestCase
    func test_add_case_02(): Unit {
        var addnum_1 = BigInt(1)
        var addnum_2 = BigInt.parse("-0", radix: 10)
        var add_result = addnum_1 + addnum_2
        @Expect(add_result.toString(), "1")

        addnum_1 = BigInt(0)
        addnum_2 = BigInt.parse("0", radix: 10)
        add_result = addnum_1 + addnum_2
        @Expect(add_result.toString(), "0")

        addnum_1 = BigInt(-1)
        addnum_2 = BigInt.parse("1", radix: 10)
        add_result = addnum_1 + addnum_2
        @Expect(add_result.toString(), "0")

        addnum_1 = BigInt.parse("fffffffffffffffffffffff6", radix: 16)
        addnum_2 = BigInt.parse("+FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        add_result = addnum_1 + addnum_2
        @Expect(add_result.toString(radix: 16), "1FFFFFFFFFFFFFFFFFFFFFFF5")

        addnum_1 = BigInt(2)
        addnum_2 = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        add_result = addnum_1 + addnum_2
        @Expect(add_result.toString(radix: 16), "-FFFFFFFFFFFFFFFFFFFFFFFD")
    }
}
