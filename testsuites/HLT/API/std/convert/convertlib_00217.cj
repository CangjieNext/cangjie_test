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

func getResultParse<T>(f: (String) -> Option<T>, arg: String, default: T): T {
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

main(): Int64 {
    var res1 = getResultParse<Float64>(Float64.tryParse, "0b10", 0.0)
    var res2 = getResultParse<Float64>(Float64.tryParse, "0o20", 0.0)
    var res3 = getResultParse<Float64>(Float64.tryParse, "0x40", 0.0)
    if (res1 == 0.0 && res2 == 0.0 && res3 == Float64(0x40)) {
        return 0
    }
    return 1
}
