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

open class Foo1 {
    public var dt1 = 2
}

class Bar1 <: Foo1 {
    public var dt = 4
}

enum Time<T1, T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1 = Bar1()
    var time1 = Time<Bar1, Unit>.Day(bar1)
    var time2 = Time<Unit, Int64>.Hour(6)
    var res1 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => 1
    }
    var res2 = match (time2) {
        case Day(x) => 1
        case Hour(x) => x
    }
    if (res1 == 4 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
