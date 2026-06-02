/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./sm3_string.txt
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

var count = 0
var str_1 = ""

@Test
class Test_compare_cases {
    @TestCase
    func test_compareStr_case_01(): Unit {
        var filename = "sm3_string.txt"
        var arr = File.readFrom(filename)
        var arr_str = String.fromUtf8(arr)
        let sm3Instance = SM3()

        var arr_raw = arr_str.split("\r\n")
        for (i in 0..arr_raw.size) {
            var str_raw = arr_raw[i]
            str_1 = str_raw.split(" ")[0]
            var exp_sm = str_raw.split(" ")[1]

            var toArr = str_1.toArray()
            var md: Array<Byte> = digest(sm3Instance, toArr)
            var res_sm = toHexString(md)
            @Expect(res_sm, exp_sm)
            count++
        }
        @Expect(count, 500)
    }
}
