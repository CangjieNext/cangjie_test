/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface II<T> {
    static func default(): T
}

class A<T> where T <: II<T> {
    static let b: T = T.default()
}

main(): Int64 {
    return 0
}

extend<T> A<T> <: I<T> {
    public static func me(a: T) {
        b = foo(a)
    }
}

interface I<T> {
    static func foo(a: T): T {
        a
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
