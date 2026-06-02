/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_02_a03_02
  @Assertion:       macro matchOrThrow(expected: Tokens, actual: Tokens)

  @Description:     Negative cases for nested types: correct usages with exceptions and checking that exception messages
                    contain the macro name and arguments.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

  @Issue:           0006076
*/

import utils.macros.*

import std.ast.*

enum EnumWithTuple { A | B( (Int64, Int64) ) }
enum EnumWithEnum { C | D(EnumWithEnum) }

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

    // Enum with tuple.
    try {
        @matchOrThrow[B( (_, 0) )](B( (0, 1) ))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(B( (_, 0) )), quote(B( (0, 1) )))
    }
    try {
        @matchOrThrow[B( (0, _) )](B( (1, 0) ))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(B( (0, _) )), quote(B( (1, 0) )))
    }
    try {
        @matchOrThrow[B( (_, _) )](A)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(B( (_, _) )), quote(A))
    }

    // Enum with enum.
    try {
        @matchOrThrow[D(C)](D(D(C)))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(D(C)), quote(D(D(C))))
    }
    try {
        @matchOrThrow[D(_)](C)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(D(_)), quote(C))
    }

    // Tuple with enum.
    try {
        @matchOrThrow[(0, A)]( (0, B( (0, 0) )) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, A)), quote((0, B( (0, 0) ))))
    }
    try {
        @matchOrThrow[(0, B( (0, 0) ))]( (1, B( (0, 0) )) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, B( (0, 0) ))), quote((1, B( (0, 0) ))))
    }
    try {
        @matchOrThrow[(_, B( (_, 0) ))]( (0, B( (0, 1) )) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, B( (_, 0) ))), quote((0, B( (0, 1) ))))
    }
    try {
        @matchOrThrow[(0, _)]( (1, A) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, _)), quote((1, A)))
    }

    // Tuple with tuple.
    try {
        @matchOrThrow[(0, (0, 0))]( (0, (0, 1)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, (0, 0))), quote((0, (0, 1))))
    }
    try {
        @matchOrThrow[(0, (0, 0))]( (1, (0, 0)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, (0, 0))), quote((1, (0, 0))))
    }
    try {
        @matchOrThrow[(_, (_, 0))]( (0, (0, 1)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((_, (_, 0))), quote((0, (0, 1))))
    }
    try {
        @matchOrThrow[(0, (_, 0))]( (0, (0, 1)) )
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote((0, (_, 0))), quote((0, (0, 1))))
    }
}
