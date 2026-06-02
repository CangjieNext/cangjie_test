
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a12_02

  @Level:         1

  @Assertion:   4.15(12) ** is the power operator, e.g., the result of the x**y is the yth power of the base x.
  @Description: Checks for random floats x>1, y that
                floor(x)**y <= x**y <= ceil(x)**y and x**floor(y) <= x**y <= x**ceil(y)
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert
import std.random.Random
import std.math.*

main() {
    let rnd = Random(123)
    for (_ in 0..1024) {
        let x = Float64(1 + rnd.nextUInt64(UInt64.Max)) + rnd.nextFloat64()
        let y = Float64(rnd.nextInt64()) + rnd.nextFloat64()
        Assert.isTrue(floor(x)**y <= x**y)
        Assert.isTrue(x**y <= ceil(x)**y)
        Assert.isTrue(x**floor(y) <= x**y)
        Assert.isTrue(x**y <= x**ceil(y))
    }
}
