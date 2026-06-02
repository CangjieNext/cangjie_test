
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a64_02

  @Level:         1

  @Assertion:   4.15(64) Cangjie also provides attributed macro to customize the operators’ overflow strategy. There
  are 3 overflow strategies can be used: throwing exceptions, wrapping and saturating. The corresponding attributed
  macros are: @OverflowThrowing, @OverflowWrapping and @OverflowSaturating. 
  @Description: Sample test checking the @OverflowThrowing macro.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

  @Issue: 0006421

*/

import utils.assert.Assert

@OverflowWrapping
func f(a: Int64, b: Int64) {
    a + b
}

main() {
    Assert.equals(Int64.Min, f(Int64.Max, 1))
}
