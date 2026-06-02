
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a39_01

  @Level:         1

  @Assertion:   4.15(39) 0.0 ** POSITIVE_INFINITY = 0.0
  @Description: Checks that 0.0 ** POSITIVE_INFINITY = 0.0.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6075,6320
*/

import utils.assert.Assert

main() {
    Assert.equals(0.0, 0.0 ** Float64.Inf)
}
