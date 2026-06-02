/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_04_a03_01

  @Level:         1

  @Assertion:   2.4(3) The above definition defines an alias of type with the name identifier, i.e., identifier and
                type are treated as the same type.

  @Description: Check that the typealias identifier and type are treated as the same type

  @Mode:        run

  @Negative:    no


*/

import utils.assert.Assert

type alias = Float64

main(): Unit {
    let a: alias = 5.555
    let b: Float64 = 3.333

    Assert.isTrue(a is Float64)
    Assert.isTrue(a is alias)
    Assert.isTrue(b is Float64)
    Assert.isTrue(b is alias)
}
