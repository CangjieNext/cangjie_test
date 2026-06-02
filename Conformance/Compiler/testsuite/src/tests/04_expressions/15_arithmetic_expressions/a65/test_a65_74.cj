
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a65_74

  @Level:         1

  @Assertion:   4.15(65) The default strategy is the same with @OverflowThrowing.
  @Description: Checks that ** operator calculation for integers causes an ArithmeticException if @OverflowThrowing is
                used.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

@OverflowThrowing
func f(a: Int64, b: UInt64) {
    a ** b
}

main() {
    var caught : Bool = false
    try {
        f(-2, 64u64)
    } catch (e: ArithmeticException) {
        caught = true
    }
    Assert.isTrue(caught)
}
