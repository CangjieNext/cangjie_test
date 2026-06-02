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

interface A<X> {
    func foo(a: X): X {
        a
    }
}

interface B <: A<Int64> {}

class C_B <: B {}

interface C<X> <: A<Int64> {}

class C_C <: C<Int64> {}

interface D<X> <: A<X> {}

class C_D <: D<Int64> {}

interface E<X, Y> <: A<X> {}

class C_E <: E<Int64, Int64> {}

main() {
    var b: C_B = C_B()
    var c: C_C = C_C()
    var d: C_D = C_D()
    var e: C_E = C_E()
    if (b.foo(1) != Int64(1)) {
        return 1
    }
    if (c.foo(2) != 2) {
        return 2
    }
    if (d.foo(3) != 3) {
        return 3
    }
    if (e.foo(4) != 4) {
        return 4
    }
    return 0
}
