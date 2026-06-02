/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_a05_03

  @Level:         1
  @Assertion:       2.1.8(5) Range types support using == (! =) for equality (inequality)
                    comparison. We say two instances of the same Range type are equal, if and
                    only if they are both half-open (or closed) and the value of their start,
                    end and step are equal, respectively.

  @Description:     Checks that half-open range is never equals to closed range.

  @Mode:            run
  @Negative:        no
  @Structure:       single

*/

import utils.assert.Assert

func range<T>(a: T, b: T, c: Int64): Range<T> where T <: Countable<T> & Comparable<T> {
  a..b:c
}

func closed_range<T>(a: T, b: T, c: Int64): Range<T> where T <: Countable<T> & Comparable<T> {
  a..=b:c
}

main() {
  let x = range(-7, 3, 3)
  for (a in -10..10) {
    for (b in -20..20) {
      for (c in -5..5) {
        if (c != 0) {
          let y = closed_range(a, b, c)
          Assert.isFalse(y == x)
        }
      }
    }
  }  
  return 0
}
