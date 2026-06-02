
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_01_a04_01

  @Level:         1

  @Assertion:   4.22.1(4)
                func f(x: Int32): Int32 { x + 1 }

                let a: Int32 = 1
                var res = a |> f // ok
                var res1 = a |> {x: Int32 => x + 1} // ok

                func h(b: Bool) { b }
                let res3 = a < 0 || a > 10 |> h // Equivalence (a < 0 || a > 10) |> h

                func g<T>(x: T): T { x }
                var res4 = a |> g<Int32> // ok

                class A {
                    let a: Int32 let b: Int32
                    init(x: Int32) { 
                        a = x
                        b = 0
                    }
                    init(x: Int32, y: Int32) {
                        x |> init // error: `init` is not a valid expression b = y
                    }
                } 

                // PIPELINE with operator `()` overloading
                class A {
                    operator func ()(x: Int32) { 
                        x
                    }
                }
                let obj = A()
                let a: Int32 = 1
                let res = a |> obj // Equivalence obj(a)
.
  @Description: Checks the positive cases of the given example. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func f(x: Int32): Int32 { x + 1 }
let a: Int32 = 1
var res = a |> f // ok
var res1 = a |> {x: Int32 => x + 1} // ok

func h(b: Bool) { b }
let res3 = a < 0 || a > 10 |> h // Equivalence (a < 0 || a > 10) |> h

func g<T>(x: T): T { x }
var res4 = a |> g<Int32> // ok

// PIPELINE with operator `()` overloading
class A {
    operator func ()(x: Int32) { 
        x
    }
}
let obj = A()
let res5 = a |> obj // Equivalence obj(a)

main() {
    Assert.equals(2, res)
    Assert.equals(2, res1)
    Assert.equals(false, res3)
    Assert.equals(a, res4)
    Assert.equals(a, res5)
}
