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
    var a = [1E1f16, .1E2f16, 1.0E1f16, 1_E1_f16, .1_E2_f16, 1_.0_E1_f16, 10.0_f16, 10.0E0_f16, 100E-1_f16]

    for (i in a) {
        if (!(i == 10.0 && i is Float16)) {
            return 1
        }
    }

    var b = [.1f16, .1E0f16, .1E0_f16]
    for (i in b) {
        if (!(i == .1 && i is Float16)) {
            return 2
        }
    }

    var c = [-.1f16, -.1E000_0_0_f16, -.1E-0_f16]
    for (i in c) {
        if (!(i == -.1 && i is Float16)) {
            return 3
        }
    }

    // var b = 65504____.0f16
    // var c = 5.97_e-8_f16
    // var d = 65504.0_f16

    // if (!(a == .0000000597 && a is Float16)) {
    // 	return 1
    // }

    // if (!(b == 65504.0 && a is Float16)) {
    // 	return 2
    // }

    // if (!(c == .0000000597 && a is Float16)) {
    // 	return 3
    // }

    // if (!(d == 65504.0 && a is Float16)) {
    // 	return 4
    // }

    return 0
}
