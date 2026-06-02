
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a26_01

  @Level:         1

  @Assertion:   4.15(26) POSITIVE_INFINITY ** n = POSITIVE_INFINITY // for n > 0
  @Description: Checks for random n > 0 that POSITIVE_INFINITY ** n = POSITIVE_INFINITY.
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
        let n = Int64(rnd.nextUInt64(UInt64(2**62)*2))
        let res = Float64.Inf ** n
        Assert.isTrue(res.isInf() && res > 0.0)
    }
}
