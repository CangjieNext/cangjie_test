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
    var uint8_Low_bound_One: UInt8 = 0
    var uint8_Low_bound_Two: UInt8 = 1
    var uint8_Median_One: UInt8 = 127
    var uint8_Median_Two: UInt8 = 128
    var uint8_Median_Three: UInt8 = 129
    var uint8_Upper_bound_One: UInt8 = 254
    var uint8_Upper_bound_Two: UInt8 = 255

    if (uint8_Low_bound_One != 0) {
        return 1
    }

    if (uint8_Low_bound_Two != 1) {
        return 1
    }

    if (uint8_Median_One != 127) {
        return 1
    }

    if (uint8_Median_Two != 128) {
        return 1
    }

    if (uint8_Median_Three != 129) {
        return 1
    }

    if (uint8_Upper_bound_One != 254) {
        return 1
    }

    if (uint8_Upper_bound_Two != 255) {
        return 1
    }
    return 0
}
