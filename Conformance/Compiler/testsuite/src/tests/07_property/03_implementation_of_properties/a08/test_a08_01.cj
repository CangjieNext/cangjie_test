/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a08_01

  @Level:         1

  @Assertion:   7.3(8) Note that the setter of struct is a mut function, so you can also
                modify the values of other fields inside the setter, and this is subject
                to the restrictions of the mut function.

  @Description: Checks that setter of struct property can modify the values of other fields.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

struct A {
  var a: Int64 = 0
  var b: Int64 = 0
  var c: Int64 = 0
  mut prop aProp: Int64 {
    get() {
      a
    }
    set(v) {
      a = v
      b = v
      c = v
    }
  } 
}

main() {
  var x = A()
  x.aProp = 7
  Assert.equals(7, x.aProp)
  Assert.equals(7, x.a)
  Assert.equals(7, x.b)
  Assert.equals(7, x.c)
  return 0
}
