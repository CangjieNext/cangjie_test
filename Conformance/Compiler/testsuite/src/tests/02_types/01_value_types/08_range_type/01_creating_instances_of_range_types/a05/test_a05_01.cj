/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_01_a05_01

  @Level:         1
  @Assertion:       2.1.8.1(5) 
                    let range1 = 0..10:1 // Define an half-open range [0,10) (with step = 1) which contains 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9.
                    let range2 = 0..=10:2 // Define a closed range [0,10] (with step = 2) which contains 0, 2, 4, 6, 8 and 10.
                    let range3 = 10..0:-2 // Define an half-open range [10,0) (with step = -2) which contains 10, 8, 6, 4 and 2.
                    let range4 = 10..=0:-1 // Define a closed range [10,0] (with step = -1) which contains 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 and 0.
                    let range5 = 10..0:1 // Define an empty range.
                    let range6 = 0..0:1 // Define an empty range.
                    let range7 = 0..=0:1 // Define a closed range [0,0] (with step = 1) which only contains 0.
                    let range8 = 0..=10:-1 // Define an empty range.

  @Description:     Checks sample.

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/

import utils.assert.Assert

func printRange(range: Range<Int64>) : String {
  var range_str: String = ""
  for (el in range) {
    range_str += el.toString()
  }
  range_str
}

main() {
  Assert.equals("0123456789", printRange(0..10:1))
  Assert.equals("0246810", printRange(0..=10:2))
  Assert.equals("108642", printRange(10..0:-2))
  Assert.equals("109876543210", printRange(10..=0:-1))
  Assert.equals("", printRange(10..0:1))
  Assert.equals("", printRange(0..0:1))
  Assert.equals("0", printRange(0..=0:1))
  Assert.equals("", printRange(0..=10:-1))
  return 0
}
