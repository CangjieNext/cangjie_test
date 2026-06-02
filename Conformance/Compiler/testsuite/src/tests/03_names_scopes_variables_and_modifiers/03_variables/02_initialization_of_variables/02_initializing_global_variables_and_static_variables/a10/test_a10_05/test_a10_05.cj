/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a10_05

  @Level:         1

  @Assertion:    3.3.2.2(10)
      // The initialization of the global variable cannot depend on the global
      //  variables defined in other files of the same package.
      // a.cj
      let x = 2
      let y = z          // OK, b.cj does not depend on this file directly or indirectly.
      let a = x          // OK.
      let c = A()
      // c.f is an open function, the compiler cannot statically determine whether the
      //  function meets the initialization rules of global variables, and an error will
      //  be reported.
      let d = c.f()       // Error.
      class A {
           static var z = 1
           open func f(): Int64 {
                return 77
           }
      }
      class B {
           static var e = A.z       // OK.
           static var f = x         // OK.
      }
      // b.cj
      let z = 10
      // let y = 10      // Error, y is already defined in a.cj.
      // main.cj
      main(): Int64 {
           print("${x}")
           print("${y}")
           print("${z}")
           return 1
      }

  @Description:  Checks that initialization of y (is already defined in a.cj) gives an error.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a10_05_1.cj aux_test_a10_05_2.cj

  @Issue:        0006065
*/

main(): Int64 {
    print("${x}")
    print("${y}")
    print("${z}")
    return 1
}
