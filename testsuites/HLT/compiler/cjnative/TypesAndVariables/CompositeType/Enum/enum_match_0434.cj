/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Hour(Int32)
    | Day(Int32, Int32)
    | Month(Int32, Int32)
}

func run(): Int64 {
    var time = TimeUnit.Month(2020, 2022)
    var res: Int32 = match (time) {
        case Hour(x) => x - 1
        case Day(x, y) => y - x
        case Month(x, y) => x + y
    }

    if (res == 4042) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
