/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_06_a01_03
  @Assertion:       func equals<T>(expected: T, actual: T, reason!: String = "")

  @Description:     Check that the exception message contains the function name, arguments and reason (if any).

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
    let int1 = 0 // Can be converted to a string.
    let int2 = 1
    let range1 = 0..0 // Cannot be converted to a string.
    let range2 = 0..1
    let reason = "Must fail"

    let checkFuncName = { msg: String => checkMsgContainsSubstr(msg, "equals", "No function name") }
    let checkArguments = { msg: String =>
        checkMsgContainsSubstr(msg, int1.toString(), "No first argument")
        checkMsgContainsSubstr(msg, int2.toString(), "No second argument")
    }
    let checkReason   = { msg: String => checkMsgContainsSubstr(msg, reason, "No reason") }

    // There are arguments, no reason.
    try {
        Assert.equals(int1, int2)
        throw Exception("No expected exception")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkArguments(exceptionMsg)
    }

    // There are arguments and a reason.
    try {
        Assert.equals(int1, int2, reason: reason)
        throw Exception("No expected exception1")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkArguments(exceptionMsg)
        checkReason(exceptionMsg)
    }

    // No arguments, no reason.
    try {
        Assert.equals(range1, range2)
        throw Exception("No expected exception2")
    } catch (e: AssertException) {
        checkFuncName(e.toString())
    }

    // No arguments, but there is a reason.
    try {
        Assert.equals(range1, range2, reason: reason)
        throw Exception("No expected exception3")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkReason(exceptionMsg)
    }
}
