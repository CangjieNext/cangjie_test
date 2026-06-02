/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_09_a01_01
  @Assertion:       func fail(reason!: String = "")

  @Description:     Check that the exception message contains the function name and reason (if any).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import utils.assert.*

main() {
    try {
        Assert.fail()
        throw Exception("No expected AssertException")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        if (!exceptionMsg.contains("Assert.fail")) {
            throw Exception("No function name in '${exceptionMsg}'")
        }
    }

    let reason = "Must fail"
    try {
        Assert.fail(reason: reason)
        throw Exception("No expected AssertException1")
    } catch (e: AssertException) {
        let exceptionMsg = e.toString()
        if (!exceptionMsg.contains("Assert.fail")) {
            throw Exception("No function name in '${exceptionMsg}'")
        }
        if (!exceptionMsg.contains(reason)) {
            throw Exception("No reason in '${exceptionMsg}'")
        }
    }
}
