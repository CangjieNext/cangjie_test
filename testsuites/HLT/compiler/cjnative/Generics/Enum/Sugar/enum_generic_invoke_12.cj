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

func run(): Int64 {
    var getTime: () -> Int64 = {
        =>
        var time1 = TimeUnit.Year(4)
        var time2 = Day(3)
        var year = match (time1) {
            case Year(x) => 2020 - x
            case Day(x) => 17 + x
        }
        var day = match (time2) {
            case Year(x) => 2020 + x
            case Day(x) => 17 - x
        }
        return year + day
    }
    var res = getTime()
    if (res == 2030) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
