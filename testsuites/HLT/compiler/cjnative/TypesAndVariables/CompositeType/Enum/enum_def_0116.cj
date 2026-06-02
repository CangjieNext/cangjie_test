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
    Year(Int32, Float32) | Month(Int32, Float32)
}

func run(): Int64 {
    var time = TimeUnit.Year(2020, 20.2)
    var res: Float32 = match (time) {
        case Year(x, y) => y
        case Month(m, n) => n + 1.0
    }

    if (res == 20.2) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
