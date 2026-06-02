
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a02_001

  @Level:         1

  @Assertion:   4.20(2) The operands of the logical operators can only be of Bool types.
  @Description: Checks that using logical operators with Bool values is valid.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

main() {
    let x = true
    let y = false

    Assert.equals(false, x && y)
    Assert.equals(true, x && true)
    Assert.equals(false, x && false)
    Assert.equals(false, true && y)
    Assert.equals(false, false && y)

    Assert.equals(true, x || y)
    Assert.equals(true, x || true)
    Assert.equals(true, x || false)
    Assert.equals(true, true || y)
    Assert.equals(false, false || y)

    Assert.equals(false, !x)
    Assert.equals(true, !y)
}
