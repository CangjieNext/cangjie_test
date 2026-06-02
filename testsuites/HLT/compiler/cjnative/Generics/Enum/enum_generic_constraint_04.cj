/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Foo<T> {
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

class Bar <: Foo<Bar> {
    public var dt: Int32 = 23
    public init() {
        super(Bar())
    }
}

enum Time<T> where T <: Foo<T> {
    Day(T)
}

func run(): Int64 {
    let bar: Bar = Bar()
    var time = Time<Bar>.Day(bar)
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
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_recursive_constructor_call
