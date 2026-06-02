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

open class Foo<T> {
    public var dt1: T
    public init(x: T) {
        dt1 = x
    }
}

class Bar <: Foo<Int32> {
    public var dt: Int32 = 23
    public init() {
        super(123)
    }
}

enum Time<T> where T <: Foo<Int32> {
    Day(T)
}

func run(): Int64 {
    let bar: Bar = Bar()
    var time = Time.Day(bar)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 23) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
