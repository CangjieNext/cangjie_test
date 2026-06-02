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
    Year(T) | Day(T)
}

func foo(): Int32 {
    var time = TimeUnit.Year(3)
    var day = Day(4)
    var res1: Int32 = match (time) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res2: Int32 = match (day) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    return res1 + res2
}

func run(): Int64 {
    var res = foo()
    if (res == 2036) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
