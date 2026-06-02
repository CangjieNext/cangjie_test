
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a12_01

  @Level:         1

  @Assertion:   4.15(12) ** is the power operator, e.g., the result of the x**y is the yth power of the base x.
  @Description: Checks for random integers x, y that x**y = x*x..*x (y times)
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6258
*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 1..1024) {
      let x = rnd.nextInt64()
      Assert.equals(x, x**1)
      Assert.equals(1, x**0)
      let exp = rnd.nextUInt64()
      Assert.equals(0, 0**exp)
      Assert.equals(1, 1**exp)
      Assert.equals(1 - 2 * Int64(exp % 2), (-1)**exp)
    }

    for (i in 2..1024) {
        var pow : Int64 = 1
        var negPow : Int64 = 1
        var exp : UInt64 = 0
        do {
          Assert.equals(pow, i**exp)
          Assert.equals(negPow, (-i)**exp)
          pow *= i
          negPow *= -i
          exp++
        } while (Int64.Max / i >= pow)
        Assert.equals(pow, i**exp)
        Assert.equals(negPow, (-i)**exp)
    }

    for (i in 2u64..6u64) {
        let upperBitSize = 62u64 / i 
        for (_ in 0..1024) {
            let x = Int64(rnd.nextUInt64(UInt64(2**upperBitSize)))
            var pow : Int64 = 1
            var negPow : Int64 = 1
            for (exp in 0..i) {
                Assert.equals(pow, x**exp)
                Assert.equals(negPow, (-x)**exp)
                pow *= x
                negPow *= -x
            }
            Assert.equals(pow, x**i)
            Assert.equals(negPow, (-x)**i)
        }
    }
}
