/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    public A(let b!: Int32 = 0) {
    }

    public static func aaa<T>() {
        return 0
    }
}

extend<T> A<T> <: I<Int32> where T <: Int32 {
    public static func me(b: T, a!: (T) -> T = foo): T {
        a(b)
    }
}

interface I<T> {
    static func foo(a: T): T {
        a
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_mismatched_types
