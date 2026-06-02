/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_a01_02
  @Assertion:       func isNone<T>(actual: Option<T>, reason!: String = "")

  @Description:     Negative cases: `isNone(Some(...))` with exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(Some(0))
    checkExceptionThrow(Some((0, 0)))
}

func checkExceptionThrow<T>(some: Option<T>) {
    try {
        Assert.isNone(some)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.isNone(some, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
