
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a12_05

  @Level:         1

  @Assertion:   4.15(12) ** is the power operator, e.g., the result of the x**y is the yth power of the base x.
  @Description: Checks for random floats f that (f**x)*f(**y) = f**(x+y)
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert
import std.random.Random
import std.ast.*
import std.math.*

main() {
    let rnd = Random(123)

    for (_ in 0..1024) {
      let f = Float64(rnd.nextUInt8(16)) + rnd.nextFloat64()
      let x1 = Int64(rnd.nextInt8())
      let y1 = Int64(rnd.nextInt8())
      let x2 = Float64(rnd.nextInt8()) + rnd.nextFloat64()
      let y2 = Float64(rnd.nextInt8()) + rnd.nextFloat64()
      // quote(($f ** $x1) * ($f ** $y1) == $f ** ($x1 + $y1) => $((f**x1)*(f**y1)) == $(f**(x1+y1))) |> println
      var z1 = (f**x1)*(f**y1)
      var z2 = f**(x1+y1)
      if (z1.isInf() && z2.isInf()) {
        continue
      }
      Assert.approxEquals((f**x1)*(f**y1), f**(x1+y1))
      // quote(($f ** $x2) * ($f ** $y2) == $f ** ($x2 + $y2) => $((f**x2)*(f**y2)) == $(f**(x2+y2))) |> println
      z1 = (f**x2)*(f**y2)
      z2 = f**(x2+y2)
      if (z1.isInf() && z2.isInf()) {
        continue
      }
      Assert.approxEquals((f**x2)*(f**y2), f**(x2+y2))
    }
}
