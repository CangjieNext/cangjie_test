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
    var int64_Low_bound_One: Int64 = -9223372036854775808
    var int64_Low_bound_Two: Int64 = -9223372036854775807
    var int64_Median_One: Int64 = -1
    var int64_Median_Two: Int64 = 0
    var int64_Median_Three: Int64 = 1
    var int64_Upper_bound_One: Int64 = 9223372036854775806
    var int64_Upper_bound_Two: Int64 = 9223372036854775807

    if (int64_Low_bound_One != -9223372036854775808) {
        return 1
    }

    if (int64_Low_bound_Two != -9223372036854775807) {
        return 1
    }

    if (int64_Median_One != -1) {
        return 1
    }

    if (int64_Median_Two != 0) {
        return 1
    }

    if (int64_Median_Three != 1) {
        return 1
    }

    if (int64_Upper_bound_One != 9223372036854775806) {
        return 1
    }

    if (int64_Upper_bound_Two != 9223372036854775807) {
        return 1
    }
    return 0
}
