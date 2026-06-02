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
    var str = "12"
    var a = Int8.tryParse("${str}1")
    var b = Int16.tryParse("${234 + 1}")
    var c = Int32.tryParse("${23 + 4 + 1}")
    var d = Int64.tryParse("${64 ** 2}2784")
    var e = UInt8.tryParse("${234 + 1}")
    var f = UInt16.tryParse("${234 + 1}")
    var g = UInt32.tryParse("${234 + 1}")
    var h = UInt64.tryParse("${234 + 1}")
    var float = 3.124_4646
    var i = Float16.tryParse("${float}")
    var j = Float32.tryParse(".${216}")
    var k = Float64.tryParse("${str}.${str}")
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

    if (res1 == 121 && res2 == 235 && res3 == 28 && res4 == 40962784 && res5 == 235 && res6 == 235 && res7 == 235 &&
        res8 == 235 && res9 == 3.124464_6 && res10 == 0.216 && res11 == 12.12) {
        return 0
    }
    return 1
}
