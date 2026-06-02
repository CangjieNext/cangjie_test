/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a01_03
  @Assertion:       func approxEquals(expected: Float64, actual: Float64, reason!: String = "")

  @Description:     Check that the exception message contains the function name, arguments and reason (if any).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

import std.convert.*

main() {
    checkExceptionMessage(100.0, 101.0)
    checkExceptionMessage(-100.0, -101.0)

    checkExceptionMessage(.0, Float64.MinNormal)
    checkExceptionMessage(-0.0, -Float64.MinNormal)

    checkExceptionMessage(Float64.Max, Float64.Inf)
    checkExceptionMessage(Float64.Min, -Float64.Inf)

    checkExceptionMessage(Float64.NaN, .0)
}

func checkExceptionMessage(var1: Float64, var2: Float64) {
    // Check that the exception message contains a substring. Otherwise, throw an exception with an error `errorMsg`.
    let checkMsgContainsSubstr = { exceptionMsg: String, substr: String, errorMsg: String =>
        if (!exceptionMsg.contains(substr)) {
            throw Exception(errorMsg + " in '${exceptionMsg}'")
        }
    }
    let checkFuncName = { msg: String => checkMsgContainsSubstr(msg, "approxEquals64", "No function name") }
    let checkArguments = { msg: String =>
        checkMsgContainsSubstr(msg, var1.format(".30e"), "No first argument")
        checkMsgContainsSubstr(msg, var2.format(".30e"), "No second argument")
    }

    try {
        Assert.approxEquals(var1, var2)
        throw Exception("No expected exception")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkArguments(exceptionMsg)
    }

    let reason = "Must fail"
    try {
        Assert.approxEquals(var1, var2, reason: reason)
        throw Exception("No expected exception1")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        checkFuncName(exceptionMsg)
        checkArguments(exceptionMsg)
        checkMsgContainsSubstr(exceptionMsg, reason, "No reason")
    }
}
