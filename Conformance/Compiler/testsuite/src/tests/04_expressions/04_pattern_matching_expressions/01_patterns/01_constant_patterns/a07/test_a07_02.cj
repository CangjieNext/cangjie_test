/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a07_02

  @Level:         1

  @Assertion: 4.4.1.1(7) Character byte literal actually is unsigned 8-bit integer, so it can be used as patterns in
              a patter match expression,

  @Description: Check matching the Uint8 selector to the character byte literal constant.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v: UInt8 = 1
    var m = match (v) {
        case b'\u{01}' => 1
        case _ => 0
    }
    Assert.equals(1, m)

    m = match (v) {
        case 2 => 2
        case b'\u{01}' => 1
        case _ => 0
    }
    Assert.equals(1, m)

    m = match (v) {
        case b'\u{01}' | 2 => 1
        case _ => 0
    }
    Assert.equals(1, m)

    return
}
