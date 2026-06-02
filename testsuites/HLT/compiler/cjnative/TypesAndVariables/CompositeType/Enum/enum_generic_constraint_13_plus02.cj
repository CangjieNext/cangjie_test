/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Foo1 {
    public var dt: Int32 = 2
}

open class Foo2 {
    public var dt: Int32 = 3
}

class Bar1 <: Foo1 {
    public var dt: Int32 = 4
}

class Bar2 <: Foo2 {
    public var dt: Int32 = 5
}

enum Time<T1, T2> where T1 <: Foo1 {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var bar1: Bar1 = Bar1()
    var bar2: Bar2 = Bar2()
    // update: can not infer T2 is Unit.
    // Enum此处推导的类型是Time<Bar1,Unit>.Day(bar1)这里的unit刚好跟定义处的T2<:Unit契合
    var time1 = Time.Day(bar1)
    var res1: Int32 = match (time1) {
        case Day(x) => x.dt
        case Hour(x) =>
            if (x != ()) {
                x.dt
            } else {
                0
            }
    }
    if (res1 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_unable_to_infer_generic_func
// ASSERT: scan sema_member_variable_can_not_shadow
