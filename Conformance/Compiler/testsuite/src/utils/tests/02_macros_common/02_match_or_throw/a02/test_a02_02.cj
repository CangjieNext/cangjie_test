/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_02_a02_02
  @Assertion:       macro matchOrThrow(expected: Tokens, actual: Tokens)

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
    let checkExceptionMsg = { e: Exception, expected: Tokens, actual: Tokens =>
        let exceptionMsg = e.toString()
        if (exceptionMsg == noException.toString()) {
            throw noException
        }

        if (!exceptionMsg.contains("matchOrThrow")) {
            throw Exception("No function name in '${exceptionMsg}'")
        }
        if (!exceptionMsg.contains("'${expected}'")) {
            throw Exception("No expected tokens '${expected}' in '${exceptionMsg}'")
        }
        if (!exceptionMsg.contains("'${actual}'")) {
            throw Exception("No actual tokens '${actual}' in '${exceptionMsg}'")
        }
    }

    // Constant as actual value.
    try {
        @matchOrThrow[(0, 0)]( (0, 1) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, 0)), quote((0, 1)))
    }
    try {
        @matchOrThrow[(_, 0)]( (0, 1) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, 0)), quote((0, 1)))
    }
    try {
        @matchOrThrow[(0, _)]( (Int32(1), Int64(0)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, _)), quote((Int32(1), Int64(0))))
    }

    // Variable as actual value.
    let test = (0, 0)
    try {
        @matchOrThrow[(1, 0)](test)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((1, 0)), quote(test))
    }
    // Function call as actual value.
    try {
        @matchOrThrow[(1, 0)](getPair())
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((1, 0)), quote(getPair()))
    }
    // An expression as actual value.
    try {
        @matchOrThrow[(_, 0)](if (true) { (0, 1) } else { (0, 0) })
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, 0)), quote(if (true) { (0, 1) } else { (0, 0) }))
    }
    try {
        @matchOrThrow[(0, _)]( (getOne(), 0) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, _)), quote((getOne(), 0)))
    }
}
