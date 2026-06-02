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
    let int32_Low_bound_One: Int32 = -2147483648
    let int32_Low_bound_Two: Int32 = -2147483647
    let int32_Median_One: Int32 = -1
    let int32_Median_Two: Int32 = 0
    let int32_Median_Three: Int32 = 1
    let int32_Upper_bound_One: Int32 = 2147483646
    let int32_Upper_bound_Two: Int32 = 2147483647

    if (int32_Low_bound_One != -2147483648) {
        return 1
    }

    if (int32_Low_bound_Two != -2147483647) {
        return 1
    }

    if (int32_Median_One != -1) {
        return 1
    }

    if (int32_Median_Two != 0) {
        return 1
    }

    if (int32_Median_Three != 1) {
        return 1
    }

    if (int32_Upper_bound_One != 2147483646) {
        return 1
    }

    if (int32_Upper_bound_Two != 2147483647) {
        return 1
    }
    return 0
}
