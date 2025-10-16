/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f

// ASSERT: scan-15 Execution time exceeded specified timeout.
// ASSERT: scan-2 Expect Failed:
// ASSERT: scan-not No timeout
// ASSERT: scan-1 Timeout in Test.withTimeout!
// ASSERT: scan-1 Timeout in Test.withTimeout_expectBefore!
// ASSERT: scan-1 Timeout in Test.assertIsACancellationPoint!
// ASSERT: scan-1 Timeout in Test.expectIsACancellationPoint!
// ASSERT: scan-1 Timeout in Test.customAssertIsACancellationPoint!
// ASSERT: scan-1 Timeout in Test.customExpectIsACancellationPoint!
// ASSERT: scan-1 Timeout in Test.powerAssertIsACancellationPoint!
// ASSERT: scan-1 Timeout in Test.assertThrowsIsACancellationPointSuccess!
// ASSERT: scan-1 Timeout in Test.assertThrowsIsACancellationPointWrongException!
// ASSERT: scan-1 Timeout in Test.assertThrowsIsACancellationPointNoException!
// ASSERT: scan-1 Timeout in Test.expectThrowsIsACancellationPointSuccess!
// ASSERT: scan-1 Timeout in Test.expectThrowsIsACancellationPointWrongException!
// ASSERT: scan-1 Timeout in Test.expectThrowsIsACancellationPointNoException!
// ASSERT: scan-1 Timeout in Test.failIsACancellationPoint!
// ASSERT: scan-1 Timeout in Test.failExpectIsACancellationPoint!

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func custom<V>(ctx: AssertionCtx, _: V): Unit {}

func timeouts(f: () -> Unit) {
    try {
        f()
        println("No timeout")
    } catch (e: Exception) {
        // Hack for testing, it never should be used in production.
        if (e.toString() != "UnittestTimeoutException") {
            println("No timeout")
        }
        throw e
    }
}

@Test
class Test {
    @TestCase
    @Timeout[Duration.second]
    func noTimeout() {
        @Expect(false)
    }

    @TestCase
    @Timeout[Duration.second]
    func withTimeout() {
        sleep(Duration.second * 2)
    }

    @TestCase
    @Timeout[Duration.second]
    func withTimeout_expectBefore() {
        @Expect(false)
        sleep(Duration.second * 2)
    }

    @TestCase
    @Timeout[Duration.second]
    func assertIsACancellationPoint() {
        sleep(Duration.second * 2)
        timeouts { @Assert(false) }
    }

    @TestCase
    @Timeout[Duration.second]
    func expectIsACancellationPoint() {
        sleep(Duration.second * 2)
        timeouts { @Expect(false) }
    }

    @TestCase
    @Timeout[Duration.second]
    func customAssertIsACancellationPoint() {
        sleep(Duration.second * 2)
        timeouts { @Assert[custom](false) }
    }

    @TestCase
    @Timeout[Duration.second]
    func customExpectIsACancellationPoint() {
        sleep(Duration.second * 2)
        timeouts { @Expect[custom](false) }
    }

    @TestCase
    @Timeout[Duration.second]
    func powerAssertIsACancellationPoint() {
        sleep(Duration.second * 2)
        timeouts { @PowerAssert(false) }
    }

    @TestCase
    @Timeout[Duration.second]
    func assertThrowsIsACancellationPointSuccess() {
        sleep(Duration.second * 2)
        timeouts { @AssertThrows({ throw Exception() }) }
    }

    @TestCase
    @Timeout[Duration.second]
    func assertThrowsIsACancellationPointWrongException() {
        sleep(Duration.second * 2)
        timeouts { @AssertThrows[ArithmeticException]({ throw Exception() }) }
    }

    @TestCase
    @Timeout[Duration.second]
    func assertThrowsIsACancellationPointNoException() {
        sleep(Duration.second * 2)
        timeouts { @AssertThrows(true) }
    }

    @TestCase
    @Timeout[Duration.second]
    func expectThrowsIsACancellationPointSuccess() {
        sleep(Duration.second * 2)
        timeouts { @ExpectThrows({ throw Exception() }) }
    }

    @TestCase
    @Timeout[Duration.second]
    func expectThrowsIsACancellationPointWrongException() {
        sleep(Duration.second * 2)
        timeouts { @ExpectThrows[ArithmeticException]({ throw Exception() }) }
    }

    @TestCase
    @Timeout[Duration.second]
    func expectThrowsIsACancellationPointNoException() {
        sleep(Duration.second * 2)
        timeouts { @ExpectThrows(true) }
    }

    @TestCase
    @Timeout[Duration.second]
    func failIsACancellationPoint() {
        sleep(Duration.second * 2)
        timeouts { @Fail("") }
    }

    @TestCase
    @Timeout[Duration.second]
    func failExpectIsACancellationPoint() {
        sleep(Duration.second * 2)
        timeouts { @FailExpect("") }
    }
}

main(): Int64 {
    let config = Configuration()
    config.set(KeyTimeoutHandler.timeoutHandler, { info => println("Timeout in ${info.suiteName}.${info.caseName}!")})
    Test().asTestSuite().runTests(config).reportTo(ConsoleReporter())
    return 0
}
