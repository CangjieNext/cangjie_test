/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a27_01

  @Level:         1

  @Assertion: 6.1.2.1(27)
              The following example defines a class with a primary constructor.
              class Test{
                static let counter: Int64 = 3
                let name: String = "afdoaidfad"
                private Test(
                  name: String, // regular parameter
                  annotation!: String = "nnn", // regular parameter
                  var width!: Int64 = 1, // member variable parameter with initial value
                  private var length!: Int64, // member variable parameter
                  private var height!: Int64 = 3 // member variable parameter
                ) {
                }
              }

  @Description: Check that the example works correctly
                and initializes all the mentioned instance variables

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test{
  static let counter: Int64 = 3
  let name: String = "afdoaidfad"
  private Test(
    name: String, // regular parameter
    annotation!: String = "nnn", // regular parameter
    var width!: Int64 = 1, // member variable parameter with initial value
    private var length!: Int64, // member variable parameter
    private var height!: Int64 = 3 // member variable parameter
  ) {
    Assert.equals("str", name)
    Assert.equals("nnn", annotation)
    Assert.equals(1, width)
    Assert.equals(10, length)
    Assert.equals(3, height)
  }

  static func test() {
    let test = Test("str", length: 10)
    test.check_private()
  }

  func check_private() {
    Assert.equals(10, length)
    Assert.equals(3, height)
  }
}

main() {
  Test.test()
}