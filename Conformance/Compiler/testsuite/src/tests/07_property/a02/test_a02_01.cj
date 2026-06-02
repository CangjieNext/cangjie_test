/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a02_01

  @Level:         1

  @Assertion:   7(2) By using properties you can encapsulate data operations into access
                functions, which are no different from ordinary fields when used.

  @Description: Checks using properties to convert start/end/step values into range type.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class range {
  var r: (Int64, Int64, Int64) = (0, 0, 0)
  init(a: Int64, b: Int64, c: Int64) {
    r = (a, b, c)
  }
  prop half_opened_range: Range<Int64> {
    get() {
      r[0]..r[1]:r[2]
    }
  }
  prop closed_range: Range<Int64> {
    get() {
      r[0]..=r[1]:r[2]
    }
  }
}


main() {
  var x = range(5, 10, 2)
  let r1 = x.half_opened_range
  let r2 = x.closed_range
  Assert.equals(5..10:2, r1)
  Assert.equals(5..=10:2, r2)
  0
}
