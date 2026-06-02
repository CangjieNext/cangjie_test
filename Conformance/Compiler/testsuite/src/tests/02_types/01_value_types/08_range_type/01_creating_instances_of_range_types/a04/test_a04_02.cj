/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_01_a04_02

  @Level:         1
  @Assertion:       2.1.8.1(4) The expression start..=end:step returns an empty range instance
                    if step > 0 and start > end, or step < 0 and start < end. When the result of
                    start..=end:step is non-empty, the number of elements in the range instance
                    is equal to the floor of ((end-start)/step)+1 (i.e., the greatest integer
                    less than or equal to ((end-start)/step)+1).

  @Description:     Checks that range is empty when step < 0 and start < end.

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
  Assert.equals(0, rangeSize(0..=1:-1))
  Assert.equals(0, rangeSize(2..=3:-3))
  Assert.equals(0, rangeSize(2..=10:-5))
  Assert.equals(0, rangeSize(-10..=33:-1))

  for (a in -10..10) {
    for (b in -20..20) {
      for (c in -5..0) {
        if (a < b) {
          Assert.equals(0, rangeSize(a..=b:c))
        }
      }
    }
  }

  return 0
}
