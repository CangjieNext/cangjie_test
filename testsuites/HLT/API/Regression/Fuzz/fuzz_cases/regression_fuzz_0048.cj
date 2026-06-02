/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*

let test = {
    =>
    while (return Int64(Float64.tryParse(1.toString()).getOrThrow())) {
        return Int64(Float64.tryParse(2.toString()).getOrThrow())
    }
    return Int64(Float64.tryParse(0.toString()).getOrThrow())
}

main(): Int64 {
    test()
    return Int64(Float64.tryParse(0.toString()).getOrThrow())
}
