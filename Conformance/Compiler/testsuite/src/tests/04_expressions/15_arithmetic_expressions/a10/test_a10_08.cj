
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a10_08

  @Level:         1

  @Assertion:   4.15(10) The value of the remainder expression on integer types a % b is defined as a - b * (a / b).
  @Description: Checks that a % b equals a - b * (a / b) for a set of random UInt64.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)
    for (i in 0..2**10) {
        let a = rnd.nextUInt64()
        var b : UInt64 = 0
        while (b == 0) {
            b = rnd.nextUInt64()
        }
        Assert.equals(a - b * (a / b), a % b)
    }
}
