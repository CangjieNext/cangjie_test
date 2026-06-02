/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
// DEPENDENCE: ./utils
// DEPENDENCE: ./line_number_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p line_number_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import line_number_utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

@Test
public class VerificationFailedReasonTest {
    @BeforeAll
    func beforeAll(): Unit {
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
    func unorderedUnmatchedInvocations(): Unit {
        verificationFailureReason(
            "UnmatchedInvocations",
            ["e.a()", "e.b()", "e.a()"]
        ) {
            e.a()
            e.b()
            e.a()
            e.c()
            e.c()

            Verify.unordered(@Called(e.c()).times(2))
        }
    }

    @TestCase
    func unorderedUnmatchedStatements(): Unit {
        verificationFailureReason(
            "UnmatchedStatements",
            ["e.a()", "e.b()"]
        ) {
            e.c()
            e.c()

            Verify.unordered(
                @Called(e.c()).times(2),
                @Called(e.a()).once(),
                @Called(e.b()).times(4)
            )
        }
    }

    @TestCase
    func orderedUnmatchedInvocations(): Unit {
        verificationFailureReason(
            "UnmatchedInvocations",
            ["e.a", "e.c", "e.c"]
        ) {
            e.a()
            e.b()
            e.a()
            e.c()
            e.c()

            Verify.ordered(
                @Called(e.a()),
                @Called(e.b())
            )
        }
    }

    @TestCase
    func orderedUnmatchedStatements(): Unit {
        verificationFailureReason(
            "UnmatchedStatements",
            ["e.a", "e.b"]
        ) {
            e.c()
            e.c()

            Verify.ordered(
                @Called(e.c()),
                @Called(e.c()),
                @Called(e.a()).once(),
                @Called(e.b()).times(4)
            )
        }
    }

    @TestCase
    func orderedTooFewInvocations(): Unit {
        verificationFailureReason(
            "TooFewInvocations",
            ["e.a", "Required: exactly 2", "Actual: 1"]
        ) {
            e.c()
            e.c()
            e.a()
            e.b()

            Verify.ordered(
                @Called(e.c()),
                @Called(e.c()),
                @Called(e.a()).times(2),
                @Called(e.b())
            )
        }
    }

    @TestCase
    func unorderedTooFewInvocations(): Unit {
        verificationFailureReason(
            "TooFewInvocations",
            ["e.c()", "Required: at least 5", "Actual: 4"]
        ) {
            e.c()
            e.c()
            e.c()
            e.c()

            Verify.unordered(@Called(e.c()).atLeastTimes(5))
        }
    }

    @TestCase
    func simpleTooFewInvocations(): Unit {
        verificationFailureReason(
            "TooFewInvocations",
            ["e.c()", "Required: at least 5", "Actual: 4"]
        ) {
            e.c()
            e.c()
            e.c()
            e.c()

            Verify.that(@Called(e.c()).atLeastTimes(5))
        }
    }

    @TestCase
    func orderedTooManyInvocations(): Unit {
        verificationFailureReason(
            "TooManyInvocations",
            ["e.a()", "Required: exactly 2", "Actual: 3"]
        ) {
            e.c()
            e.c()
            e.a()
            e.a()
            e.a()
            e.b()

            Verify.ordered(
                @Called(e.c()),
                @Called(e.c()),
                @Called(e.a()).times(2),
                @Called(e.b())
            )
        }
    }

    @TestCase
    func unorderedTooManyInvocations(): Unit {
        verificationFailureReason(
            "TooManyInvocations",
            ["e.c()", "Required: exactly 3", "Actual: 4"]
        ) {
            e.c()
            e.c()
            e.c()
            e.c()

            Verify.unordered(@Called(e.c()).times(3))
        }
    }

    @TestCase
    func simpleTooManyInvocations(): Unit {
        verificationFailureReason(
            "TooManyInvocations",
            ["e.c()", "Required: exactly 5", "Actual: 6"]
        ) {
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()

            Verify.that(@Called(e.c()).times(5))
        }
    }

    @TestCase
    func unorderedNonDisjointStatements(): Unit {
        verificationFailureReason(
            "NonDisjointStatements",
            ["e.i1(...)", "e.i1(1)", "e.i1(_)"]
        ) {
            e.i1(1)
            e.i2(2)
            e.i1(2)
            Verify.unordered(
                @Called(e.i2(_)),
                @Called(e.i1(1)),
                @Called(e.i1(_))
            )
        }
    }

    @TestCase
    func orderedNonDisjointStatements(): Unit {
        verificationFailureReason(
            "NonDisjointStatements",
            ["e.i2(...)", "e.i2(_)", "e.i2(2)"]
        ) {
            e.i2(2)
            e.i2(2)

            Verify.ordered(
                @Called(e.i2(_)).atLeastOnce(),
                @Called(e.i2(2))
            )
        }
    }

    @TestCase
    func orderedUnexpectedInvocation(): Unit {
        verificationFailureReason(
            "UnexpectedInvocation",
            ["e.c", "e.b"]
        ) {
            e.a()
            e.b()

            Verify.ordered(
                @Called(e.a()),
                @Called(e.c())
            )
        }
    }

    @TestCase
    func emptyLog(): Unit {
        verificationFailureReason(
            "UnmatchedStatements",
            ["e.a()", "e.a()"]
        ) {
            Verify.ordered(
                @Called(e.a()).once(),
                @Called(e.a()).once()
            )
        }

        verificationFailureReason(
            "UnmatchedStatements",
            ["e.a()", "e.b()", "e.c()"]
        ) {
            Verify.unordered(
                @Called(e.a()).once(),
                @Called(e.b()).once(),
                @Called(e.c()).once()
            )
        }
    }

    @TestCase
    func usingNeverCardinality(): Unit {
        verificationFailureReason(
            "TooManyInvocations",
            ["e.a()", "Required: exactly 0", "Actual: 1"]
        ) {
            e.a()
            e.b()

            Verify.ordered(
                @Called(e.a()).never(),
                @Called(e.b()).once()
            )
        }
    }
}
