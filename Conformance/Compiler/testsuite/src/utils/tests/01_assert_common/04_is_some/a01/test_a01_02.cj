/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_04_a01_02
  @Assertion:       func isSome<T>(actual: Option<T>, reason!: String = "")

  @Description:     Negative cases: `isSome(None)` with exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(Option<Int64>.None)
    checkExceptionThrow(Option<(Int64, Int64)>.None)
}

func checkExceptionThrow<T>(none: Option<T>) {
    try {
        Assert.isSome(none)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.isSome(none, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
