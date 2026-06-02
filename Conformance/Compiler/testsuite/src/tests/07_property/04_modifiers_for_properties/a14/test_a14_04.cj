/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a14_04

  @Level:         1

  @Assertion:   7.4(14)
                class P {}
                class S {}
                open class A {
                  open prop i1: P {
                    get() { P() }
                  }
                  static prop i2: P {
                    get() { P() }
                  }
                }
                // case 1
                class B <: A {
                  override mut prop i1: P { // error
                    set(v) {}
                  }
                  redef static mut prop i2: P { // error
                    set(v) {}
                  }
                }

                // case 2
                class B <: A {
                  override prop i1: S { // error
                    get() { S() }
                  }
                  redef static prop i2: S { // error
                    get() { S() }
                  }
                }

  @Description: Checks that example is compiled as expected (case 2/2).

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class P {}
class S {}
open class A {
  open prop i1: P {
    get() { P() } 
  }
  static prop i2: P {
    get() { P() }
  }
}
// case 2
class B <: A {
  redef static prop i2: S { // error
    get() { S() }
  }
}

main() {
  return 0;
}


