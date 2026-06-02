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

struct Data<T> {
    public var time: TimeUnit<T>
    public var day: TimeUnit<T>
    public init(x: T, y: T) {
        time = TimeUnit<T>.Year(x)
        day = TimeUnit<T>.Day(y)
    }
    public func f(x: TimeUnit<T>): TimeUnit<T> {
        return x
    }
}

func run(): Int64 {
    var data: Data<Int64> = Data<Int64>(2, 3)
    var time1 = data.time
    var time2 = data.day
    var time3 = data.f(TimeUnit.Day(4))
    var res1: Int64 = match (time1) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res2: Int64 = match (time2) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res3: Int64 = match (time3) {
        case Year(x) => 2020
        case Day(x) => 16 + x
    }
    if (res1 == 2020 && res2 == 16 && res3 == 20) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
