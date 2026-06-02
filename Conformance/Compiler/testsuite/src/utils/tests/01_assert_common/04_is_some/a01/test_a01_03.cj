/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_04_a01_03
  @Assertion:       func isSome<T>(actual: Option<T>, reason!: String = "")

  @Description:     Check that the exception message contains the function name and reason (if any).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    let checkFuncName = { exceptionMsg: String =>
        if (!exceptionMsg.contains("isSome")) {
            throw Exception("No function name in '${exceptionMsg}'")
        }
    }

    let none = Option<Int64>.None
    try {
        Assert.isSome(none)
        throw Exception("No expected exception")
    } catch (e: AssertException) {
        checkFuncName(e.toString())
    }

    let reason = "Must fail"
    try {
        Assert.isSome(none, reason: reason)
        throw Exception("No expected exception1")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        if (!exceptionMsg.contains(reason)) {
            throw Exception("No reason in '${exceptionMsg}'")
        }
    }
}
