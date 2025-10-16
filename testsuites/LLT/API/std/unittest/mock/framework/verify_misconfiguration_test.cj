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

public func calledA(e: Example_LN): VerifyStatement {
    return @Called(e.a())
}

public func calledB(e: Example_LN): VerifyStatement {
    return @Called(e.b())
}

public func calledA2(e: Example_LN): VerifyStatement {
    return @Called(e.a())
}

public func invalidMatchersForCalledMacro(e: Example_LN): VerifyStatement {
    let valueListener = ValueListener<Int64>.onEach {
        p => println(p)
    }
    @Called(e.p(capture(valueListener)))
}

@Test
public class VerifyMisconfigurationTest {
    public override func beforeAll(): Unit {
        @On(e.a()).returns("").anyTimes()
        @On(e.b()).returns("").anyTimes()
        @On(e.c()).returns("").anyTimes()
        @On(e.i1(_)).returns(()).anyTimes()
        @On(e.i2(_)).returns(()).anyTimes()
        @On(e.s1(_)).returns(()).anyTimes()
        @On(e.s2(_)).returns(()).anyTimes()
        @On(eln.a()).returns("").anyTimes()
    }

    private let e = mock<Example1>()
    private let eln = mock<Example_LN>()

    @TestCase
    func testArgThatCapturingMatcher(): Unit {
        success {
            misconfigurationFailure(
                "Cannot use capture(valueListener) as part of statement e.p(capture(valueListener))" +
                    " declared at verify_misconfiguration_test.cj:38") {
                Verify.that(invalidMatchersForCalledMacro(eln))
            }
        }
    }

    @TestCase
    func emptyBlock(): Unit {
        success {
            misconfigurationFailure("Empty") {Verify.unordered {v =>}}
            misconfigurationFailure("Empty") {Verify.ordered {v =>}}
            misconfigurationFailure("Empty") {Verify.ordered()}
            misconfigurationFailure("Empty") {Verify.unordered()}
        }
    }

    @TestCase
    func statementUsedTwice(): Unit {
        success {
            let statement = calledA(eln)
            misconfigurationFailure(
                "Verify statement can only be used once: statement e.a() declared at verify_misconfiguration_test.cj:23") {
                Verify.unordered {
                    v => v.checkThat(statement).checkThat(@Called(e.a())).checkThat(statement)
                }
            }
        }

        success {
            let statement = calledA(eln)
            eln.a()
            Verify.ordered(statement)

            misconfigurationFailure(
                "Verify statement can only be used once: statement e.a() declared at verify_misconfiguration_test.cj:23") {
                Verify.ordered(statement)
            }
        }
    }

    @TestCase
    func cardinalityReassign(): Unit {
        ignoreExpectations {
            misconfigurationFailure(
                "Cardinality should be set at most once before using verify statement: statement e.a() declared at verify_misconfiguration_test.cj:23") {
                calledA(eln).times(2).times(3)
            }

            let statement = calledA2(eln).times(1)
            eln.a()
            Verify.ordered(statement)

            misconfigurationFailure(
                "Cardinality should be set at most once before using verify statement: statement e.a() declared at verify_misconfiguration_test.cj:31") {
                statement.times(5)
            }
        }
    }

    @TestCase
    func assignCardinalityAfterUsage(): Unit {
        ignoreExpectations {
            eln.a()
            let statement = calledA(eln)
            Verify.ordered(statement)
            misconfigurationFailure(
                "Cardinality should be set at most once before using verify statement: statement e.a() declared at verify_misconfiguration_test.cj:23") {
                statement.times(5)
            }
        }
    }

    @TestCase
    func unusedStatement(): Unit {
        shouldFailOnSessionClose(
            "Statement was never used: statement e.a() declared at verify_misconfiguration_test.cj:23") {
            calledA(eln)
        }

        shouldFailOnSessionClose(
            "Statement was never used: statement e.b() declared at verify_misconfiguration_test.cj:27") {
            eln.a()
            Verify.ordered {
                v =>
                v.checkThat(calledA(eln))
                calledB(eln) // forgot to use checkThat
            }
        }

        shouldFailOnSessionClose(
            "Statement was never used: statement e.a() declared at verify_misconfiguration_test.cj:31") {
            eln.a()
            calledA2(eln)
            Verify.that(calledA(eln))
        }
    }
}
