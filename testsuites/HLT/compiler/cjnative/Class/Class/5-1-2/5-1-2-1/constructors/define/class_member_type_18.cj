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

enum TimeUnit {
    Day(Int32)
}

class Test {
    public var time1: TimeUnit = TimeUnit.Day(1)
    public var time2: TimeUnit
    public init(x: TimeUnit) {
        time2 = x
    }
    public func f(x: TimeUnit): TimeUnit {
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(TimeUnit.Day(2))
    var time1: TimeUnit = test.time1
    var time2: TimeUnit = test.time2
    var time3: TimeUnit = test.f(TimeUnit.Day(4))
    var res1: Int32 = match (time1) {
        case Day(1) => 2
        case _ => 0
    }
    var res2: Int32 = match (time2) {
        case Day(2) => 4
        case _ => 0
    }
    var res3: Int32 = match (time3) {
        case Day(3) => 5
        case _ => 0
    }
    if (res1 == 2 && res2 == 4 && res3 == 0) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
