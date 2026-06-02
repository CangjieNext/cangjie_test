/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_01_01_a02_07

  @Level:         1

  @Assertion: 9.6.1.1(2) The following function declarations and definitions are illegal: 

              abstract class AbsClass {
                  func foo<T>(a: T) // error: abstract generic function in abstract class
                  open func bar<T>(a: T) { // error: open generic function in abstract class
                  ...
                  }
              }

              interface IF {
                  func foo<T>(a: T) // error: abstract generic function in interface
              }

              class Foo {
                  open function foo<T>(a: T): Unit { // error: open generic function in class
                      ...
                  }
              }

  @Description: Check the "error: abstract generic function in interface" fixed case.

  @Mode: run

  @Negative: no

  @Issue: 0006283

*/

interface IF {
    func foo<T>(a: T): T // error: abstract generic function in interface
}

main() {}

