/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a04_03

  @Level:         1

  @Assertion:   7(4) Properties are used with the same syntax as fields and can be used as
                expressions or be assigned values.

  @Description: Checks using property as expression.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  private var x: Int64 = 0
  prop up: Int64 {
    get() {
      x += 1
      x
    }
  }
  prop down: Int64 {
    get() {
      x -= 1
      x
    }
  }
  mut prop level: Int64 {
    get() {
      x
    }
    set(value) {
      x = value
    }
  }
}

func foo(a: Int64) {
}

main() {
  var a = A()
  a.level = 0
  var arr = [0, 10, -4, 3, 5, -5, 0, -9, 1]
  for (el in arr) {
    if (el > 0) {
      foo(a.up)
    } else if (el < 0) {
      foo(a.down)
    }
  }
  Assert.equals(1, a.level)
  0
}
