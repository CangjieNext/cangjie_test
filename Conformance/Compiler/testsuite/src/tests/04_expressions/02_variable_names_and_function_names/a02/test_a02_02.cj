/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a02_02

  @Level:         1

  @Assertion: 4.2(2) For a variable name, its value is the value of the 
              variable after it has been evaluated, and its type is the type
              of the variable. 
  @Description: Checks that for a mutable variable name, its value is the value
                of the variable after it has been evaluated, and its type is
                the type of the variable. 
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

main() {
    var i1: Int32 = 14
    Assert.isTrue(i1 is Int32)
    Assert.equals(14, i1)
    i1 = 0
    Assert.equals(0, i1)

    var i2 = 14
    Assert.equals(14, i2)
    Assert.isTrue(i2 is Int64)
    i2 = -1
    Assert.equals(-1, i2)

    var str1: String = ""
    Assert.equals("", str1)
    Assert.isTrue(str1 is String)
    str1 = "Hello"
    Assert.equals("Hello", str1)

    var phi1: Float64 = 3.14
    Assert.equals(3.14, phi1)
    Assert.isTrue(phi1 is Float64)
    phi1 = 3e15
    Assert.equals(3e15, phi1)

    var i3: Int32 
    i3 = 14
    Assert.equals(14, i3)
    Assert.isTrue(i3 is Int32)
    i3 = 123456
    Assert.equals(123456, i3)

    var i4: Int64
    i4 = 14
    Assert.equals(14, i4)
    Assert.isTrue(i4 is Int64)
    i4 = -6
    Assert.equals(-6, i4)

    var str2: String
    str2 = "Hello"
    Assert.equals("Hello", str2)
    Assert.isTrue(str2 is String)
    str2 = "Goodbye"
    Assert.equals("Goodbye", str2)

    var phi2: Float64
    phi2 = 3.14
    Assert.equals(3.14, phi2)
    Assert.isTrue(phi2 is Float64)
    phi2 = .1
    Assert.equals(.1, phi2)
}
