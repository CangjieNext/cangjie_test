/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package utils.assert

import std.convert.*
import std.math.abs
import std.process.*

public class Assert {

    static public func isFalse(actual: Bool, reason!: String = "") {
        if (actual) {
            fail("isFalse", reason)
        }
    }

    static public func isTrue(actual: Bool, reason!: String = "") {
        if (!actual) {
            fail("isTrue", reason)
        }
    }

    static public func isNone<T>(actual: Option<T>, reason!: String = "") {
        let argStr = if (actual is ToString) { "(${actual as ToString ?? ""})" } else { "" }
        match (actual) {
            case None => ()
            case Some(_) => fail("isNone" + argStr, reason)
        }
    }

    static public func isSome<T>(actual: Option<T>, reason!: String = "") {
        match (actual) {
            case None => fail("isSome", reason)
            case Some(_) => ()
        }
    }

    // The == operator is used to check.
    static public func notEquals<T>(unexpected: T, actual: T, reason!: String = "") where T <: Equatable<T> {
        if (unexpected == actual) {
            let argStr = if (actual is ToString) {
                "(unexpected='${unexpected as ToString ?? ""}', actual='${actual as ToString ?? ""}')"
            } else {
                ""
            }
            fail("notEquals" + argStr, reason)
        }
    }

    // The != operator is used to check. Nan's are considered equivalent.
    static public func equals<T>(expected: T, actual: T, reason!: String = "") where T <: Equatable<T> {
        if (!bothAreNans(expected, actual) && expected != actual) {
            let argStr = if (actual is ToString) {
                "(expected='${expected as ToString ?? ""}', actual='${actual as ToString ?? ""}')"
            } else {
                ""
            }
            fail("equals" + argStr, reason)
        }
    }

    // Checks if the difference between `expected` and `actual` values is within a tolerance that is equal to the
    // `expected` value decreased by 10^4 or 10^3 or 10^2 times depending on the precision of the floating point
    // numbers.
    static public func approxEquals(expected: Float64, actual: Float64, reason!: String = "") {
        approxEquals(expected, actual, abs(expected) * 1e-4, reason: reason)
    }
    static public func approxEquals(expected: Float32, actual: Float32, reason!: String = "") {
        approxEquals(expected, actual, abs(expected) * 1e-3f32, reason: reason)
    }
    static public func approxEquals(expected: Float16, actual: Float16, reason!: String = "") {
        approxEquals(expected, actual, abs(expected) * 1e-2f16, reason: reason)
    }

    // Checks if the difference between `expected` and `actual` values is within the given `tolerance`.
    static public func approxEquals(expected: Float64, actual: Float64, tolerance: Float64, reason!: String = "") {
        let actualTolerance = abs(expected - actual)
        if (isNan(actualTolerance) || isNan(tolerance) || actualTolerance > tolerance) {
            fail("""
approxEquals64(expected =${expected.format(".30e")},
                                           actual   =${actual.format(".30e")},
                                           tolerance=${tolerance})""", reason)
        }
    }
    static public func approxEquals(expected: Float32, actual: Float32, tolerance: Float32, reason!: String = "") {
        let actualTolerance = abs(expected - actual)
        if (isNan(actualTolerance) || isNan(tolerance) || actualTolerance > tolerance) {
            fail("""
approxEquals32(expected =${expected.format(".20e")},
                                           actual   =${actual.format(".20e")},
                                           tolerance=${tolerance})""", reason)
        }
    }
    static public func approxEquals(expected: Float16, actual: Float16, tolerance: Float16, reason!: String = "") {
        let actualTolerance = abs(expected - actual)
        if (isNan(actualTolerance) || isNan(tolerance) || actualTolerance > tolerance) {
            fail("""
approxEquals16(expected =${expected.format(".10e")},
                                           actual   =${actual.format(".10e")},
                                           tolerance=${tolerance})""", reason)
        }
    }

    // Calls the function `f` and checks if it throws an exception.
    //
    // The optional `check` function is needed to check that an exception has the expected type and/or message.
    static public func throws(f: ()->Unit,
                              check!: (Exception)->Bool = { unused => true },
                              reason!: String = "") {
        try {
            f()
        } catch (exception: Exception) {
            if (check(exception)) {
                return
            }
            let exceptionMessage = exception.toString().lazySplit('\n').next() ?? ""
            let reasonStr = if (reason.isEmpty()) { "" } else { " Reason: '${reason}'" }
            throw AssertException("Assertion 'throws' failed: the exception with the message '${exceptionMessage}' " +
                "is not what was expected.${reasonStr}")
        }
        fail("throws", reason)
    }

    // Marks an unreachable code branch.
    static public func fail(reason!: String = "") {
        let reasonStr = if (reason.isEmpty()) { "" } else { " with reason '${reason}'" }
        throw AssertException("Assert.fail is triggered${reasonStr}")
    }

    // Completes a test successfully.
    static public func pass() {
        Process.current.exit(0)
    }

    // Guaranteed returns 0 at runtime even with optimizations. 
    static public func getRuntimeZero(args: Array<String>) {
        try {
            if (args[0] != "") {
                return 0
            }
        } catch (_: IndexOutOfBoundsException) {
            return 0
        }
        return 0
    }
}

public class AssertException <: Exception {
    private let assertionMessage: String

    public init(message: String) {
        assertionMessage = message
    }

    public override func toString() {
        "AssertException: " + assertionMessage
    }
}

func fail(assertionName: String, reason: String) {
    let reasonStr = if (reason.isEmpty()) { "" } else { " with reason '${reason}'" }
    throw AssertException("Assertion '${assertionName}' failed${reasonStr}")
}

// Returns `true` if the value is Float* and equals NaN. If the value is not a Float* or value.isNaN() returns false,
// this func returns false.
func isNan<T>(value: T) {
    if (value is Float64 && ((value as Float64)?.isNaN() ?? false)) {
        return true
    }
    if (value is Float32 && ((value as Float32)?.isNaN() ?? false)) {
        return true
    }
    if (value is Float16 && ((value as Float16)?.isNaN() ?? false)) {
        return true
    }
    return false
}

// Returns `true` if the values are Float* and both are NaNs. If they are not Float* or at least one of them is not NaN
// then `false`. Compile error when trying to call this function with Floats of different precision.
func bothAreNans<T>(expected: T, actual: T) {
    isNan(expected) && isNan(actual)
}
