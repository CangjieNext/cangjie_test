/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a08_01

  @Level:         1

  @Assertion:    10.1.3.1(8)
                 According to the scope-level precedence principle, two functions in the candidate set,
                 with different scope-levels, are preferred to the one with higher scope-level. 
                 func outer() {
                      func g(a: B) {
                           print("1")
                      }
                      func g(a: Int32) {
                           print("3")
                      }
                      func inner() {
                 
                           func g(a: A) { print("2") }
                           func innermost() {
                               g(B())    // Output: 2
                               g(1)     // Output: 3
                           }
                           g(B())     // Output: 2
                      }
                      inner()
                      g(B())      // Output: 1
                 }
                 In the above example, the innermost function calls 
                 the g function, and the input argument B() is transferred.
                 According to the scope-level priority principle, the function with a higher scope-level is selected.
                 Therefore, the funtion (@FIXME function) g defined in line 7 is selected.

  
  @Description:  Example with inner routines taken form spec. Incomplete.
  
  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006450

*/

open class A {}
open class B <: A {}

func outer() {
    func g(a: B) {
         print("1")
    }
    func g(a: Int32) {
         print("3")
    }
    func inner() {

         func g(a: A) { print("2") }
         func innermost() {
             g(B())    // Output: 2
             g(1)     // Output: 3
         }
         g(B())     // Output: 2
         innermost()
    }
    inner()
    g(B())      // Output: 1
    g(1)
}


main(ina :Array<String>) {
    outer()
    0
}
