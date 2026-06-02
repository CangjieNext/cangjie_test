/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a14_02

  @Level:         1

  @Assertion:   7.2(14)
                open class A {
                  var i = 0
                  prop i: Int64 { // error
                    get() {
                      0
                    }
                  }
                }

                class B <: A {
                  prop i: Int64 { // error
                    get() {
                      0
                    }
                  }
                }

  @Description: Checks that example is compiled with errors.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

open class A {
  var i1 = 0
  prop i: Int64 {
    get() {
      0
    }
  }
}

class B <: A {
  prop i: Int64 { // error
    get() {
      0
    }
  }
}

main() {
  return 0;
}


