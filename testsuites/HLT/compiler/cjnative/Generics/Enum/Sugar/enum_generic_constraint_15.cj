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

open class Foo1<T> {
    public var dt1: T
    public init(x: T) {
        dt1 = x
    }
}

open class Foo2<T> {
    public var dt2: T
    public init(x: T) {
        dt2 = x
    }
}

class Bar1 <: Foo1<String> {
    public var dt = 3
    public init() {
        super("abc")
    }
}

class Bar2 <: Foo2<Rune> {
    public var dt = 4
    public init() {
        super(r'a')
    }
}

enum Time<T1, T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1 = Bar1()
    var bar2: Bar2 = Bar2()
    var time1 = Time<Bar1, Unit>.Day(bar1)
    var time2 = Time<Unit, Bar2>.Hour(bar2)
    var res1 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => 1
    }
    var res2 = match (time2) {
        case Day(x) => 1
        case Hour(x) => x.dt
    }
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
