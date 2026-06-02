/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_a02_02
  @Assertion:       macro notMatchOrThrow(unexpected: Tokens, actual: Tokens)

  @Description:     Negative cases for tuples: correct usages with exceptions and checking that exception messages
                    contain the macro name and arguments.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import utils.macros.*

import std.ast.*

func getOne() { 1 }
func getPair() { (1, 1) }

main() {
    let noException = Exception("No expected exception")
    let checkExceptionMsg = { e: Exception, unexpected: Tokens, actual: Tokens =>
        let exceptionMsg = e.toString()
        if (exceptionMsg == noException.toString()) {
            throw noException
        }

        if (!exceptionMsg.contains("notMatchOrThrow")) {
            throw Exception("No function name in '${exceptionMsg}'")
        }
        if (!exceptionMsg.contains("'${unexpected}'")) {
            throw Exception("No unexpected tokens '${unexpected}' in '${exceptionMsg}'")
        }
        if (!exceptionMsg.contains("'${actual}'")) {
            throw Exception("No actual tokens '${actual}' in '${exceptionMsg}'")
        }
    }

    // Constant as actual value.
    try {
        @notMatchOrThrow[(0, 0)]( (0, 0) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, 0)), quote((0, 0)))
    }
    try {
        @notMatchOrThrow[(_, 0)]( (0, 0) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, 0)), quote((0, 0)))
    }
    try {
        @notMatchOrThrow[(0, _)]( (Int32(0), Int64(0)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, _)), quote((Int32(0), Int64(0))))
    }

    // Variable as actual value.
    let test = (0, 0)
    try {
        @notMatchOrThrow[(0, 0)](test)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, 0)), quote(test))
    }
    // Function call as actual value.
    try {
        @notMatchOrThrow[(1, 1)](getPair())
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((1, 1)), quote(getPair()))
    }
    // An expression as actual value.
    try {
        @notMatchOrThrow[(_, 0)](if (true) { (0, 0) } else { (1, 0) })
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, 0)), quote(if (true) { (0, 0) } else { (1, 0) }))
    }
    try {
        @notMatchOrThrow[(1, _)]( (getOne(), 0) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((1, _)), quote((getOne(), 0)))
    }
}
