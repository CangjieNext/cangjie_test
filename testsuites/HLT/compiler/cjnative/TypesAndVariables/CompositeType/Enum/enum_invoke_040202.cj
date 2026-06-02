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
    Year(Int32)
}

enum TimeUnit2 {
    Year(Int32)
}

func run(): Int64 {
    var time1 = TimeUnit1.Year(2020)
    var time2 = TimeUnit2.Year(2022)
    var res: Int32 = match (time1) {
        case Year(x) => x
    }
    res = match (time2) {
        case Year(x) => x
    }

    if (res == 2022) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
