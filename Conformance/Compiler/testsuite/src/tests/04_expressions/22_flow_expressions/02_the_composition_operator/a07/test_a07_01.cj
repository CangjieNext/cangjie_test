
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_02_a07_01

  @Level:         1

  @Assertion:   4.22.2(7)
                func f(x: Int32): Float32 { Float32(x) }
                func g(x: Float32): Int32 { Int32(x) }

                var fg = f ~> g // Equivalence: {x: Int32 => g(f(x))}

                let lambdaComp = {x: Int32 => x} ~> f // ok

                func h1<T>(x: T): T { x }
                func h2<T>(x: T): T { x }
                var hh = h1<Int32> ~> h2<Int32> // ok

                // COMPOSITION with operator `()` overloading
                class A {
                    operator func ()(x: Int32): Int32 {
                        x
                    }
                }
                class B {
                    operator func ()(x: Float32): Float32 {
                        x
                    }
                }
                let objA = A()
                let objB = B()
                let af = objA ~> f // ok
                let fb = f ~> objB // ok
                let aa = objA ~> objA // ok
  @Description: Checks the given example. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

func f(x: Int32): Float32 { Float32(x) }
func g(x: Float32): Int32 { Int32(x) }

var fg = f ~> g // Equivalence: {x: Int32 => g(f(x))}

let lambdaComp = {x: Int32 => x} ~> f // ok

func h1<T>(x: T): T { x }
func h2<T>(x: T): T { x }
var hh = h1<Int32> ~> h2<Int32> // ok

// COMPOSITION with operator `()` overloading
class A {
    operator func ()(x: Int32): Int32 {
        x
    }
}
class B {
    operator func ()(x: Float32): Float32 {
        x
    }
}
let objA = A()
let objB = B()
let af = objA ~> f // ok
let fb = f ~> objB // ok
let aa = objA ~> objA // ok

main() {

}
