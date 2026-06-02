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
    var int32_var_A: Int32 = 3_2767
    var int32_var_B: Int32 = 32_767
    var int32_var_C: Int32 = 327_67
    var int32_var_D: Int32 = 3276_7
    var int32_var_E: Int32 = 32767_
    var int32_var_F: Int32 = -3_2768
    var int32_var_G: Int32 = -32_768
    var int32_var_H: Int32 = -327_68
    var int32_var_I: Int32 = -3276_8
    var int32_var_J: Int32 = -32768_

    if (int32_var_A != 32767) {
        return 1
    }

    if (int32_var_B != 32767) {
        return 1
    }

    if (int32_var_C != 32767) {
        return 1
    }

    if (int32_var_D != 32767) {
        return 1
    }

    if (int32_var_E != 32767) {
        return 1
    }

    if (int32_var_F != -32768) {
        return 1
    }

    if (int32_var_G != -32768) {
        return 1
    }

    if (int32_var_H != -32768) {
        return 1
    }

    if (int32_var_I != -32768) {
        return 1
    }

    if (int32_var_J != -32768) {
        return 1
    }

    return 0
}
