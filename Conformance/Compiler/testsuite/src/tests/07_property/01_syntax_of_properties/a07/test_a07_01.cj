/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a07_01

  @Level:         1

  @Assertion:   7.1(7)
                class A {
                  prop i: Int64 {
                    get() {
                      0
                    }
                  }
                }

                main() {
                  var x = A()
                  x.i = 1 // error
                }

  @Description: Checks example.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

class A {
  prop i: Int64 {
    get() {
      0
    } 
  }
}

main() {
  var x = A()
  x.i = 1 // error
}
