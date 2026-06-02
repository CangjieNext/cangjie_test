/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a08_03

  @Level:         1

  @Assertion:   7.3(8) Note that the setter of struct is a mut function, so you can also
                modify the values of other fields inside the setter, and this is subject
                to the restrictions of the mut function.

  @Description: Checks that field cannot be captured in struct property setter.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

struct A {
  var a: Int64 = 0
  mut prop aProp: Int64 {
    get() {
      a
    }
    set(v) {
      let f4 = { => a } // error
      a = v
    }
  } 
}

main() {
  var x = A()
  return 0
}
