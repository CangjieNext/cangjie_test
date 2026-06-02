/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X, Y> {
    public A(let b!: Int32 = 0) {
    }

    public func aaa<X, Y>() {
        return b
    }
}

interface I<X, Y> {
    static func foo<X, Y>() {
    }
}

extend<X, Y> A<X, Y> <: I<X, Y> {
    public static func me<X, Y>(a!: A = this()) {
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_type_without_type_argument
// ASSERT: scan sema_invalid_this_call_outside_ctor
