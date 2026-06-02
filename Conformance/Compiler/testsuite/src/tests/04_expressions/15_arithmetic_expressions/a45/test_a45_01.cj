
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a45_01

  @Level:         1

  @Assertion:   4.15(45) 1.0 ** y = 1.0 // for any y
  @Description: Checks for random float y that 1.0 ** y = 1.0.
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

    Assert.approxEquals(1.0, 1.0 ** Float64.NaN)
    Assert.approxEquals(1.0, 1.0 ** Float64.Inf)
    Assert.approxEquals(1.0, 1.0 ** -Float64.Inf)
    Assert.approxEquals(1.0, 1.0 ** 0.0)
    Assert.approxEquals(1.0, 1.0 ** -0.0)
    
    for (_ in 0..2**10) {
        let y = rnd.nextFloat64() + Float64(rnd.nextInt64())
        Assert.approxEquals(1.0, 1.0 ** y)
    }
}
