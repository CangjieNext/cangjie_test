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
    var int16_Low_bound_One: Int16 = -32768
    var int16_Low_bound_Two: Int16 = -32767
    var int16_Median_One: Int16 = -1
    var int16_Median_Two: Int16 = 0
    var int16_Median_Three: Int16 = 1
    var int16_Upper_bound_One: Int16 = 32766
    var int16_Upper_bound_Two: Int16 = 32767

    if (int16_Low_bound_One != -32768) {
        return 1
    }

    if (int16_Low_bound_Two != -32767) {
        return 1
    }

    if (int16_Median_One != -1) {
        return 1
    }

    if (int16_Median_Two != 0) {
        return 1
    }

    if (int16_Median_Three != 1) {
        return 1
    }

    if (int16_Upper_bound_One != 32766) {
        return 1
    }

    if (int16_Upper_bound_Two != 32767) {
        return 1
    }
    return 0
}
