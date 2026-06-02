/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a08_04

  @Level:         1

  @Assertion:   7.3(8) Note that the setter of struct is a mut function, so you can also
                modify the values of other fields inside the setter, and this is subject
                to the restrictions of the mut function.

  @Description: Checks that "this" and field can be captured in class property setter.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  var a: Int64 = 7
  mut prop aProp: Int64 {
    get() {
      a
    }
    set(v) {
      let f1 = { => this.a }
      if (v > f1()) {
        a = v
      }
    }
  } 
}

main() {
  var x = A()
  x.aProp = 99
  Assert.equals(99, x.aProp)
  Assert.equals(99, x.a)
  x.aProp = 3
  Assert.equals(99, x.aProp)
  Assert.equals(99, x.a)
  x.aProp = 101
  Assert.equals(101, x.aProp)
  Assert.equals(101, x.a)
  return 0
}
