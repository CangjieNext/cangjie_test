/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a29_01

  @Level:         1

  @Assertion: 6.1.2.1(29)
              The following is an example:
              class Test{
                static let counter: Int64 = 3
                let name: String = "afdoaidfad"
                private Test(
                  name: String, // regular parameter
                  annotation!: String = "nnn", // regular parameter
                  var width!: Int64 = 1, // member variable parameter with initial value
                  length!: Int64, // Error: regular parameters cannot be after member variable parameters
                ) {
                }
              }

  @Description: Check that the example without the last regular parameter works

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006196

*/

import utils.assert.Assert

class Test{
  static let counter: Int64 = 3
  let name: String = "afdoaidfad"
  private Test(
    name: String, // regular parameter
    annotation!: String = "nnn", // regular parameter
    var width!: Int64 = 1 // member variable parameter with initial value
  ) {
    Assert.equals("STRING", name)
    Assert.equals("STRING", annotation)
    Assert.equals(100, width)
  }

  func check() {
    Assert.equals(100, width)
  }

  static func test() {
    let test = Test("STRING", annotation: "STRING", width: 100)
    test.check()
  }
}

main() {
  Test.test()
}