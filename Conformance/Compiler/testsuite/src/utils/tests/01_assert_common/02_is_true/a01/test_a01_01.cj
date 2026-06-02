/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_02_a01_01
  @Assertion:       func isTrue(actual: Bool, reason!: String = "")

  @Description:     Positive cases: `isTrue(true)` with no exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.isTrue(true)
    Assert.isTrue(true, reason: "Must not fail")
}
