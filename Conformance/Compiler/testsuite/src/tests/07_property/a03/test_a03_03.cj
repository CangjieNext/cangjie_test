/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a03_03

  @Level:         1

  @Assertion:   7(3) We only need to operate on the data and are not aware of the internal
                implementation, which makes it more convenient to implement mechanisms such as
                access control, data monitoring, tracking and debugging, and data binding.

  @Description: Checks using property 3d point.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

type point3d = (Int64, Int64, Int64)

class A {
  var x: Int64 = 0
  var y: Int64 = 0
  var z: Int64 = 0
  mut prop point: point3d {
    get() {
      (x, y, z)
    }
    set (value) {
      x = value[0]
      y = value[1]
      z = value[2]
    }
  }
  func move(dx: Int64, dy: Int64, dz: Int64) {
    x += dx
    y += dy
    z += dz
  }
}


main() {
  var a = A()
  a.point = (10, 2, 5)
  a.move(-2, 8, -10)
  var z = a.point
  Assert.equals(8, z[0])
  Assert.equals(10, z[1])
  Assert.equals(-5, z[2])
  0
}
