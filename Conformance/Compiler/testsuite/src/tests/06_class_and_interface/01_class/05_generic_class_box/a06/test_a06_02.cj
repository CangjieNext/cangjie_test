/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a06_02

  @Level:         1

  @Assertion: 6.1.5(6)
              The object name is the name of the packaged variable,
              and its member variable value can be accessed through the member access expression.

  @Description: Check that the variable 'value' is accessible through the instance of the class Box

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

main() {
    let case1 = Box<Bool>(true)
    var access1 = case1.value
    Assert.equals(true, access1)
    case1.value = false
    access1 = case1.value
    Assert.equals(false, access1)

    var case2 = Box<String>("")
    var access2 = case2.value
    Assert.equals("", access2)
    case2.value = "vvvv"
    access2 = case2.value
    Assert.equals("vvvv", access2)

    var case3 = Box<Rune>(r'b')
    var access3 = case3.value
    Assert.equals(r'b', access3)
    case3.value = r'x'
    access3 = case3.value
    Assert.equals(r'x', access3)

    var case4 = Box<(Int64, Int64)>((7, 11))
    var access4 = case4.value
    Assert.equals(7, access4[0])
    Assert.equals(11, access4[1])
    case4.value = (24, 7)
    access4 = case4.value
    Assert.equals(24, access4[0])
    Assert.equals(7, access4[1])

    var case5 = Box<Float16>(1.2)
    var access5 = case5.value
    Assert.approxEquals(1.2f16, access5)
    case5.value = 0.19
    access5 = case5.value
    Assert.approxEquals(0.19f16, access5)
}