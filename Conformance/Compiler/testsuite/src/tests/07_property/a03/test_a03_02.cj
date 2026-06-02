/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a03_02

  @Level:         1

  @Assertion:   7(3) We only need to operate on the data and are not aware of the internal
                implementation, which makes it more convenient to implement mechanisms such as
                access control, data monitoring, tracking and debugging, and data binding.

  @Description: Checks using property as system information.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

struct rectangle {
  var x: Int64 = 0
  var y: Int64 = 0
  init (a: Int64, b: Int64) {
    x = a
    y = b
  }
  prop perimeter: Int64 {
    get() {
      2 * (x + y)
    }
  }
}


main() {
  var a = rectangle(5, 6)
  Assert.equals(22, a.perimeter)
  0
}
