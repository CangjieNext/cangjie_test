/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_02_a01_02
  @Assertion:       func isTrue(actual: Bool, reason!: String = "")

  @Description:     Negative cases: `isTrue(false)` with exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    try {
        Assert.isTrue(false)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.isTrue(false, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
