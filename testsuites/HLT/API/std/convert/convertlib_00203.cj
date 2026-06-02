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
    var str1 = "-hello"
    var parse8 = Int8.tryParse(str1)
    var parse8_1 = Int8.tryParse("hello")

    var res1 = matchResult<Int8>(parse8, 0)
    var res2 = getResultParse<Int16>(Int16.tryParse, "hello", 0)
    var res3 = getResultParse<Int32>(Int32.tryParse, "hi", 0)
    var res4 = getResultParse<Int64>(Int64.tryParse, "char", 0)
    var res5 = getResultParse<UInt8>(UInt8.tryParse, "UInt8", 0)
    var res6 = getResultParse<UInt16>(UInt16.tryParse, "UInt16.tryParse", 0)
    var res7 = getResultParse<UInt32>(UInt32.tryParse, "world", 0)
    var res8 = getResultParse<UInt64>(UInt64.tryParse, "float", 0)
    var res9 = getResultParse<Float16>(Float16.tryParse, "float", 0.0)
    var res10 = getResultParse<Float32>(Float32.tryParse, "float", 0.0)
    var res11 = getResultParse<Float64>(Float64.tryParse, "float", 0.0)
    if (res1 == 0 && res2 == 0 && res3 == 0 && res4 == 0 && res5 == 0 && res6 == 0 && res7 == 0 && res8 == 0 && res9 ==
        0.0 && res10 == 0.0 && res11 == 0.0) {
        return 0
    }
    return 1
}
