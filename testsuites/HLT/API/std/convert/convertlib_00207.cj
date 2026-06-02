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
    var str = #"1.23"#
    var parse8 = Int8.tryParse(str)
    var res1 = matchResult<Int8>(parse8, 0)
    var res2 = getResultParse<UInt64>(UInt64.tryParse, "-3.1415926", 0)
    var res3 = getResultParse<UInt32>(UInt32.tryParse, "3.1415926", 0)
    var res4 = getResultParse<Float64>(Float64.tryParse, "789456123", 0.0)
    var res5 = getResultParse<Float64>(Float64.tryParse, "\n", 0.0)

    if (res1 == 0 && res2 == 0 && res3 == 0 && res4 == Float64(789456123)) {
        return 0
    }
    return 1
}
