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
    func foo(): X
}

interface B <: A<Int32> {}

class C_B <: B {
    public func foo(): Int32 {
        1
    }
}

interface C<X> <: A<Int32> {}

class C_C <: C<Int32> {
    public func foo(): Int32 {
        2
    }
}

interface D<X> <: A<X> {}

class C_D <: D<Int32> {
    public func foo(): Int32 {
        3
    }
}

interface E<X, Y> <: A<X> {}

class C_E <: E<Int32, Int32> {
    public func foo(): Int32 {
        4
    }
}

main() {
    var b: C_B = C_B()
    var c: C_C = C_C()
    var d: C_D = C_D()
    var e: C_E = C_E()
    if (b.foo() + c.foo() + d.foo() + e.foo() != 10) {
        return 1
    }
    return 0
}
