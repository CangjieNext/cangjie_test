/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I<T> {
    func foo(a: T) {
        return a
    }
}

class A<T> {
    public A(let b!: T) {
    }
}

extend<T> A<T> <: I<T> {
    public func me(a: T) {
        b = foo(a)
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
