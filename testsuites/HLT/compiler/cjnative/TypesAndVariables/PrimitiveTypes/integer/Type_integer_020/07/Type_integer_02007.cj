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
    let int32_let_A: Int32 = 3__2767
    let int32_let_B: Int32 = 32___767
    let int32_let_C: Int32 = 327__67
    let int32_let_D: Int32 = 3276_____7
    let int32_let_E: Int32 = 32767_____

    if (int32_let_A != 32767) {
        return 1
    }

    if (int32_let_B != 32767) {
        return 1
    }

    if (int32_let_C != 32767) {
        return 1
    }

    if (int32_let_D != 32767) {
        return 1
    }

    if (int32_let_E != 32767) {
        return 1
    }

    let int32_let_F: Int32 = -3____2768
    let int32_let_G: Int32 = -32____768
    let int32_let_H: Int32 = -327___68
    let int32_let_I: Int32 = -3276__8
    let int32_let_J: Int32 = -32768__

    if (int32_let_F != -32768) {
        return 1
    }

    if (int32_let_G != -32768) {
        return 1
    }

    if (int32_let_H != -32768) {
        return 1
    }

    if (int32_let_I != -32768) {
        return 1
    }

    if (int32_let_J != -32768) {
        return 1
    }

    return 0
}
