/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_a01_02
  @Assertion:       macro notMatchOrThrow(unexpected: Tokens, actual: Tokens)

  @Description:     Negative cases for enums: correct usages with exceptions and checking that exception messages
                    contain the macro name and arguments.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import utils.macros.*

import std.ast.*

enum Test { A | B | C(Int64) }
func f() { C(0) }

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
        @notMatchOrThrow[A](A)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(A), quote(A))
    }
    try {
        @notMatchOrThrow[Test.B](B)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.B), quote(B))
    }
    try {
        @notMatchOrThrow[C(0)](Test.C(0))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(0)), quote(Test.C(0)))
    }
    try {
        @notMatchOrThrow[Test.C(_)](Test.C(Int64(0)))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.C(_)), quote(Test.C(Int64(0))))
    }

    // Variable as actual value.
    var test = A
    try {
        @notMatchOrThrow[A](test)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(A), quote(test))
    }
    test = C(0)
    try {
        @notMatchOrThrow[C(0)](test)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(0)), quote(test))
    }
    try {
        @notMatchOrThrow[Test.C(_)](test)
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.C(_)), quote(test))
    }

    // Function call as actual value.
    try {
        @notMatchOrThrow[C(0)](f())
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(0)), quote(f()))
    }
    try {
        @notMatchOrThrow[C(_)](f())
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(_)), quote(f()))
    }

    // An expression as actual value.
    try {
        @notMatchOrThrow[A](if (true) { A } else { C(0) })
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(A), quote(if (true) { A } else { C(0) }))
    }
    try {
        @notMatchOrThrow[C(0)](match (0) { case 0 => C(0) case _ => A })
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(0)), quote(match (0) { case 0 => C(0) case _ => A }))
    }
}
