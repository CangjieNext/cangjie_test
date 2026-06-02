/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_06_a01_02
  @Assertion:       func equals<T>(expected: T, actual: T, reason!: String = "")

  @Description:     Negative cases: `equals(var1, var2)` with exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(0, 1)
    checkExceptionThrow(0..0, 0..1)
}

func checkExceptionThrow<T>(var1: T, var2: T) where T <: Equatable<T> {
    try {
        Assert.equals(var1, var2)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.equals(var1, var2, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
