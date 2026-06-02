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
public class ExhaustiveUnorderedVerifyTest {
    @BeforeAll
    func beforeAll(): Unit {
        @On(e.a()).returns("").anyTimes()
        @On(e.b()).returns("").anyTimes()
        @On(e.c()).returns("").anyTimes()
        @On(e.i1(_)).returns(()).anyTimes()
        @On(e.i2(_)).returns(()).anyTimes()
        @On(e.s1(_)).returns(()).anyTimes()
        @On(e.s2(_)).returns(()).anyTimes()

        @On(e1.a()).returns("").anyTimes()
        @On(e1.b()).returns("").anyTimes()
        @On(e2.a()).returns("").anyTimes()
        @On(e2.b()).returns("").anyTimes()
        @On(e3.a()).returns("").anyTimes()
        @On(e3.b()).returns("").anyTimes()
    }

    private let e = mock<Example1>()

    @TestCase
    func testSimple(): Unit {
        success {
            e.a()

            Verify.unordered(@Called(e.a()).once())
        }
    }

    @TestCase
    func testSimple2(): Unit {
        success {
            e.a()
            e.a()
            e.b()

            Verify.unordered(
                @Called(e.b()).once(),
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
                @Called(e.b()).once(),
                @Called(e.a()).times(4),
                @Called(e.c()).times(5)
            )
        }
    }

    @TestCase
    func unmatchedInvocations(): Unit {
        verificationFailure("UnmatchedInvocations") {
            e.a()
            e.c()
            e.c()

            Verify.unordered(@Called(e.c()).times(2))
        }
    }

    @TestCase
    func unmatchedInvocations2(): Unit {
        verificationFailure("UnmatchedInvocations") {
            let e2 = mock<Example1>()
            @On(e2.c()).returns("")
            e.a()
            e.c()
            e.c()
            e2.c()
            e2.c()

            Verify.unordered(
                @Called(e2.c()).times(2),
                @Called(e.a()).once()
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
                @Called(e.i1(_)).times(3),
                @Called(e.i1(2)).times(2)
            )
        }
    }

    let e1 = mock<Example1>()
    let e2 = mock<Example1>()
    let e3 = mock<Example1>()

    @TestCase
    func automaticScope(): Unit {
        success {
            e1.a()
            e2.a()
            e3.a()
            Verify.unordered(
                @Called(e1.a()),
                @Called(e2.a())
            )
            Verify.unordered(
                @Called(e1.a()),
                @Called(e3.a())
            )
            Verify.unordered(
                @Called(e2.a()),
                @Called(e3.a())
            )
        }

        verificationFailure("UnmatchedInvocations") {
            e1.a()
            e2.a()
            e3.a()
            e3.b()

            Verify.unordered(
                @Called(e1.a()),
                @Called(e3.b())
            )
        }

        verificationFailure("UnmatchedInvocations") {
            e1.a()
            e2.a()
            e3.a()
            e3.b()

            Verify.unordered(
                @Called(e1.a()),
                @Called(e3.a())
            )
        }

        success {
            e1.a()
            e2.a()
            e3.a()
            e3.b()

            Verify.unordered(
                @Called(e1.a()),
                @Called(e3.a()),
                @Called(e3.b())
            )
        }
    }
}
