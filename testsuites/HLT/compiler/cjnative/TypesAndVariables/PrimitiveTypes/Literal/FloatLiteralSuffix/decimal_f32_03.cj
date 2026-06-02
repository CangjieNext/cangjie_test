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
    var a = [1E1f32, .1E2f32, 1.0E1f32, 1_E1_f32, .1_E2_f32, 1_.0_E1_f32, 10.0_f32, 10.0E0_f32, 100E-1_f32]

    for (i in a) {
        if (!(i == 10.0 && i is Float32)) {
            return 1
        }
    }

    var b = [.1f32, .1E0f32, .1E0_f32]
    for (i in b) {
        if (!(i == .1 && i is Float32)) {
            return 2
        }
    }

    var c = [-.1f32, -.1E000_0_0_f32, -.1E-0_f32]
    for (i in c) {
        if (!(i == -.1 && i is Float32)) {
            return 3
        }
    }

    return 0
}
