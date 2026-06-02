/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// DEPENDENCE: ./line_number_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p line_number_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import line_number_utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

@Test
public class PartialUnorderedVerifyTest {
    public override func beforeAll(): Unit {
        @On(e.a()).returns("").anyTimes()
        @On(e.b()).returns("").anyTimes()
        @On(e.c()).returns("").anyTimes()
        @On(e.i1(_)).returns(()).anyTimes()
        @On(e.i2(_)).returns(()).anyTimes()
        @On(e.s1(_)).returns(()).anyTimes()
        @On(e.s2(_)).returns(()).anyTimes()
    }

    private let e = mock<Example1>()

    @TestCase
    func testSimple(): Unit {
        success {
            e.a()

            Verify.unordered(
                Partial,
                @Called(e.a()).once()
            )
        }
    }

    @TestCase
    func testSimple2(): Unit {
        success {
            e.a()
            e.a()
            e.b()

            Verify.unordered(
                Partial,
                @Called(e.a()).times(2)
            )
        }
    }

    @TestCase
    func testSimple3(): Unit {
        success {
            e.a()
            e.a()
            e.a()
            e.c()
            e.a()
            e.c()
            e.c()
            e.b()
            e.c()
            e.c()

            Verify.unordered(
                Partial,
                @Called(e.b()).once(),
                @Called(e.c()).times(5)
            )
        }
    }

    @TestCase
    func testDefaultCardinality(): Unit {
        success {
            e.a()
            e.b()
            e.c()
            e.c()

            Verify.unordered(
                Partial,
                @Called(e.b()),
                @Called(e.c())
            )
        }
    }

    @TestCase
    func nonDisjointStatements(): Unit {
        verificationFailure("NonDisjointStatements") {
            e.i1(1)
            e.i1(2)
            e.i1(2)

            Verify.unordered(
                Partial,
                @Called(e.i1(_)).times(3),
                @Called(e.i1(2)).times(2)
            )
        }
    }

    @TestCase
    func testUnmatchedStatements(): Unit {
        verificationFailure("UnmatchedStatements") {
            e.i1(1)
            e.i1(2)
            e.i1(2)

            Verify.unordered(
                Partial,
                @Called(e.i1(_)).times(3),
                @Called(e.a()).times(3)
            )
        }
    }

    @TestCase
    func testTooFewInvocations(): Unit {
        verificationFailure("TooFewInvocations") {
            e.i1(1)
            e.i1(2)
            e.i1(2)

            Verify.unordered(
                Partial,
                @Called(e.i1(2)).times(3)
            )
        }
    }

    @TestCase
    func testTooManyInvocations(): Unit {
        verificationFailure("TooManyInvocations") {
            e.i1(1)
            e.i1(2)
            e.i1(2)

            Verify.unordered(
                Partial,
                @Called(e.i1(_)).times(2)
            )
        }
    }

    @TestCase
    func testClearLog(): Unit {
        success {
            e.i1(1)
            e.i1(2)
            e.i1(2)

            Verify.unordered(
                Partial,
                @Called(e.i1(_)).times(3)
            )

            Verify.clearInvocationLog()

            e.i1(1)

            Verify.unordered(
                Partial,
                @Called(e.i1(_)).times(1)
            )

            Verify.clearInvocationLog()

            assertThrows<VerificationFailedException> {
                Verify.unordered(
                    Partial,
                    @Called(e.i1(_)).times(1)
                )
            }

            e.i1(1)
            Verify.unordered(
                Partial,
                @Called(e.i1(_)).times(1)
            )
        }
    }
}
