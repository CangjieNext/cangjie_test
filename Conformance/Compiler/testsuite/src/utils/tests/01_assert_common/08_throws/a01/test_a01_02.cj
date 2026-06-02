/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_08_a01_02
  @Assertion:       func throws(f: ()->Unit, check!: (Exception)->Bool = { unused => true }, reason!: String = "")

  @Description:     Negative cases with exceptions: no exception was thrown, or the `check` function returned `false`.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    let noThrow = { => return }
    try {
        Assert.throws(noThrow)
        throw Exception("No expected AssertException")
    } catch (ok: AssertException) {}
    try {
        Assert.throws(noThrow, reason: "Must fail")
        throw Exception("No expected AssertException1")
    } catch (ok: AssertException) {}

    let throwIllegal = { => throw IllegalArgumentException() }
    let checkFn = { e: Exception => e is SpawnException }
    try {
        Assert.throws(throwIllegal, check: checkFn)
        throw Exception("No expected AssertException2")
    } catch (ok: AssertException) {}
    try {
        Assert.throws(throwIllegal, check: checkFn, reason: "Must fail1")
        throw Exception("No expected AssertException3")
    } catch (ok: AssertException) {}
}
