/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a25_01

  @Level:         1

  @Assertion: 2.1.10.2(25)
              The following example defines a struct with a primary constructor.
              struct Test{
                static let counter: Int64 = 3
                let name: String = "afdoaidfad"
                private Test(
                  name: String, // regular parameter
                  annotation!: String = "nnn", // regular parameter
                  var width!: Int64 = 1, // member variable parameter with initial value
                  private var length!: Int64, // member variable parameter
                  private var height!: Int64 = 3 // member variable parameter
                  ) {}
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

struct Test{
    static let counter: Int64 = 3
    let name: String = "afdoaidfad"
    private Test(
        name: String, // regular parameter
        annotation!: String = "nnn", // regular parameter
        var width!: Int64 = 1, // member variable parameter with initial value
        private var length!: Int64, // member variable parameter
        private var height!: Int64 = 3 // member variable parameter
        ) {}

    static func test() {
        let tst = Test("str", length: 2)
        Assert.equals(1, tst.width)
        Assert.equals(2, tst.length)
        Assert.equals(3, tst.height)
    }
}

main() {
    Test.test()
}