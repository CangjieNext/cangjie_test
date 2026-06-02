/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a04_01

  @Level:         1

  @Assertion:   7(4) Properties are used with the same syntax as fields and can be used as
                expressions or be assigned values.

  @Description: Checks using properties like fields.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import std.math.*
import utils.assert.Assert

type point2d = (Float32, Float32)

class A {
  private var p: point2d = (0.0, 0.0)
  mut prop x: Float32 {
    get() {
      p[0]
    }
    set(value) {
      p = (value, p[0])
    }
  }
  mut prop y: Float32 {
    get() {
      p[1]
    }
    set(value) {
      p = (p[0], value)
    }
  }
  mut prop point: point2d {
    get() {
      p
    }
    set(value) {
      p = value
    }
  }
}


main() {
  var a = A()
  var b = A()
  a.point = (34.5, 10.1)
  b.point = (30.5, 7.1)
  var d = sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y))
  Assert.isTrue(abs(d - 5.0) < 0.00001)
  0
}
