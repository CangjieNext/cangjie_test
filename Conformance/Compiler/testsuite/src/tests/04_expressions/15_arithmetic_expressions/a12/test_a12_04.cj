
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a12_04

  @Level:         1

  @Assertion:   4.15(12) ** is the power operator, e.g., the result of the x**y is the yth power of the base x.
  @Description: Checks for random floats x that x**y = x*x..*x (y times)
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

    for (_ in 0..1024) {
      var x: Float64
      let y = Int64(1 + rnd.nextUInt64(16))
      do {
        x = Float64(rnd.nextInt32()) * rnd.nextFloat64()
      } while (x**y == Float64.Inf || x**y == -Float64.Inf)
      var exp = 1.0
      var invExp = 1.0
      for (_ in 0..y) {
        exp *= x
        invExp /= x
      }
      Assert.approxEquals(exp, x**y)
      Assert.approxEquals(invExp, x**(-y))
    }
}
