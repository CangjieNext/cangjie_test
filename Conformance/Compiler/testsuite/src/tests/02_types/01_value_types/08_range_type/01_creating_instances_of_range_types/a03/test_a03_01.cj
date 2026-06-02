/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_01_a03_01

  @Level:         1
  @Assertion:       2.1.8.1(3) The expression start..end:step returns an empty range instance
                    (i.e., an empty sequence) if step > 0 and start >= end, or step < 0 and
                    start <= end. When the result of start..end:step is non-empty, the number
                    of elements in the range instance is equal to the ceiling of (end-start)/step
                    (i.e., the least integer greater than or equal to (end-start)/step).

  @Description:     Checks that range is empty when step > 0 and start >= end.

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/

import utils.assert.Assert

func rangeSize(range: Range<Int64>) : Int64 {
  var size: Int64 = 0
  for (el in range) {
    size += 1
  }
  size
}

main() {
  Assert.equals(0, rangeSize(0..0))
  Assert.equals(0, rangeSize(2..2))
  Assert.equals(0, rangeSize(10..0))
  Assert.equals(0, rangeSize(-10..-11))

  for (a in -10..10) {
    for (b in -20..20) {
      for (c in 1..5) {
        if (a >= b) {
          Assert.equals(0, rangeSize(a..b:c))
        }
      }
    }
  }
  return 0
}
