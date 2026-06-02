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
    Year(T)
    | Month(T, T)
    | TwoUnit(TimeUnit<T>, TimeUnit<T>)
}

func run(): Int64 {
    var time = TimeUnit<Int32>.TwoUnit(TimeUnit<Int32>.Year(2020), TimeUnit<Int32>.Month(9, 19))
    var res: Int32 = match (time) {
        case Year(x) => x
        case Month(x, y) => x + y
        case TwoUnit(Year(x), Month(y, z)) => x + y + z
        case _ => 0
    }

    if (res == 2048) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
