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
    var str1 = "-128"
    var parse8 = Int8.tryParse(str1)
    var parse8_1 = Int8.tryParse("127")

    var res1 = matchResult<Int8>(parse8, 0)
    var res1_1 = matchResult<Int8>(parse8_1, 0)
    var res2 = getResultParse<Int16>(Int16.tryParse, "32767", 0)
    var res2_1 = getResultParse<Int16>(Int16.tryParse, "-32768", 0)
    var res3 = getResultParse<Int32>(Int32.tryParse, "-2147483648", 0)
    var res3_1 = getResultParse<Int32>(Int32.tryParse, "2147483647", 0)
    var res4 = getResultParse<Int64>(Int64.tryParse, "-9223372036854775808", 0)
    var res4_1 = getResultParse<Int64>(Int64.tryParse, "9223372036854775807", 0)
    var res5 = getResultParse<UInt8>(UInt8.tryParse, "255", 0)
    var res5_1 = getResultParse<UInt8>(UInt8.tryParse, "0", 0)
    var res6 = getResultParse<UInt16>(UInt16.tryParse, "65535", 0)
    var res6_1 = getResultParse<UInt16>(UInt16.tryParse, "0", 0)
    var res7 = getResultParse<UInt32>(UInt32.tryParse, "4294967295", 0)
    var res7_1 = getResultParse<UInt32>(UInt32.tryParse, "0", 0)
    var res8 = getResultParse<UInt64>(UInt64.tryParse, "18446744073709551615", 0)
    var res8_1 = getResultParse<UInt64>(UInt64.tryParse, "0", 0)

    if (res1 != -128) {
        return 1
    }
    if (res1_1 != 127) {
        return 1
    }
    if (res2 != 32767) {
        return 1
    }
    if (res2_1 != -32768) {
        return 1
    }
    if (res3 != -2147483648) {
        return 1
    }
    if (res3_1 != 2147483647) {
        return 1
    }
    if (res4 != -9223372036854775808) {
        return 1
    }
    if (res4_1 != 9223372036854775807) {
        return 1
    }
    if (res5 != 255) {
        return 1
    }
    if (res5_1 != 0) {
        return 1
    }
    if (res6 != 65535) {
        return 1
    }
    if (res6_1 != 0) {
        return 1
    }
    if (res7 != 4294967295) {
        return 1
    }
    if (res7_1 != 0) {
        return 1
    }
    if (res8 != 18446744073709551615) {
        return 1
    }
    if (res8_1 != 0) {
        return 1
    }

    return 0
}
