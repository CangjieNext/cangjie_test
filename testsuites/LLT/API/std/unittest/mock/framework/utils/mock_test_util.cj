/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package utils

import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.collection.*
import std.unicode.*

public func assertEquals<T>(a: T, b: T) where T <: Equatable<T> & ToString {
    if (a != b) {
        throw Exception("Not equal\nleft: ${a.toString()}\nright: ${b.toString()}")
    }
}

public func assert(condition: Bool) {
    if (!condition) {
        throw Exception("Assertion failed")
    }
}

public func assertThrows<T>(block: () -> Unit): T where T <: Exception {
    try {
        block()
        throw AssertException("Exception not thrown")
    } catch (e: T) {
        return e
    } catch (e: Exception) {
        e.printStackTrace()
        throw AssertException("Wrong exception thrown")
    }
}

public func runtimeException<T>(substrs: Array<String>, body: () -> Unit) where T <: Exception {
    ignoreExpectations {
        let e = assertThrows<T> {
            body()
        }

        assertContainsSubsequently(e.message, substrs)
    }
}

public func success(body: () -> Unit) {
    isolateFrameworkSessions<Unit> {
        MockFramework.openSession("test session", Verifiable)
        try {
            body()
        } finally {
            MockFramework.closeSession()
        }
    }
}

public func verificationFailure(body: () -> Unit): VerificationFailedException {
    isolateFrameworkSessions<VerificationFailedException> {
        MockFramework.openSession("test session", Verifiable)
        let e = assertThrows<VerificationFailedException> {
            body()
        }
        try {
            MockFramework.closeSession()
        } catch (e: ExpectationFailedException) {
            // ignore those for now
        }
        e
    }
}

public func verificationFailure(expectedReason: String, body: () -> Unit): VerificationFailedException {
    let e = verificationFailure(body)

    let actualReason = parseReason(e)
    if (actualReason != expectedReason) {
        throw Exception("Wrong failure reason ${actualReason}")
    }
    return e
}

public func verificationFailureReason(expectedReason: String, expectedSubstrs: Array<String>, body: () -> Unit): Unit {
    let e = verificationFailure(body)

    let actualReason = parseReason(e)
    if (actualReason != expectedReason) {
        throw Exception("Wrong failure reason ${actualReason}")
    }

    assertContainsSubsequently(e.message, expectedSubstrs)
}

public func assertContainsSubsequently(str: String, expectedSubstrs: Array<String>): Unit {
    var currentIndex = 0
    for (substr in expectedSubstrs) {
        currentIndex = str.indexOf(substr, currentIndex) ?? throw Exception(
            "Couldn't find substr ${substr}, currentIndex=${currentIndex}\n${str}")
        currentIndex++
    }

    for (substr in expectedSubstrs) {
        if (let Some(_) <- str.indexOf(substr, currentIndex)) {
            throw AssertException("Message shouldn't contain more ${substr}\n${str}")
        }
    }
}

public func expectationFailure(substrs: Array<String>, body: () -> Unit): Unit {
    exceptionOnSessionClose<ExpectationFailedException>(substrs, body)
}

public func exceptionOnSessionClose<T>(substrs: Array<String>, body: () -> Unit): T where T <: Exception {
    isolateFrameworkSessions<T> {
        MockFramework.openSession("test session", Verifiable)
        let closed = Box(false)
        let e = try {
            body()
            assertThrows<T> {
                closed.value = true
                MockFramework.closeSession()
            }
        } finally {
            if (!closed.value) {
                closed.value = true
                MockFramework.closeSession()
            }
        }
        assertContainsSubsequently(e.message, substrs)
        e
    }
}

public func ignoreExpectations(body: () -> Unit) {
    isolateFrameworkSessions<Unit> {
        MockFramework.openSession("test session", Verifiable)
        try {
            body()
        } finally {
            try {
                MockFramework.closeSession()
            } catch (e: Exception) {
                // ignore misconfiguration checks as well
            }
        }
    }
}

public func verificationFailureReport(expectedReason: String, substringsToCheck: Array<String>, body: () -> Unit): Unit {
    let e = verificationFailure(expectedReason, body)
    let message = e.message
    for (substring in substringsToCheck) {
        @PowerAssert(message.contains(substring))
    }
}

public let prefixToReason = [
    ("The following invocations", "UnmatchedInvocations"),
    ("Unwanted", "UnwantedInteractions"),
    ("Unexpected invocation", "UnexpectedInvocation"),
    ("Too many invocations", "TooManyInvocations"),
    ("Too few invocations", "TooFewInvocations"),
    ("The following statements", "UnmatchedStatements"),
    ("The following invocation:", "NonDisjointStatements")
]

public func parseReason(vfe: VerificationFailedException): String {
    let reasonLine = vfe.message.split("\n")[1].trim()
    for ((prefix, expectedReason) in prefixToReason) {
        if (reasonLine.startsWith(prefix)) {
            return expectedReason
        }
    }
    throw Exception("Unknown failure reason:\n ${vfe.message}")
}

public func misconfigurationFailure(substr: String, body: () -> Unit) {
    checkMisconfigurationMessage(assertThrows<MockFrameworkException>(body), substr)
}

public func shouldFailOnSessionClose(substr: String, body: () -> Unit) {
    checkMisconfigurationMessage(exceptionOnSessionClose<MockFrameworkException>([], body), substr)
}

public func checkMisconfigurationMessage(e: MockFrameworkException, headerSubstr: String) {
    let message = e.message
    @PowerAssert(message.contains("Misconfiguration failure"))
    @PowerAssert(message.contains(headerSubstr))
}

public func testSessions(body: () -> Unit) {
    isolateFrameworkSessions<Unit> {
        body()
    }
}

func isolateFrameworkSessions<T>(body: () -> T): T {
    // remove session automatically generated by test framework
    MockFramework.closeSession()
    try {
        body()
    } finally {
        MockFramework.openSession("dummy test session", Verifiable)
    }
}
