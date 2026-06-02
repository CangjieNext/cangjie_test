/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a06_01

  @Level:         1

  @Assertion: 6.1.5(6)
              The object name is the name of the packaged variable,
              and its member variable value can be accessed through the member access expression.

  @Description: Check that instances of the class Box are accessible by their names

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

main() {
    let case1 = Box<Bool>(true)
    var access1 = case1
    Assert.isTrue(access1 is Box<Bool>)

    var case2 = Box<String>("")
    var access2 = case2
    Assert.isTrue(access2 is Box<String>)

    var case3 = Box<Int64>(1)
    var access3 = case3
    Assert.isTrue(access3 is Box<Int64>)

    var case4 = Box<Float64>(0.001)
    var access4 = case4
    Assert.isTrue(access4 is Box<Float64>)

    var case5 = Box<Unit>(())
    var access5 = case5
    Assert.isTrue(access5 is Box<Unit>)
}