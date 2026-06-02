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
    A(var a!: Int64 = 5) {
    }
}

interface I<T> {
    static func foo() {
        1
    }
}

extend<T> A<T> <: I<T> {
    public static func me(a: T) {
        return 0
    }

    public static func me(a: T): Int64 {
        return 1
    }

    public func me<T>(a: T): Int32 {
        return 0
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_static_function_overload_conflicts
