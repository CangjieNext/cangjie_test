/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a12_01

  @Level:         1

  @Assertion:   7.4(12)
                open class A {
                  mut prop i1: Int64 {
                    get() { 0 }
                    set(v) {}
                  }
                  static mut prop i2: Int64 {
                    get() { 0 }
                    set(v) {}
                  }
                }
                // case 1
                class B <: A {
                  override mut prop i1: Int64 {
                    get() { 1 } // ok
                  }
                  redef static mut prop i2: Int64 {
                    get() { 1 } // ok
                  }
                }
                // case 2
                class B <: A {
                  override mut prop i1: Int64 {
                    set(v) {} // ok
                  }
                  redef static mut prop i2: Int64 {
                    set(v) {} // ok
                  }
                }
                // case 3
                class B <: A {
                  override mut prop i1: Int64 {} // error
                  redef static mut prop i2: Int64 {} // error
                }

  @Description: Checks that example (case 1) is compiled w/o errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006217


*/

open class A {
  public open mut prop i1: Int64 {
    get() { 0 }
    set(v) {}
  }
  static mut prop i2: Int64 {
    get() { 0 }
    set(v) {}
  }
}
// case 1
class B <: A {
  public override mut prop i1: Int64 {
    get() { 1 } // ok
  }
  redef static mut prop i2: Int64 {
    get() { 1 } // ok
  }
}

main() {
  return 0;
}


