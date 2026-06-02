/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_04_a01_01
  @Assertion:       func isSome<T>(actual: Option<T>, reason!: String = "")

  @Description:     Positive cases: `isSome(Some(...))` with no exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    let int = Some(0)
    Assert.isSome(int)
    Assert.isSome(int, reason: "Must not fail")

    let tuple = Some((0, 0))
    Assert.isSome(tuple)
    Assert.isSome(tuple, reason: "Must not fail1")
}
