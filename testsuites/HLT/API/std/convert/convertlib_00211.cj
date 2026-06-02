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
    var str = "1" + "2" + "6"
    var a = Int8.tryParse("-1" + "2" + "3")
    var b = Int16.tryParse(str)
    var c = Int32.tryParse("3" + "2")
    var d = Int64.tryParse("6" + "4")
    var e = UInt8.tryParse("2" + "5" + "4")
    var f = UInt16.tryParse("1" + "6")
    var g = UInt32.tryParse("4" + "3")
    var h = UInt64.tryParse("6" + "4")
    var i = Float16.tryParse("3" + ".1" + "24" + "4646")
    var j = Float32.tryParse("." + "3545464")
    var k = Float64.tryParse("124" + "." + "2214")
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
    if (res1 == -123 && res2 == 126 && res3 == 32 && res4 == 64 && res5 == 254 && res6 == 16 && res7 == 43 && res8 == 64 &&
        res9 == 3.1244646 && res10 == 0.3545464 && res11 == 124.2214) {
        return 0
    }
    return 1
}
