/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_04_a04_1

  @Level:         1

  @Assertion:    1.3.4(4)
                 b'x' denotes decimal number 120 with type UInt8.
                 b'\u{78}' denotes integer literal 0x78 in hexadecimal or 120 in decimal.

  @Description:  Implemented declared example

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/
import utils.assert.Assert

main() {
    Assert.equals(b'x',120)
    Assert.equals(b'\u{78}',120)
    Assert.equals(b'\u{78}',0x78)

    return 0
}
