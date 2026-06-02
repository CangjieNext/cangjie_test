/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_08_a01_03
  @Assertion:       func throws(f: ()->Unit, check!: (Exception)->Bool = { unused => true }, reason!: String = "")

  @Description:     Check that the exception message contains the function name and reason (if any).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    let checkFuncName = { exceptionMsg: String =>
        if (!exceptionMsg.contains("throws")) {
            throw Exception("No function name in '${exceptionMsg}'")
        }
    }
    let reason = "Must fail"
    let checkReason = { exceptionMsg: String =>
        if (!exceptionMsg.contains(reason)) {
            throw Exception("No reason in '${exceptionMsg}'")
        }
    }

    // No check, no reason.
    try {
        Assert.throws({ => return })
        throw Exception("No expected AssertException")
    } catch (e: AssertException) {
        checkFuncName(e.toString())
    }
    // No check, but there is a reason.
    try {
        Assert.throws({ => return }, reason: reason)
        throw Exception("No expected AssertException1")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkReason(exceptionMsg)
    }

    let exception = IllegalArgumentException("Hello, Cangjie!")
    let checkFn = { e: Exception => e.toString().contains("Hello, World!") }
    // There is a check, no reason.
    try {
        Assert.throws({ => throw exception }, check: checkFn)
        throw Exception("No expected AssertException2")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        if (!exceptionMsg.contains(exception.toString())) {
            throw Exception("No unexpected exception message (${exception}) in '${exceptionMsg}'")
        }
    }
    // There is a check and a reason.
    try {
        Assert.throws({ => throw exception }, check: checkFn, reason: reason)
        throw Exception("No expected AssertException3")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkReason(exceptionMsg)
        if (!exceptionMsg.contains(exception.toString())) {
            throw Exception("No unexpected exception message (${exception}) in '${exceptionMsg}'")
        }
    }
}
