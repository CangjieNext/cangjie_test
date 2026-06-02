/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_01_a01_01
  @Assertion:       func isFalse(actual: Bool, reason!: String = "")

  @Description:     Positive cases: `isFalse(false)` with no exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.isFalse(false)
    Assert.isFalse(false, reason: "Must not fail")
}
