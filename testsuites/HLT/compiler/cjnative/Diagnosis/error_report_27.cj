/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Foo {
    public var dt: Int32 = 3
}

class Bar<T> <: Foo {
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

class Data<T1> where T1 <: Bar<Int32> {
    public var classFoo: T1
    public init(x: T1) {
        classFoo = x
    }
}

main(): Int64 {
    let foo: Foo = Foo()
    let data = Data<Foo>(foo)
    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_generic_type_argument_not_match_constraint
