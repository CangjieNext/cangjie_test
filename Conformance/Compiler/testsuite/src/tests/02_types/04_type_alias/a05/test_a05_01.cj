/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_04_a05_01

  @Level:         1

  @Assertion:   2.4(5) The alias and the original type are regarded as the same type, and the alias does not affect the
                use of the original type.

  @Description: Check that the alias and the original type are regarded as the same type

  @Mode:        run

  @Negative:    no


*/

import utils.assert.Assert

type alias = Float16

main(): Unit {
    let a: alias = 555.0
    let b: Float16 = 333.0

    Assert.isTrue(a is Float16)
    Assert.isTrue(a is alias)
    Assert.isTrue(b is Float16)
    Assert.isTrue(b is alias)
}