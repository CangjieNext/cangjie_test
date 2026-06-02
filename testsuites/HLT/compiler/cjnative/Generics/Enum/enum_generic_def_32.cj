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

enum TimeUnit<T1, T2, T3> {
    Year(T1) | Month(T2) | Day(T3)
}

func run(): Int64 {
    var year = TimeUnit<Int32, Float64, String>.Year(4)
    var month = TimeUnit<Int32, Float64, String>.Month(9.0)
    var day = TimeUnit<Int32, Float64, String>.Day("星期三")
    var res1: Int32 = match (year) {
        case Year(x) => 2020
        case Month(x) => 9
        case Day(x) => 16
    }
    var res2: Float64 = match (month) {
        case Year(x) => 2020.0
        case Month(x) => 9.0
        case Day(x) => 9.0
    }
    var res3: String = match (day) {
        case Year(x) => "2020"
        case Month(x) => "9"
        case Day(x) => "16"
    }
    if (res1 == 2020 && res2 == 9.0 && res3 == "16") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
