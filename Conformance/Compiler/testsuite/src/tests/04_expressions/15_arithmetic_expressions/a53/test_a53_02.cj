
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a53_02

  @Level:         1

  @Assertion:   4.15(53) NEGATIVE_INFINITY ** y = NEGATIVE_INFINITY // for finite y > 0.0 and its value is equal to an
                odd integer
  @Description: Checks that NEGATIVE_INFINITY ** Float64.Max != NEGATIVE_INFINITY.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert

main() {
    Assert.isFalse(-Float64.Inf ** Float64.Max < 0.0)
}
