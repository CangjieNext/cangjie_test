/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_03_a02_01

  @Level:         1
   @Assertion:   2.1.7.3(2) The following example shows how anonymous tuples and index-based accessing are used:
                 main() {
                   var z = multiValues(8, 24) // the type of z is inferred to be (Int32, Int32)
                   print("${z[0]}") // output: 32
                   print("${z[1]}") // output: -16
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
    var z = multiValues(8,24) // the type of z is inferred to be (Int32, Int32)
    print("${z[0]}") // output: 32
    print("${z[1]}") // output: -16

    Assert.equals(32, z[0])
    Assert.equals(-16, z[1])
    Assert.isTrue(z[0] is Int32)
    Assert.isTrue(z[1] is Int32)

    return 0
}
