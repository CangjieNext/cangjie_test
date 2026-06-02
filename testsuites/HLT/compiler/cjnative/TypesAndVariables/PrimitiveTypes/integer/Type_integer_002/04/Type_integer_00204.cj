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
    let int8_Low_bound_One: Int8 = -0o200
    let int8_Low_bound_Two: Int8 = -0o177
    let int8_Median_One: Int8 = -0o001
    let int8_Median_Two: Int8 = 0o000
    let int8_Median_Three: Int8 = 0o001
    let int8_Upper_bound_One: Int8 = 0o176
    let int8_Upper_bound_Two: Int8 = 0o177

    if (int8_Low_bound_One != -128) {
        return 1
    }

    if (int8_Low_bound_Two != -127) {
        return 1
    }

    if (int8_Median_One != -1) {
        return 1
    }

    if (int8_Median_Two != 0) {
        return 1
    }

    if (int8_Median_Three != 1) {
        return 1
    }

    if (int8_Upper_bound_One != 126) {
        return 1
    }

    if (int8_Upper_bound_Two != 127) {
        return 1
    }

    return 0
}
