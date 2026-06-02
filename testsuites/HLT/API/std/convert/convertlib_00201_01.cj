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
    var res9 = getResultParse<Float16>(Float16.tryParse, "-65504.0", 0.1)
    var res9_1 = getResultParse<Float16>(Float16.tryParse, "6.104e-5", 0.1)
    var res9_2 = getResultParse<Float16>(Float16.tryParse, "65504.0", 0.1)
    var res10 = getResultParse<Float32>(Float32.tryParse, "-3.4e38", 0.1)
    var res10_1 = getResultParse<Float32>(Float32.tryParse, "1.18e-38", 0.1)
    var res10_2 = getResultParse<Float32>(Float32.tryParse, "3.4e38", 0.1)
    var res11 = getResultParse<Float64>(Float64.tryParse, "-1.79e308", 0.1)
    var res11_1 = getResultParse<Float64>(Float64.tryParse, "2.23e-308", 0.1)
    var is_in_result11_1: Bool = 2.23e-308 - res11_1 < 0.00000001
    var res11_2 = getResultParse<Float64>(Float64.tryParse, "1.79e308", 0.1)

    if (res9 != -65504.0) {
        return 1
    }
    if (res9_1 != 6.104e-5) {
        return 1
    }
    if (res9_2 != 65504.0) {
        return 1
    }
    if (res10 != -3.4e38) {
        return 1
    }
    if (res10_1 != 1.18e-38) {
        return 1
    }
    if (res10_2 != 3.4e38) {
        return 1
    }
    if (res11 != -1.79e308) {
        return 1
    }
    if (!is_in_result11_1) {
        return 1
    }
    if (res11_2 != 1.79e308) {
        return 1
    }

    return 0
}
