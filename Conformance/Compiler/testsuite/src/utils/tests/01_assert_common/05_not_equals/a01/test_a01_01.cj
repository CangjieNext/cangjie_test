/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_05_a01_01
  @Assertion:       func notEquals<T>(unexpected: T, actual: T, reason!: String = "")

  @Description:     Positive cases: `notEquals(var1, var2)` with no exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.notEquals(0, 1)
    Assert.notEquals(0, 1, reason: "Must not fail")

    Assert.notEquals(0..0, 0..1)
    Assert.notEquals(0..0, 0..1, reason: "Must not fail1")
}
