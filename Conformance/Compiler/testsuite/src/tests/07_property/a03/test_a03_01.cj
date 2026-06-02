/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a03_01

  @Level:         1

  @Assertion:   7(3) We only need to operate on the data and are not aware of the internal
                implementation, which makes it more convenient to implement mechanisms such as
                access control, data monitoring, tracking and debugging, and data binding.

  @Description: Checks using property with access control.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  private var p: (Int64, Int64) = (0, 0)
  mut prop x: Int64 {
    get() {
      p[0]
    }
    set(value) {
      p = (value, p[0])
    }
  }
  mut prop y: Int64 {
    get() {
      p[1]
    }
    set(value) {
      p = (p[0], value)
    }
  }
  prop point: (Int64, Int64) {
    get() {
      p
    }
  }
}


main() {
  var a = A()
  a.x = 10
  a.y = -4
  Assert.equals(10, a.point[0])
  Assert.equals(-4, a.point[1])
  0
}
