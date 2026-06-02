/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A<T> {
    A(var a: T) {
    }
}

extend<T> A<T> <: I<T> {
    func foo(b: T) {
        a = b
    }
}

interface I<T> {
    mut func foo(b: T): Unit
}

main() {
    var c = A<Int64>(3)
    c.foo(20)
    return c.a - 20
}
// ASSERT: scan sema_incompatible_mut_modifier_between_struct_and_interface
// ASSERT: scan sema_weak_visibility
// ASSERT: scan sema_cannot_modify_var
