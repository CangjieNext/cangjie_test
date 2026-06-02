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
public class ExhaustiveOrderedVerifyTest {
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
    func testSimple(): Unit {
        success {
            e.a()

            Verify.ordered(@Called(e.a()))
        }
    }

    @TestCase
    func testSimpleCardinality(): Unit {
        success {
            e.a()
            e.a()

            Verify.ordered(@Called(e.a()).times(2))
        }
    }

    @TestCase
    func testSimpleCardinalityOverflow(): Unit {
        verificationFailure("TooManyInvocations") {
            e.a()
            e.a()
            e.a()
            e.a()

            Verify.ordered(@Called(e.a()).times(2))
        }
    }

    @TestCase
    func testSimpleCardinalityOverflow2(): Unit {
        verificationFailure("TooManyInvocations") {
            e.a()
            e.a()
            e.a()

            Verify.ordered(@Called(e.a()).times(2))
        }
    }

    @TestCase
    func testSimpleCardinalityUnderflow(): Unit {
        verificationFailure("TooFewInvocations") {
            e.a()

            Verify.ordered(@Called(e.a()).times(2))
        }
    }

    @TestCase
    func testSimpleInvocationSequence(): Unit {
        success {
            e.a()
            e.b()

            Verify.ordered(
                @Called(e.a()).once(),
                @Called(e.b()).once()
            )
        }
    }

    @TestCase
    func testSimpleInvocationSequence2(): Unit {
        success {
            e.a()
            e.b()
            e.c()
            e.a()
            e.c()

            Verify.ordered(
                @Called(e.a()).once(),
                @Called(e.b()).once(),
                @Called(e.c()).once(),
                @Called(e.a()).once(),
                @Called(e.c()).once()
            )
        }
    }

    @TestCase
    func testSequenceUnmatchedInvocations1(): Unit {
        verificationFailure("UnmatchedInvocations") {
            e.a()
            e.b()
            e.c()
            e.a()
            e.c()
            e.a()

            Verify.ordered(
                @Called(e.a()).once(),
                @Called(e.b()).once(),
                @Called(e.c()).once(),
                @Called(e.a()).once(),
                @Called(e.c()).once()
            )
        }
    }

    @TestCase
    func testSequenceUnmatchedInvocations2(): Unit {
        verificationFailure("UnmatchedInvocations") {
            e.a()
            e.b()
            e.c()
            e.a()
            e.c()
            e.a()
            e.c()

            Verify.ordered(
                @Called(e.a()).once(),
                @Called(e.b()).once(),
                @Called(e.c()).once(),
                @Called(e.a()).once(),
                @Called(e.c()).once()
            )
        }
    }

    @TestCase
    func testSequenceUnmatchedStatements(): Unit {
        verificationFailure("UnmatchedStatements") {
            e.a()
            e.b()
            e.c()
            e.a()
            e.c()

            Verify.ordered(
                @Called(e.a()).once(),
                @Called(e.b()).once(),
                @Called(e.c()).once(),
                @Called(e.a()).once(),
                @Called(e.c()).once(),
                @Called(e.b()).once()
            )
        }
    }

    @TestCase
    func parametrizedSequence1(): Unit {
        success {
            e.i1(0)
            e.i2(0)
            e.i1(0)
            e.i2(0)

            Verify.ordered(
                @Called(e.i1(0)).once(),
                @Called(e.i2(0)).once(),
                @Called(e.i1(0)).once(),
                @Called(e.i2(0)).once()
            )
        }
    }

    @TestCase
    func parametrizedSequence2(): Unit {
        success {
            e.i1(1)
            e.i2(2)
            e.i2(3)
            e.i1(2)

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).once(),
                @Called(e.i2(_)).once(),
                @Called(e.i1(2)).once()
            )

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).times(2),
                @Called(e.i1(2)).once()
            )

            Verify.ordered(
                @Called(e.i1(_)).once(),
                @Called(e.i2(_)).times(1),
                @Called(e.i2(3)).times(1),
                @Called(e.i1(_)).once()
            )
        }
    }

    @TestCase
    func parametrizedSequence3(): Unit {
        success {
            e.i1(1)
            e.i2(2)
            e.i2(2)
            e.i2(3)
            e.i2(3)
            e.i1(1)

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).times(4),
                @Called(e.i1(1)).once()
            )

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).times(min: 1, max: 4),
                @Called(e.i1(1)).once()
            )

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).atLeastTimes(4),
                @Called(e.i1(1)).once()
            )

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).times(2),
                @Called(e.i2(3)).times(2),
                @Called(e.i1(1)).once()
            )

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(2)).times(2),
                @Called(e.i2(_)).times(2),
                @Called(e.i1(1)).once()
            )

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(2)).times(2),
                @Called(e.i2(3)).times(2),
                @Called(e.i1(1)).once()
            )
        }
    }

    @TestCase
    func parametrizedSequenceTooManyInvocations(): Unit {
        verificationFailure("TooManyInvocations") {
            e.i1(1)
            e.i2(2)
            e.i2(2)
            e.i2(3)
            e.i2(3)
            e.i1(1)

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).times(3),
                @Called(e.i1(1)).once()
            )
        }
    }

    @TestCase
    func parametrizedSequenceTooFewInvocations(): Unit {
        verificationFailure("TooFewInvocations") {
            e.i1(1)
            e.i2(2)
            e.i2(2)
            e.i2(3)
            e.i2(3)
            e.i1(1)

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).times(5),
                @Called(e.i1(1)).once()
            )
        }
    }

    @TestCase
    func parametrizedSequence4(): Unit {
        success {
            e.s1("1")
            e.s1("2")
            e.s2("1")
            e.s1("3")

            Verify.ordered(
                @Called(e.s1("1")).once(),
                @Called(e.s1("2")).once(),
                @Called(e.s2("1")).once(),
                @Called(e.s1("3")).once()
            )

            Verify.ordered(
                @Called(e.s1(_)).times(2),
                @Called(e.s2("1")).once(),
                @Called(e.s1("3")).once()
            )
        }
    }

    @TestCase
    func nonDisjointStatements(): Unit {
        verificationFailure("NonDisjointStatements") {
            e.i1(1)
            e.i2(2)
            e.i2(2)
            e.i2(3)
            e.i2(3)
            e.i1(1)

            Verify.ordered(
                @Called(e.i1(1)).once(),
                @Called(e.i2(_)).times(min: 2, max: 3),
                @Called(e.i2(3)).times(min: 1, max: 2),
                @Called(e.i1(1)).once()
            )
        }
    }

    @TestCase
    func testClearLog(): Unit {
        success {
            e.i1(1)
            e.i1(2)
            e.i1(2)

            Verify.ordered(
                @Called(e.i1(1)),
                @Called(e.i1(2)),
                @Called(e.i1(2))
            )

            Verify.clearInvocationLog()

            e.i1(1)

            Verify.ordered(@Called(e.i1(_)).times(1))

            e.i2(3)

            Verify.ordered(
                @Called(e.i1(1)).times(1),
                @Called(e.i2(3)).times(1)
            )

            Verify.clearInvocationLog()

            assertThrows<VerificationFailedException> {
                Verify.ordered(@Called(e.i1(_)).times(1))
            }

            e.i1(1)
            Verify.ordered(@Called(e.i1(_)).times(1))
        }
    }

    @TestCase
    func automaticScope(): Unit {
        success {
            let e1 = mock<Example1>()
            @On(e1.a()).returns("").anyTimes()
            @On(e1.b()).returns("").anyTimes()
            let e2 = mock<Example1>()
            @On(e2.a()).returns("").anyTimes()
            @On(e2.b()).returns("").anyTimes()
            let e3 = mock<Example1>()
            @On(e3.a()).returns("").anyTimes()
            @On(e3.b()).returns("").anyTimes()

            e1.a()
            e2.a()
            e2.b()
            e3.a()
            e2.b()
            e3.a()
            e1.b()
            e2.b()

            Verify.ordered(
                @Called(e1.a()),
                @Called(e1.b())
            )

            Verify.ordered(@Called(e3.a()).times(2))

            Verify.ordered(
                @Called(e1.a()),
                @Called(e2.a()),
                @Called(e2.b()).times(2),
                @Called(e1.b()),
                @Called(e2.b())
            )

            Verify.ordered(
                @Called(e1.a()),
                @Called(e3.a()).times(2),
                @Called(e1.b())
            )

            Verify.ordered(
                @Called(e2.a()),
                @Called(e2.b()),
                @Called(e3.a()),
                @Called(e2.b()),
                @Called(e3.a()),
                @Called(e2.b())
            )
        }
    }

    @TestCase
    func neverCardinality(): Unit {
        success {
            let e1 = mock<Example1>()
            @On(e1.a()).returns("").anyTimes()
            @On(e1.b()).returns("").anyTimes()
            let e2 = mock<Example1>()
            @On(e2.a()).returns("").anyTimes()
            @On(e2.b()).returns("").anyTimes()
            let e3 = mock<Example1>()
            @On(e3.a()).returns("").anyTimes()
            @On(e3.b()).returns("").anyTimes()

            e1.a()
            e2.b()

            Verify.ordered(
                @Called(e1.a()),
                @Called(e1.b()).never(),
                @Called(e2.a()).never(),
                @Called(e2.b())
            )
        }
    }
}
