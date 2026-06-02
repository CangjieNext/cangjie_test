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

enum TimeUnit {
    Year | Month
}

type Time = TimeUnit

main(): Int64 {
    var timeY: Time = TimeUnit.Year
    var timeM: Time = TimeUnit.Month
    var res1: Int32 = match (timeY) {
        case Year => 2020
        case Month => 11
    }
    var res2: Int32 = match (timeM) {
        case Year => 2020
        case Month => 11
    }
    if (res1 == 2020 && res2 == 11) {
        return 0
    }
    return 1
}
