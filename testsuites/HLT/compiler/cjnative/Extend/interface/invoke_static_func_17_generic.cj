/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

extend<X, Y> A<X, Y> <: I<X> {
    public static func me<T>() {
        return foo()
    }
}

class A<X, Y> {
    public A(let b!: Int32 = 0) {
    }
}

interface I<X> {
    func foo() {
    }
}

main(): Int64 {
    return 2
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
