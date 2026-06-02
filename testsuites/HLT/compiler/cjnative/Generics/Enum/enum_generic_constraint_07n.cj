/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Foo {
    public var dt: Int32 = 3
}

class Bar<T> <: Foo {
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

enum Time<T> where T <: Bar<Int32> {
    Day(T)
}

func run(): Int32 {
    var foo: Foo = Foo()
    var time = Time<Foo>.Day(foo)
    var res: Int32 = match (time) {
        case Day(x) => x.dt
    }
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int32 {
    return run()
}
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_generic_type_argument_not_match_constraint
