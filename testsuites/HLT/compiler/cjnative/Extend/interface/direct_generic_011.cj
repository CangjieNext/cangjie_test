/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A<T> {
    public A(let b!: Int32 = 0) {
    }

    public static func aaa<T>() {
        return 0
    }
}

extend<T> A<T> <: I<T> {
    public static func me(b: T, a!: (T) -> T = foo<T>): T {
        a(b)
    }
}

interface I<T> {
    static func foo<T>(a: T): T {
        a
    }
}

main(): Int64 {
    return A<Int64>.me(0)
}
