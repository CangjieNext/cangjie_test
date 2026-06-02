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
    var uint16_Low_bound_One: UInt16 = 0
    var uint16_Low_bound_Two: UInt16 = 1
    var uint16_Median_One: UInt16 = 32766
    var uint16_Median_Two: UInt16 = 32767
    var uint16_Median_Three: UInt16 = 32768
    var uint16_Upper_bound_One: UInt16 = 65534
    var uint16_Upper_bound_Two: UInt16 = 65535

    if (uint16_Low_bound_One != 0) {
        return 1
    }

    if (uint16_Low_bound_Two != 1) {
        return 1
    }

    if (uint16_Median_One != 32766) {
        return 1
    }

    if (uint16_Median_Two != 32767) {
        return 1
    }

    if (uint16_Median_Three != 32768) {
        return 1
    }

    if (uint16_Upper_bound_One != 65534) {
        return 1
    }

    if (uint16_Upper_bound_Two != 65535) {
        return 1
    }
    return 0
}
