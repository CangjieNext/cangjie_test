
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a44_01

  @Level:         1

  @Assertion:   4.15(44) -1.0 ** NEGATIVE_INFINITY = 1.0
  @Description: Checks that -1.0 ** NEGATIVE_INFINITY = 1.0.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert

main() {
    Assert.approxEquals(1.0, -1.0 ** -Float64.Inf)
}
