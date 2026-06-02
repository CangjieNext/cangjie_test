/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_04_a01_1

  @Level:         1

  @Assertion:     1.3.4(1) Cangjie programming language introduced character byte literal 
                           to denote the value of type UInt8 conveniently.

  @Description:  Check character literal has UInt8 type

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/
import utils.assert.Assert

main() {

    Assert.isTrue(b'A' is UInt8)
    Assert.isTrue(b'\b' is UInt8)
    Assert.isTrue(b'\u{A}' is UInt8)
    return 0
}

