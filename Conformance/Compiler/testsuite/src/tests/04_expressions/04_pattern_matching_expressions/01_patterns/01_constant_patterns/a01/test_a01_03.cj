/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a01_03

  @Level:         1

  @Assertion: 4.4.1.1(1) Constant patterns can be integer literals, character byte literals, floating point literals,
              character literals, boolean literals, string literals (string interpolation is not supported),
              Unit literals.

  @Description: Checks match expressions with floating point literals constant patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1: Float16 = 3.14
    var m = match (l1) {
        case 3.14 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l2: Float32 = 3.14
    m = match (l2) {
        case 3.14 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l3: Float64 = 3.14
    m = match (l3) {
        case 3.14 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l4 = 2.4e-1
    m = match (l4) {
        case 2.4e-1 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l5 = 2e3
    m = match (l5) {
        case 2e3 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l6 = .8
    m = match (l6) {
        case .8 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l7 = .123e2
    m = match (l7) {
        case .123e2 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l8 = 0x1.1p0
    m = match (l8) {
        case 0x1.1p0 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l9 = 0x1p2
    m = match (l9) {
        case 0x1p2 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l10 = 0x.2p4
    m = match (l10) {
        case 0x.2p4 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    return
}
