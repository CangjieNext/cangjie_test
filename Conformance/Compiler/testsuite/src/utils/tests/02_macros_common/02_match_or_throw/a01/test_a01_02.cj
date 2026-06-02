/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_02_a01_02
  @Assertion:       macro matchOrThrow(expected: Tokens, actual: Tokens)

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
        @matchOrThrow[A](B)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(A), quote(B))
    }
    try {
        @matchOrThrow[Test.A](C(0))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.A), quote(C(0)))
    }
    try {
        @matchOrThrow[C(0)](Test.A)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(0)), quote(Test.A))
    }
    try {
        @matchOrThrow[Test.C(0)](Test.C(Int64(1)))
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.C(0)), quote(Test.C(Int64(1))))
    }
    try {
        @matchOrThrow[Test.C(_)](A)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.C(_)), quote(A))
    }

    // Variable as actual value.
    var test = A
    try {
        @matchOrThrow[B](test)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(B), quote(test))
    }
    try {
        @matchOrThrow[Test.C(_)](test)
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.C(_)), quote(test))
    }
    test = C(0)
    try {
        @matchOrThrow[A](test)
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(A), quote(test))
    }
    try {
        @matchOrThrow[Test.C(1)](test)
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(Test.C(1)), quote(test))
    }

    // Function call as actual value.
    try {
        @matchOrThrow[A](f())
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(A), quote(f()))
    }
    try {
        @matchOrThrow[C(1)](f())
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(1)), quote(f()))
    }

    // An expression as actual value.
    try {
        @matchOrThrow[A](if (true) { B } else { C(0) })
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(A), quote(if (true) { B } else { C(0) }))
    }
    try {
        @matchOrThrow[C(0)](match (0) { case 0 => C(1) case _ => A })
        throw noException
    } catch (e: Exception) {
        checkExceptionMsg(e, quote(C(0)), quote(match (0) { case 0 => C(1) case _ => A }))
    }
}
