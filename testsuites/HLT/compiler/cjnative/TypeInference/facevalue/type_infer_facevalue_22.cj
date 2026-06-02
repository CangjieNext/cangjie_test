/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum Time {
    Day | Hour | Min
}

func foo1(x: Int8): Int8 {
    var i: Int8 = 2
    var time1 = Time.Day
    var time2 = Time.Hour
    var time3 = Time.Min
    var tm1 = match (time1) {
        case Day => i
        case Hour => 3 + x
        case Min => 2 + i
    }
    var tm2 = match (time2) {
        case Day => i
        case Hour => 3 + x
        case Min => 2 + i
    }
    var tm3 = match (time3) {
        case Day => i
        case Hour => 3 + x
        case Min => 2 + i
    }
    return tm1 + tm2 + tm3
}

func foo2(x: Float32): Float32 {
    var time1 = Time.Day
    var time2 = Time.Hour
    var time3 = Time.Min
    var tm1 = match (time1) {
        case Day => x
        case Hour => Float32(3.0)
        case Min => 3.0 + x
    }
    var tm2 = match (time2) {
        case Day => x
        case Hour => Float32(3.0)
        case Min => 3.0 + x
    }
    var tm3 = match (time3) {
        case Day => x
        case Hour => Float32(3.0)
        case Min => 3.0 + x
    }
    return tm1 + tm2 + tm3
}

func abs(a: Float32) {
    return match {
        case a >= 0.0 => a
        case _ => -a
    }
}

main(): Int64 {
    var res1: Int8 = foo1(4)
    var res2: Float32 = foo2(3.14)
    print(res1.toString() + "\n")
    print(res2.toString())

    if (res1 != 13 || abs(res2 - 12.28) > 0.000001) {
        return 1
    }
    return 0
}
