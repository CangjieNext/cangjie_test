
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a37_01

  @Level:         1

  @Assertion:   4.15(37) 0.0 ** NEGATIVE_INFINITY = POSITIVE_INFINITY
  @Description: Checks that 0.0 ** NEGATIVE_INFINITY = POSITIVE_INFINITY.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert

main() {
    let res = 0.0 ** -Float64.Inf
    Assert.isTrue(res.isInf() && res > 0.0)
}
