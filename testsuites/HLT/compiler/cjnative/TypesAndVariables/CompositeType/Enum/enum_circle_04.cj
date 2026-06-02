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

enum TimeUnit1 {
    One(TimeUnit2) | Day(Int32)
}

enum TimeUnit2 {
    Two(TimeUnit1) | Day
}

main(): Int64 {
    var time = TimeUnit1.One(Two(Day(3)))
    var res: Int32 = match (time) {
        case One(Two(Day(x))) => x + 2
        case Day(x) => x * 2
        case _ => 5
    }

    if (res == 5) {
        return 0
    }
    return 1
}
