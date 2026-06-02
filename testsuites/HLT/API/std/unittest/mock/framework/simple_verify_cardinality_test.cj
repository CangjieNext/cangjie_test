/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public class Example {
    public func a(): String {
        ""
    }
    public func b(): String {
        ""
    }
    public func c(): String {
        ""
    }
}

@Test
public class VerifyCardinalityTest {
    private let e = mock<Example>()

    @TestCase
    func testSimple(): Unit {
        success {
            @On(e.a()).returns("")

            e.a()

            Verify.that(@Called(e.a()))
        }
    }

    @TestCase
    func testSimpleCardinality(): Unit {
        success {
            @On(e.a()).returns("")

            e.a()

            Verify.that(@Called(e.a()).once())
        }
    }

    @TestCase
    func testTimesCardinalitySuccess(): Unit {
        success {
            @On(e.a()).returns("").anyTimes()
            @On(e.b()).returns("").anyTimes()
            @On(e.c()).returns("").anyTimes()

            e.a()
            e.a()
            e.a()
            e.b()
            e.b()
            e.c()

            Verify.that(@Called(e.c()).times(1))
            Verify.that(@Called(e.b()).times(2))
            Verify.that(@Called(e.a()).times(3))
        }
    }

    @TestCase
    func testTimesCardinalityFailure(): Unit {
        verificationFailure("TooManyInvocations") {
            @On(e.a()).returns("").anyTimes()

            e.a()
            e.a()
            e.a()

            Verify.that(@Called(e.a()).times(2))
        }
    }

    @TestCase
    func testOnceCardinalitySuccess(): Unit {
        success {
            @On(e.a()).returns("").anyTimes()
            @On(e.b()).returns("").anyTimes()
            @On(e.c()).returns("").anyTimes()

            e.a()
            e.b()
            e.c()

            Verify.that(@Called(e.c()).once())
            Verify.that(@Called(e.b()).once())
            Verify.that(@Called(e.a()).once())
        }
    }

    @TestCase
    func testOnceCardinalityFailure(): Unit {
        verificationFailure("TooFewInvocations") {
            @On(e.a()).returns("").anyTimes()

            Verify.that(@Called(e.a()).once())
        }
    }

    @TestCase
    func testAtLeastOnceCardinalitySuccess(): Unit {
        success {
            @On(e.a()).returns("").anyTimes()
            @On(e.b()).returns("").anyTimes()
            @On(e.c()).returns("").anyTimes()

            e.a()
            e.b()
            e.b()
            e.b()
            e.b()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()

            Verify.that(@Called(e.c()).atLeastOnce())
            Verify.that(@Called(e.b()).atLeastOnce())
            Verify.that(@Called(e.a()).atLeastOnce())
        }
    }

    @TestCase
    func testAtLeastOnceCardinalityFailure(): Unit {
        verificationFailure("TooFewInvocations") {
            @On(e.a()).returns("").anyTimes()

            Verify.that(@Called(e.a()).atLeastOnce())
        }
    }

    @TestCase
    func testMinMaxCardinalitySuccess(): Unit {
        success {
            @On(e.a()).returns("").anyTimes()
            @On(e.b()).returns("").anyTimes()
            @On(e.c()).returns("").anyTimes()

            e.a()
            e.b()
            e.b()
            e.b()
            e.b()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()

            Verify.that(@Called(e.a()).times(min: 1, max: 3))
            Verify.that(@Called(e.b()).times(min: 1, max: 5))
            Verify.that(@Called(e.c()).times(min: 5, max: 7))
        }
    }

    @TestCase
    func testMinMaxCardinalityFailure(): Unit {
        verificationFailure("TooFewInvocations") {
            @On(e.a()).returns("").anyTimes()

            e.a()
            e.a()
            e.a()

            Verify.that(@Called(e.a()).times(min: 4, max: 10))
        }
    }

    @TestCase
    func testAtLeastTimesCardinalitySuccess(): Unit {
        success {
            @On(e.a()).returns("").anyTimes()
            @On(e.b()).returns("").anyTimes()
            @On(e.c()).returns("").anyTimes()

            e.a()
            e.b()
            e.b()
            e.b()
            e.b()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()
            e.c()

            Verify.that(@Called(e.a()).atLeastTimes(1))
            Verify.that(@Called(e.b()).atLeastTimes(4))
            Verify.that(@Called(e.c()).atLeastTimes(4))
        }
    }

    @TestCase
    func testAtLeastTimesCardinalityFailure(): Unit {
        verificationFailure("TooFewInvocations") {
            @On(e.a()).returns("").anyTimes()
            e.a()
            e.a()
            e.a()

            Verify.that(@Called(e.a()).atLeastTimes(4))
        }
    }

    @TestCase
    func testNeverCardinality(): Unit {
        success {
            @On(e.a()).returns("").anyTimes()

            Verify.that(@Called(e.a()).never())
        }

        verificationFailure("TooManyInvocations") {
            @On(e.a()).returns("").anyTimes()
            e.a()

            Verify.that(@Called(e.a()).never())
        }
    }
}
