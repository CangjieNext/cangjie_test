/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_03_a03_02

  @Level:         1

  @Assertion:   2.3(3) For value types, we say valueTypeA to valueTypeB is convertible, when rules for converting
                valueTypeA to valueTypeB is defined. Otherwise, valueTypeA to valueTypeB is non-convertible.

  @Description:  Check that if conversion rules for types are defined then conversion is possible

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {
    let a = Rune(57)
    let b = UInt32(a)
    Assert.isTrue(b is UInt32)
}
