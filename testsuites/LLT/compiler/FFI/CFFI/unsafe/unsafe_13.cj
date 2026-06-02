// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1.0
// ASSERT: scan 2.0
// ASSERT: scan 3
// ASSERT: scan 4
// ASSERT: scan 5.0
// ASSERT: scan 6

unsafe func f(x: Int32): Float32 { Float32(x) }
unsafe func g(x: Float32): Int32 { Int32(x) }

var fg = f ~> g  // Equivalence: {x: Int32 => g(f(x))}

let lambdaComp = { x: Int32 => x } ~> f // ok

unsafe func h1<T>(x: T): T { x }
unsafe func h2<T>(x: T): T { x }
var hh = h1<Int32> ~> h2<Int32> // ok

// COMPOSITION with operator `()` overloading
class A {
    public unsafe operator func ()(x: Int32): Int32 {
        x
    }
}

class B {
    public unsafe operator func ()(x: Float32): Float32 {
        x
    }
}

unsafe main() {
    let objA = A()
    let objB = B()
    let af = objA ~> f // ok
    let fb = f ~> objB // ok
    let aa = objA ~> objA // ok
    println(af(1))
    println(fb(2))
    println(aa(3))
    println(fg(4))
    println(lambdaComp(5))
    println(hh(6))
}
