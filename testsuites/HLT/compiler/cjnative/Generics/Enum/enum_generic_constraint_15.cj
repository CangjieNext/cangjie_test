/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Foo1<T> {
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

open class Foo2<T> {
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

class Bar1 <: Foo1<Bar1> {
    public var dt: Int32 = 3
    public init() {
        super(Bar1())
    }
}

class Bar2 <: Foo2<Bar2> {
    public var dt: Int32 = 4
    public init() {
        super(Bar2())
    }
}

enum Time<T1, T2> where T1 <: Foo1<T1>, T2 <: Foo2<T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1 = Bar1()
    var bar2: Bar2 = Bar2()
    var time1 = Time<Bar1, Bar2>.Day(bar1)
    var time2 = Time<Bar1, Bar2>.Hour(bar2)
    var res1: Int32 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) => x.dt
    }
    var res2: Int32 = match (time2) {
        case Day(x) => x.dt
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
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_recursive_constructor_call
