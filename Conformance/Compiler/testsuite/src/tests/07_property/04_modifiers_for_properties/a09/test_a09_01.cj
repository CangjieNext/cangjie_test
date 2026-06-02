/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a09_01

  @Level:         1

  @Assertion:   7.4(9)
                open class A {
                  static mut prop i: Int64 {
                    get() { 0 }
                    set(v) {}
                  }
                }

                class B <: A {
                  redef static mut prop i: Int64 {
                    get() { 1 }
                    set(v) {}
                  }
                }


  @Description: Checks that example is compiled w/o errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

open class A {
  static mut prop i: Int64 {
    get() { 0 }
    set(v) {}
  }
}

class B <: A {
  redef static mut prop i: Int64 {
    get() { 1 }
    set(v) {}
  }
}

main() {
  return 0;
}


