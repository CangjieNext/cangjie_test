/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_06

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that init constructors defined in the class body are members of the class, i.e:
                constructors can access private members of the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: All the preceding are: 
            static initializer
            primary constructor
            constructors
            member variables
            member functions and member operator functions
            member properties
            macro expressions

*/

import utils.assert.Assert

var const_indicator = 0

class Test {
  private var p = 75
  init() {
    var x = p
    Assert.equals(75, x)
    const_indicator++
  }

  init(p1: Int64) {
    var x = p
    Assert.equals(75, x)
    const_indicator += p1
  }

  init(p1: Int64, p2: Int64) {
    var x = p
    Assert.equals(75, x)
    const_indicator += p1 + p2
  }

  init(p1: Int64, p2: Int64, p3: Int64) {
    var x = p
    Assert.equals(75, x)
    const_indicator += p1 + p2 + p3
  }
}

main() {
  Assert.equals(0, const_indicator)
  let t1 = Test()
  Assert.equals(1, const_indicator)
  let t2 = Test(1)
  Assert.equals(2, const_indicator)
  let t3 = Test(10, 10)
  Assert.equals(22, const_indicator)
  let t4 = Test(5, 5, 5)
  Assert.equals(37, const_indicator)
}
