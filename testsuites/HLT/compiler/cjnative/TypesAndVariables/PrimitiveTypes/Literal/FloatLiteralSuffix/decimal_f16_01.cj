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
    var a = .0000000597f16
    var b = 65504____.0f16
    var c = 5.97_e-8_f16
    var d = 65504.0_f16

    if (!(a == .0000000597 && a is Float16)) {
        return 1
    }

    if (!(b == 65504.0 && a is Float16)) {
        return 2
    }

    if (!(c == .0000000597 && a is Float16)) {
        return 3
    }

    if (!(d == 65504.0 && a is Float16)) {
        return 4
    }

    return 0
}
