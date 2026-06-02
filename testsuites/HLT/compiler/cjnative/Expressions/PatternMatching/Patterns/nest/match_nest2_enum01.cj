/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

var r1 = match (Year(1.0)) {
    case Year(a) => a - 1.0
    case _ => Float32(1.0)
}
var r2 = match (Year(1.0)) {
    case Year(_) => 0
    case _ => 1
}
let a2: Float32 = 1.0
let a0: Float32 = 0.0
var r3 = match (Year(1.0)) {
    case Year(2.0) => 3
    case Year(1.0) | Year(2.0) where (false) => 7
    case Year(1.0) | Year(2.0) where (true) => 0
    case _ => 1
}

main(): Int64 {
    if (r1 != 0.0) {
        return 1
    }
    if (r2 != 0) {
        return 2
    }
    if (r3 != 0) {
        return 3
    }
    return 0
}
