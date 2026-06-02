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

extend Int64 <: II<Int64> {
    static func default(): Int64 {
        1
    }
}

class A<T> where T <: II<T> {
    static var b: T = T.default()
}

extend<T> A<T> <: I<Int32> {
    public static func me<T>(b: T) {
        var a: (T) -> T = foo
        a(b)
    }
}

interface I<T> {
    static func foo(a: T): T {
        a
    }
}

main(): Int64 {
    return 2
}
// ASSERT: scan sema_weak_visibility
// ASSERT: scan sema_no_match_function_declaration_for_ref
