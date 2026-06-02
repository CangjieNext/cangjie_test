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
    var a = [1E1f64, .1E2f64, 1.0E1f64, 1_E1_f64, .1_E2_f64, 1_.0_E1_f64, 10.0_f64, 10.0E0_f64, 100E-1_f64]

    for (i in a) {
        if (!(i == 10.0 && i is Float64)) {
            return 1
        }
    }

    var b = [.1f64, .1E0f64, .1E0_f64]
    for (i in b) {
        if (!(i == .1 && i is Float64)) {
            return 2
        }
    }

    var c = [-.1f64, -.1E000_0_0_f64, -.1E-0_f64]
    for (i in c) {
        if (!(i == -.1 && i is Float64)) {
            return 3
        }
    }

    return 0
}
