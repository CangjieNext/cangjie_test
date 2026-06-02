/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.math.*

func getLongString(): String {
    var str: String = ""
    var count = 1
    while (count < 400) {
        str = str + "${count}"
        count = count + 1
    }
    str
}

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var longStr = getLongString()
    var a = Int8.tryParse(longStr)
    var b = Int16.tryParse(longStr)
    var c = Int32.tryParse(longStr)
    var d = Int64.tryParse(longStr)
    var e = UInt8.tryParse(longStr)
    var f = UInt16.tryParse(longStr)
    var g = UInt32.tryParse(longStr)
    var h = UInt64.tryParse(longStr)
    var i = Float16.tryParse(longStr)
    var j = Float32.tryParse(longStr)
    var k = Float64.tryParse(longStr)
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

    if (res1 == 0 && res2 == 0 && res3 == 0 && res4 == 0 && res5 == 0 && res6 == 0 && res7 == 0 && res8 == 0 && res9 == Float16
        .Inf && res10 == Float32.Inf && res11 == Float64.Inf) {
        return 0
    }
    return 1
}
