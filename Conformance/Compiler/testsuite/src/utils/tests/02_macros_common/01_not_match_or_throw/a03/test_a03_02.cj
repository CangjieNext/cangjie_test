/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_a03_02
  @Assertion:       macro notMatchOrThrow(unexpected: Tokens, actual: Tokens)

  @Description:     Negative cases for nested types: correct usages with exceptions and checking that exception messages
                    contain the macro name and arguments.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.macros.*

import std.ast.*

enum EnumWithTuple { A | B( (Int64, Int64) ) }
enum EnumWithEnum { C | D(EnumWithEnum) }

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

    // Enum with tuple.
    try {
        @notMatchOrThrow[B( (0, 0) )](B( (0, 0) ))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(B( (0, 0) )), quote(B( (0, 0) )))
    }
    try {
        @notMatchOrThrow[B( (_, 0) )](B( (0, 0) ))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(B( (_, 0) )), quote(B( (0, 0) )))
    }
    try {
        @notMatchOrThrow[B( (0, _) )](B( (0, 0) ))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(B( (0, _) )), quote(B( (0, 0) )))
    }

    // Enum with enum.
    try {
        @notMatchOrThrow[D(C)](D(C))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(D(C)), quote(D(C)))
    }
    try {
        @notMatchOrThrow[D(_)](D(D(C)))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(D(_)), quote(D(D(C))))
    }

    // Tuple with enum.
    try {
        @notMatchOrThrow[(0, B( (0, 0) ))]( (0, B( (0, 0) )) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, B( (0, 0) ))), quote((0, B( (0, 0) ))))
    }
    try {
        @notMatchOrThrow[(_, B( (_, 0) ))]( (0, B( (0, 0) )) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, B( (_, 0) ))), quote((0, B( (0, 0) ))))
    }
    try {
        @notMatchOrThrow[(0, _)]( (0, A) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, _)), quote((0, A)))
    }

    // Tuple with tuple.
    try {
        @notMatchOrThrow[(0, (0, 0))]( (0, (0, 0)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, (0, 0))), quote((0, (0, 0))))
    }
    try {
        @notMatchOrThrow[(_, (_, 0))]( (0, (0, 0)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, (_, 0))), quote((0, (0, 0))))
    }
    try {
        @notMatchOrThrow[(0, (_, 0))]( (0, (0, 0)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, (_, 0))), quote((0, (0, 0))))
    }
}
