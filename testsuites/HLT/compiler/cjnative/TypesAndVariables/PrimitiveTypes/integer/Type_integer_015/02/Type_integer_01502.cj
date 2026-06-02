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
    let uint32_Low_bound_One: UInt32 = 0
    let uint32_Low_bound_Two: UInt32 = 1
    let uint32_Median_One: UInt32 = 2147483647
    let uint32_Median_Two: UInt32 = 2147483648
    let uint32_Median_Three: UInt32 = 2147483649
    let uint32_Upper_bound_One: UInt32 = 4294967294
    let uint32_Upper_bound_Two: UInt32 = 4294967295

    if (uint32_Low_bound_One != 0) {
        return 1
    }

    if (uint32_Low_bound_Two != 1) {
        return 1
    }

    if (uint32_Median_One != 2147483647) {
        return 1
    }

    if (uint32_Median_Two != 2147483648) {
        return 1
    }

    if (uint32_Median_Three != 2147483649) {
        return 1
    }

    if (uint32_Upper_bound_One != 4294967294) {
        return 1
    }

    if (uint32_Upper_bound_Two != 4294967295) {
        return 1
    }
    return 0
}
