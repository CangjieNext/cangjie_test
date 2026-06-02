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

//
// Note: long version of the test is in HLT
//

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
}
