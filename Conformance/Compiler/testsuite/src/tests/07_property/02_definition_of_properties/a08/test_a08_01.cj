/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a08_01

  @Level:         1

  @Assertion:   7.2(8)
                interface I {
                  prop a: Int64 { // ok
                    get() {
                      0
                    }
                  }
                }
                class A <: I {} // ok

  @Description: Checks that example is compiled w/o errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

interface I {
  prop a: Int64 { // ok
    get() {
      0
    }
  }
}
class A <: I {} // ok

main() {
  return 0;
}


