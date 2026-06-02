/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a1 = Month(1) {x: Int64 => x + 1}
    if (foo(a1) != 1) {
        return 1
    }
    var a2 = Month(1, {x: Int64 => x + 1})
    if (foo(a2) != 1) {
        return 1
    }
    var a3 = Day {x: Int64 => x + 1}
    if (foo(a3) != 2) {
        return 1
    }
    return 0
}

enum TimeUnit {
    Year(Int64)
    | Month(Int64, (Int64) -> Int64)
    | Day((Int64) -> Int64)
    | Hour(Int64, (Int64) -> Int64, Int64)
}

func foo(input: TimeUnit): Int64 {
    return match (input) {
        case Year(x) => 0
        case Month(x, y) => 1
        case Day(x) => 2
        case Hour(x, y, z) => 3
        case _ => 10
    }
}
