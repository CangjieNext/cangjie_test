
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a22_01

  @Level:         1

  @Assertion:   4.15(22) 0.0 ** n = 0.0 // for even n > 0
  @Description: Checks for random even n > 0 that 0.0 ** n = 0.0.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6320
*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..2**10) {
        let n = 2 * Int64(1 + rnd.nextUInt64(UInt64(2**62-1)))
        Assert.equals(0.0, 0.0 ** n)
    }
}
