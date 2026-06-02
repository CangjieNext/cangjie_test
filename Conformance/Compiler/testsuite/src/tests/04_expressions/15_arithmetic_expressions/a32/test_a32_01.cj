
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a32_01

  @Level:         1

  @Assertion:   4.15(32) Note: When the left operand has the value NaN, the value of the power expression is NaN
                regardless of the value of the right operand, except in the cases listed above.
  @Description: Checks for random integer i that NaN ** i is NaN. Checks that NaN ** 0 is not NaN.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..2**10) {
        Assert.isTrue((Float64.NaN ** rnd.nextInt64()).isNaN())
    }
    Assert.isFalse((Float64.NaN ** 0).isNaN())

}
