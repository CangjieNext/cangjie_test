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
    Year(Int32, Int32) | Month(Int32, Int32) | Day(Int32, Int32)
}

func run(): Int64 {
    var time = TimeUnit.Day(2020, 2020)
    var res: Int32 = match (time) {
        case Year(x, y) => x * y
        case Month(m, n) => m - n
        case Day(m, n) => m + n
    }

    if (res == 4040) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
