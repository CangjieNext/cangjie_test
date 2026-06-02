/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_02_a02_01

  @Level:         1
   @Assertion:   2.1.7.2(2) The following example shows how to deconstruct the return value
                  of a function with multiple return values.
                  func multiValues(a: Int32, b: Int32): (Int32, Int32) {
                    return (a + b, a - b)
                    // The type of the return value of the function multiValues is (Int32, Int32).
                  }

                  main() {
                    var (x, y) = multiValues(8,24) // Define an anonymous tuple who has two elements, i.e., x and y.
                    print("${x}") // output: 32
                    print("${y}") // output: -16
                    return 0
                  }
   @Description: Check example.
   @Mode:        run
   @Negative:    no
   @Structure:   single
 */

import utils.assert.Assert

func multiValues(a: Int32, b: Int32): (Int32, Int32) {
    return (a + b, a - b) // The type of the return value of the function multiValues is (Int32, Int32).
}
main() {
    var (x, y) = multiValues(8,24) // Define an anonymous tuple who has two elements, i.e., x and y.
    print("${x}") // output: 32
    print("${y}") // output: -16

    Assert.equals(32, x)
    Assert.equals(-16, y)
    Assert.isTrue(x is Int32)
    Assert.isTrue(y is Int32)

    return 0
}
