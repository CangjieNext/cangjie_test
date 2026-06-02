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

type A<T> = interfaceA<T, T>

interface interfaceA<T, K> {
    func a(a: T) {
        a
    }
    func b(b: K) {
        b
    }
}

class B<T> <: A<T> {}

class C<T> {}

extend<T> C<T> <: A<T> {
    public static func d() {
        1
    }
}

extend<T> B<T> {
    public static func c(c: B<T>) {
        c
    }
    public static func e() {
        C<T>.d()
    }
}

main(): Int64 {
    if (B<Float64>.c(B<Float64>()).a(4.0) == 4.0 && B<Float64>.c(B<Float64>()).b(3.0) == 3.0 && B<Float64>.e() == 1) {
        return 0
    } else {
        return 1
    }
}
