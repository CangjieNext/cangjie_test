/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_a01_01
  @Assertion:       func isNone<T>(actual: Option<T>, reason!: String = "")

  @Description:     Positive cases: `isNone(None)` with no exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    let int = Option<Int64>.None
    Assert.isNone(int)
    Assert.isNone(int, reason: "Must not fail")

    let tuple = Option<(Int64, Int64)>.None
    Assert.isNone(tuple)
    Assert.isNone(tuple, reason: "Must not fail1")
}
