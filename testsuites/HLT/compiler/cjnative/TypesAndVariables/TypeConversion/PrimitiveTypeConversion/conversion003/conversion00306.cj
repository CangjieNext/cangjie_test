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

main(): Int64 {
    var a: Float32 = -2.2
    var aa: Float32 = 2.2
    var b: Float64 = Float64(a)
    var bb: Float64 = Float64(aa)
    var c: Float64 = -2.2
    var cc: Float64 = 2.2

    if ((bb - cc < 0.00001) && (b - c < 0.00001)) {
        return 0
    }
    return 1
}
