/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a09_02

  @Level:         1

  @Assertion:   7.1(9) Example:
                struct A {
                  var i1 = 0
                  mut prop i2: Int64 {
                    get() {
                      i1
                    }
                    set(value) {
                      i1 = value
                    } 
                  }
                }

                main() {
                  let x = A()
                  x.i1 = 2 // error
                  x.i2 = 2 // error
                }

  @Description: Checks that example is not compiled.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

struct A {
  var i1 = 0
  mut prop i2: Int64 {
    get() {
      i1
    }
    set(value) {
      i1 = value
    } 
  }
}

main() {
  let x = A()
  //x.i1 = 2 // error
  x.i2 = 2 // error
}
