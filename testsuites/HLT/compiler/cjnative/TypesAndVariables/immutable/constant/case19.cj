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
    Year | Month | Day | Hour
}

main(): Int64 {
    const x = TimeUnit.Day
    const s: String = match (x) {
        case Year => "Year"
        case Month | Day => "Month"
        case Hour => "Hour"
        case _ => "xxx"
    }
    if (s != "Month") {
        return 1
    }
    0
}
