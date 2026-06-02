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
    var res9 = getResultParse<Float16>(Float16.tryParse, "-0O1777", 0.0)
    var res9_1 = getResultParse<Float16>(Float16.tryParse, ".123e2", 0.0)
    var res9_2 = getResultParse<Float16>(Float16.tryParse, "0x1.1p0", 0.0)
    var res10 = getResultParse<Float32>(Float32.tryParse, "-0x1p2", 0.0)
    var res10_1 = getResultParse<Float32>(Float32.tryParse, "0x.2p4", 0.0)
    var res10_2 = getResultParse<Float32>(Float32.tryParse, "2e3", 0.0)
    var res11 = getResultParse<Float64>(Float64.tryParse, "-2.4e-1", 0.0)
    var res11_1 = getResultParse<Float64>(Float64.tryParse, "2.24e-308", 0.0)
    var res11_2 = getResultParse<Float64>(Float64.tryParse, "1.79e308", 0.0)

    if (res9 != 0.000000) {
        return 1
    }
    if (res9_1 != .123e2) {
        return 1
    }
    if (res9_2 != 0x1.1p0) {
        return 1
    }
    if (res10 != -0x1p2) {
        return 1
    }
    if (res10_1 != 0x.2p4) {
        return 1
    }
    if (res10_2 != 2e3) {
        return 1
    }
    if (res11 != -2.4e-1) {
        return 1
    }
    if (res11_1 != 2.24e-308) {
        return 1
    }
    if (res11_2 != 1.79e308) {
        return 1
    }

    return 0
}
