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
    var a = Int8.tryParse("-(-124)")
    var b = Int16.tryParse("str")
    var c = Int32.tryParse("32+1")
    var d = Int64.tryParse("64-1")
    var e = UInt8.tryParse("254/34")
    var f = UInt16.tryParse("16*12")
    var g = UInt32.tryParse("43%2")
    var h = UInt64.tryParse("64+343")
    var i = Float16.tryParse("3.124_4646-3")
    var j = Float32.tryParse(".3545464+1")
    var k = Float64.tryParse("124...2214")
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

    if (res1 == 0 && res2 == 0 && res3 == 0 && res4 == 0 && res5 == 0 && res6 == 0 && res7 == 0 && res8 == 0 && res9 ==
        0.0 && res10 == 0.0 && res11 == 0.0) {
        return 0
    }

    return 1
}
