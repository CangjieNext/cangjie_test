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
    var uint64_Low_bound_One: UInt64 = 0
    var uint64_Low_bound_Two: UInt64 = 1
    var uint64_Median_One: UInt64 = 9223372036854775807
    var uint64_Median_Two: UInt64 = 9223372036854775808
    var uint64_Median_Three: UInt64 = 9223372036854775809
    var uint64_Upper_bound_One: UInt64 = 18446744073709551614
    var uint64_Upper_bound_Two: UInt64 = 18446744073709551615

    if (uint64_Low_bound_One != 0) {
        return 1
    }

    if (uint64_Low_bound_Two != 1) {
        return 1
    }

    if (uint64_Median_One != 9223372036854775807) {
        return 1
    }

    if (uint64_Median_Two != 9223372036854775808) {
        return 1
    }

    if (uint64_Median_Three != 9223372036854775809) {
        return 1
    }

    if (uint64_Upper_bound_One != 18446744073709551614) {
        return 1
    }

    if (uint64_Upper_bound_Two != 18446744073709551615) {
        return 1
    }
    return 0
}
