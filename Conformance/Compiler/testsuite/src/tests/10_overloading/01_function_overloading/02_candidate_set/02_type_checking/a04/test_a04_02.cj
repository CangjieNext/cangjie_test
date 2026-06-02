/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_02_a04_02

  @Level:         1

  @Assertion:  10.1.2.2(4)
                open class A {}
                open class B <: A {}
                func g(a: A): B {     //g1
                    B()
                }
                func g(a: B): B {     //g2
                    B()
                }

                func g(a: Int64): Unit {}      //g3

                // (A)->B <: (B)->B <: (B)->A

                func f(a: (A)->B) {}      //f1, g1 can pass the type check

                func f(a: (B)->B) {}      //f2, g1, g2 can pass the type check

                func f(a: (B)->A) {}      //f3, g1, g2 can pass the type check

                func f(a: Bool) {}        //f4, no g can pass the type check

                func test() {
                    f(g)   // candidate set: { f1, f2, f3 }
                }
  
  @Description:  Overloading with arrow (functional/procedural) type
                 Origin example is from spec. Attempt with asserts.
                 
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class A {}
open class B <: A {}
func g(a: A): B {     //g1
    B()
}
func g(a: B): B {     //g2
    B()
}

func g(a: Int64): Unit {}      //g3

// (A)->B <: (B)->B <: (B)->A

func f(a: (A)->B) {println(1)}      //f1, g1 can pass the type check

func f(a: (B)->B) {println(2)}      //f2, g1, g2 can pass the type check

func f(a: (B)->A) {println(3)}      //f3, g1, g2 can pass the type check

func f(a: Bool) {Assert.fail()}    //f4, no g can pass the type check

func test() {
    f(g)   // candidate set: { f1, f2, f3 }
}



main(ina :Array<String>) {
    test()
    0
}



