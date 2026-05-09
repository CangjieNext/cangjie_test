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

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var str = "126"
    var a = Int8.tryParse("-50")
    var b = Int16.tryParse(str)
    var c = Int32.tryParse("-3____2_")
    var d = Int64.tryParse("-_6_4_")
    var e = UInt8.tryParse("_2_5_4")
    var f = UInt16.tryParse("16_")
    var g = UInt32.tryParse("43_")
    var h = UInt64.tryParse("--64_")
    var i = Float16.tryParse("-3_.1_24_46_46")
    var j = Float32.tryParse("-.35_45464")
    var k = Float64.tryParse("-1_24.22___14___")
    var res1 = matchResult<Int8>(a, 0)
    var res2 = matchResult<Int16>(b, 0)
    var res3 = matchResult<Int32>(c, 0)
    var res4 = matchResult<Int64>(d, 0)
    var res5 = matchResult<UInt8>(e, 0)
    var res6 = matchResult<UInt16>(f, 0)
    var res7 = matchResult<UInt32>(g, 0)
    var res8 = matchResult<UInt64>(h, 0)
    var res9 = matchResult<Float16>(i, 0.0)
    var res10 = matchResult<Float32>(j, 0.0)
    var res11 = matchResult<Float64>(k, 0.0)

    if (res1 != -50) {
        return 1
    }
    if (res2 != 126) {
        return 2
    }
    if (res3 != 0) {
        return 3
    }
    if (res4 != 0) {
        return 4
    }
    if (res5 != 0) {
        return 5
    }
    if (res6 != 0) {
        return 6
    }
    if (res7 != 0) {
        return 7
    }
    if (res8 != 0) {
        return 8
    }
    if (res9 != Float16(0.0)) {
        return 9
    }
    if (res10 != Float32(0.0)) {
        return 10
    }
    if (res11 != Float64(0.0)) {
        return 11
    }
    return 0
}
