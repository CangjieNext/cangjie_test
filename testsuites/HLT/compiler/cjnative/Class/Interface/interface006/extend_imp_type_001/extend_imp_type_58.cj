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

type A<T, K> = interfaceA<T, K>

interface interfaceA<T, K> {
    func a(a: T) {
        a
    }
    func b(b: K) {
        b
    }
}

open class C<T, K> {}

extend<T, K> C<T, K> <: A<T, K> {}

class B<T, K> <: C<T, K> {}

extend<T, K> B<T, K> {
    public static func c(c: B<T, K>) {
        c
    }
}

main(): Int64 {
    if (B<Float64, Unit>.c(B<Float64, Unit>()).a(4.0) == 4.0 && B<Float64, Unit>.c(B<Float64, Unit>()).b(()) == ()) {
        return 0
    } else {
        return 1
    }
}
