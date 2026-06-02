/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a07_01

  @Level:         1

  @Assertion: 4.4.1.1(7) Character byte literal actually is unsigned 8-bit integer, so it can be used as patterns in
              a patter match expression,

  @Description: Checks that character byte literal actually is unsigned 8-bit integer
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let b = b'\u{00}'
    Assert.isTrue(b is UInt8)
    return
}
