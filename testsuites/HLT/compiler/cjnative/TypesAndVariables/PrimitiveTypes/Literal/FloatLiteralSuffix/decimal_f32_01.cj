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
    var a = .14e-45f32
    var b = 3.40282e38f32
    var c = .14e-45_____________f32
    var d = 3.40282e38_____________f32

    if (!(a == .14e-45 && a is Float32)) {
        return 1
    }

    if (!(b == 3.40282e38 && a is Float32)) {
        return 2
    }

    if (!(c == .14e-45 && a is Float32)) {
        return 3
    }

    if (!(d == 3.40282e38 && a is Float32)) {
        return 4
    }

    return 0
}
