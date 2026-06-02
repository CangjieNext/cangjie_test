/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit1<T> {
    One(TimeUnit2<T>) | Day(T)
}

enum TimeUnit2<T> {
    Two(TimeUnit1<T>) | Day
}

main(): Int64 {
    var time = TimeUnit1<Int32>.One(Two<Int32>(Day<Int32>(3)))
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
