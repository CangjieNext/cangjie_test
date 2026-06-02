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

enum TimeUnit<T> {
    Day(T)
}

func run(time: TimeUnit<Int32>): Int64 {
    var time1 = time
    var res: Int32 = match (time1) {
        case Day(x) => x + 1
    }

    if (res == 3) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run(TimeUnit<Int32>.Day(2))
}
