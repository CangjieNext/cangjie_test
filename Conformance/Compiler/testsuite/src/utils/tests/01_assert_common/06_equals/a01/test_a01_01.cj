/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_06_a01_01
  @Assertion:       func equals<T>(expected: T, actual: T, reason!: String = "")

  @Description:     Positive cases: `equals(var1, var1)` with no exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.equals(0, 0)
    Assert.equals(0, 0, reason: "Must not fail")

    Assert.equals(0..0, 0..0)
    Assert.equals(0..0, 0..0, reason: "Must not fail1")
}
