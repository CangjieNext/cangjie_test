/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a21_01

  @Level:         1

  @Assertion: 6.1.2.1(21)
              Regular parameters must precede all member variable parameters.

  @Description: Check that the primary constructor can have regular parameters
                if they precede member variable parameters

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class RegularBeforeUnnamed {
  RegularBeforeUnnamed(a: Int64, b: Int64, public let c: Int64, private var d!: Int64) {
    Assert.equals(10, a)
    Assert.equals(20, b)
    Assert.equals(30, c)
    Assert.equals(40, d)
  }
}

class RegularBeforeNamed {
  RegularBeforeNamed(a: Int64, b!: Int64, public let c!: Int64) {
    Assert.equals(1, a)
    Assert.equals(2, b)
    Assert.equals(3, c)
  }
}

class OnlyRegulars {
  OnlyRegulars(a: Int64, b: Int64, c!: Int64) {
    Assert.equals(100, a)
    Assert.equals(200, b)
    Assert.equals(300, c)
  }
}

main() {
  let case1 = RegularBeforeUnnamed(10, 20, 30, d: 40)

  let case2 = RegularBeforeNamed(1, b: 2, c: 3)

  let case3 = OnlyRegulars(100, 200, c: 300)
}
