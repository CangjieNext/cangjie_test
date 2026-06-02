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
    static func default(): T
}

class A<T> where T <: I<T> {
    static let b: T = T.default()

    public func aaa(x: T) {
        return x
    }
}

extend<T> A<T> {
    public static func me(a!: T = aaa(b)) {
    }
}

main(): Int64 {
    return 2
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
