/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*

func getResultParse<T>(f: (String) -> Option<T>, arg: String, default: T): T {
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var str1 = "-0o200"
    var parse8 = Int8.tryParse(str1)
    var parse8_1 = Int8.tryParse("0b1111111")

    var res1 = matchResult<Int8>(parse8, 0)
    var res1_1 = matchResult<Int8>(parse8_1, 0)
    var res2 = getResultParse<Int16>(Int16.tryParse, "0B111111111111111", 0)
    var res2_1 = getResultParse<Int16>(Int16.tryParse, "-0X8000", 0)
    var res3 = getResultParse<Int32>(Int32.tryParse, "-0x80000000", 0)
    var res3_1 = getResultParse<Int32>(Int32.tryParse, "0O17777777777", 0)
    var res4 = getResultParse<Int64>(Int64.tryParse,
        "-0b1000000000000000000000000000000000000000000000000000000000000000", 0)
    var res4_1 = getResultParse<Int64>(Int64.tryParse, "0x7fffffffffffffff", 0)
    var res5 = getResultParse<UInt8>(UInt8.tryParse, "0o377", 0)
    var res5_1 = getResultParse<UInt8>(UInt8.tryParse, "0x0", 0)
    var res6 = getResultParse<UInt16>(UInt16.tryParse, "65535", 0)
    var res6_1 = getResultParse<UInt16>(UInt16.tryParse, "0o0", 0)
    var res7 = getResultParse<UInt32>(UInt32.tryParse, "4294967295", 0)
    var res7_1 = getResultParse<UInt32>(UInt32.tryParse, "0b0", 0)
    var res8 = getResultParse<UInt64>(UInt64.tryParse, "0Xffffffffffffffff", 0)
    var res8_1 = getResultParse<UInt64>(UInt64.tryParse, "0B0", 0)

    if (res1 != -0o200) {
        return 1
    }
    if (res1_1 != 0b1111111) {
        return 2
    }
    if (res2 != 0B111111111111111) {
        return 3
    }
    if (res2_1 != -0X8000) {
        return 4
    }
    if (res3 != -0x80000000) {
        return 5
    }
    if (res3_1 != 0O17777777777) {
        return 6
    }
    if (res4 != -0b1000000000000000000000000000000000000000000000000000000000000000) {
        return 7
    }
    if (res4_1 != 0x7fffffffffffffff) {
        return 8
    }
    if (res5 != 0o377) {
        return 9
    }
    if (res5_1 != 0x0) {
        return 10
    }
    if (res6 != 65535) {
        return 11
    }
    if (res6_1 != 0o0) {
        return 12
    }
    if (res7 != 4294967295) {
        return 13
    }
    if (res7_1 != 0b0) {
        return 14
    }
    if (res8 != 0Xffffffffffffffff) {
        return 15
    }
    if (res8_1 != 0B0) {
        return 16
    }

    return 0
}
