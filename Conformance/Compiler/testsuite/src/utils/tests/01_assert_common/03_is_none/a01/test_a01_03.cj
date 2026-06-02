/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_a01_03
  @Assertion:       func isNone<T>(actual: Option<T>, reason!: String = "")

  @Description:     Check that the exception message contains the function name, actual value and reason (if any).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    // Check that the exception message contains a substring. Otherwise, throw an exception with an error `errorMsg`.
    let checkMsgContainsSubstr = { exceptionMsg: String, substr: String, errorMsg: String =>
        if (!exceptionMsg.contains(substr)) {
            throw Exception(errorMsg + " in '${exceptionMsg}'")
        }
    }
    let int = Some(0) // Can be converted to a string.
    let tuple = Some((0, 0)) // Cannot be converted to a string.
    let reason = "Must fail"

    let checkFuncName    = { msg: String => checkMsgContainsSubstr(msg, "isNone", "No function name") }
    let checkActualValue = { msg: String => checkMsgContainsSubstr(msg, int.toString(), "No actual value") }
    let checkReason      = { msg: String => checkMsgContainsSubstr(msg, reason, "No reason") }

    // There is an actual value, no reason.
    try {
        Assert.isNone(int)
        throw Exception("No expected exception")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkActualValue(exceptionMsg)
    }

    // There is an actual value and a reason.
    try {
        Assert.isNone(int, reason: reason)
        throw Exception("No expected exception1")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkActualValue(exceptionMsg)
        checkReason(exceptionMsg)
    }

    // No actual value, no reason.
    try {
        Assert.isNone(tuple)
        throw Exception("No expected exception2")
    } catch (e: AssertException) {
        checkFuncName(e.toString())
    }

    // No actual value, but there is a reason.
    try {
        Assert.isNone(tuple, reason: reason)
        throw Exception("No expected exception3")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkReason(exceptionMsg)
    }
}
