/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a36_01

  @Level:         1

  @Assertion: 6.1.2.1(36)
              The return type cannot be explicitly defined for the constructor,
              and the constructor must have a function body

  @Description: Check that init constructors without the return type and with body
                function correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var indicator = 0

class Test {
  init() {
    indicator = 1
  }

  public init(x: Int64) {
    indicator = 2
  }

  protected init(a: Bool, b!: String) {
    indicator = 3
  }

  private init(a!: Rune = r'a', b!: Rune) {
    indicator = 4
  }

  static func test() {
    let case1 = Test()
    Assert.equals(1, indicator)

    let case2 = Test(10)
    Assert.equals(2, indicator)

    let case3 = Test(false, b: "a")
    Assert.equals(3, indicator)

    let case4 = Test(b: r's')
    Assert.equals(4, indicator)
  }
}

main() {
  Test.test()
}