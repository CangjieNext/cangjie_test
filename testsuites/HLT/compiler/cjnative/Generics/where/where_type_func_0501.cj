/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Aoo<T> where T <: () -> A {
    public var a: T
    public init(x: T) {
        a = x
    }
}

func foo(): A {
    return A()
}

func goo(): B {
    return B()
}

open class A {
    public var a: Int64 = 1
}

class B <: A {
    public var b: Int64 = 2
}

main() {
    var a1 = Aoo<() -> A>(goo)
    if (a1.a().b != 2) {
        return 2
    }
    return 0
}
// ASSERT: scan sema_not_member_of
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
