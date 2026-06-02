/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a18_02

  @Level:         1

  @Assertion:    1.4(18) is Type test as Type cast

  @Description:  Check is Type  operator

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/


import utils.assert.Assert

main() {
    Assert.isTrue(1 is Int64)
    Assert.isTrue(1.0 is Float64)
    Assert.isTrue(true is Bool)
    Assert.isTrue(r'\u{A}' is Rune)
    return 0;
}
