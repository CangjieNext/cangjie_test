/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func f(x: Int32): Float32 {
    Float32(x)
}

func g(x: Float32): Float32 {
    x
}

func h1<T>(x: T): T {
    x
}

func h2<T>(x: T): T {
    x
}

// COMPOSITION with operator `()`
class A {
    public operator func ()(x: Int32): Int32 {
        x
    }
}

class B {
    public operator func ()(x: Float32): Float32 {
        x
    }
}

main(): Int64 {
    var fg = f ~> g // Equivalence: \x: Int32 => g(f(x))
    let lambdaComp = ({x: Int32 => x}) ~> f // ok    
    var hh = h1<Int32> ~> h2<Int32> // ok

    let objA = A()
    let objB = B()
    let af = objA ~> f // ok
    let fb = f ~> objB // ok
    let aa = objA ~> objA // ok

    return 0
}
