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

class CallsExample {
    CallsExample(private let e: Example1) {}

    func callSeveral1() {
        e.a()
        e.a()
    }

    func callSeveral2() {
        e.a()
        e.b()
    }

    func callSingle() {
        e.a()
    }
}

@Test
public class StubMisconfigurationTest {
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
    func testUnspecifiedAction(): Unit {
        ignoreExpectations {
            @On(e.a())
            misconfigurationFailure("not configured") {
                e.a()
            }

            misconfigurationFailure("not configured") {
                e.a()
            }
        }

        shouldFailOnSessionClose("not configured") {
            @On(e.b())

            e.a()
        }

        shouldFailOnSessionClose("not configured") {
            @On(e.a())
            @On(e.b()).returns("")
            e.b()
        }
    }

    @TestCase
    func reconfigScenario(): Unit {
        ignoreExpectations {
            let action = @On(e.b())
            let cardinality = action.returns("")

            assertCannotReconfigure(action)
            cardinality.times(5)
            assertCannotReconfigure(action)
            assertCannotReconfigure(cardinality)
        }

        ignoreExpectations {
            let action = @On(e.b()).returns("").times(3).then().returns("").once().then()
            let cardinality = action.returns("")

            assertCannotReconfigure(action)
            cardinality.times(5)
            assertCannotReconfigure(action)
            assertCannotReconfigure(cardinality)
        }
    }

    @TestCase
    func reconfigureAfterCall(): Unit {
        ignoreExpectations {
            let action = @On(e.b())
            let cardinality = action.returns("")
            e.b()
            assertCannotReconfigure(action)
            assertCannotReconfigure(cardinality)
        }

        ignoreExpectations {
            let action = @On(e.b())
            let cardinality = action.returns("")
            cardinality.times(5)
            e.b()
            assertCannotReconfigure(action)
            assertCannotReconfigure(cardinality)
        }
    }

    @TestCase
    func cantSetContinuationAfterCall(): Unit {
        ignoreExpectations {
            let continuation = @On(e.b()).returns("").times(5)
            e.b()
            misconfigurationFailure("cannot be modified") {
                continuation.then()
            }
        }
    }

    @TestCase
    func unfinishedStub(): Unit {
        shouldFailOnSessionClose("not configured") {
            @On(e.b())
        }

        shouldFailOnSessionClose("not configured") {
            @On(e.b()).returns("").once().then()
        }

        shouldFailOnSessionClose("not configured") {
            @On(e.b()).returns("").once().then().returns("").once().then().returns("").once().then()
        }
    }

    @TestCase
    func couldntRecordNotAMockObject(): Unit {
        success {
            let notAMock = Example1()
            let e = assertThrows<MockFrameworkException> {
                @On(notAMock.a())
            }
            assertContainsSubsequently(e.message, ["Failed to create", "notAMock is not", "a cannot be stubbed"])
        }

        success {
            let containsMock = CallsExample(mock<Example1>())
            let e = assertThrows<MockFrameworkException> {
                @On(containsMock.callSeveral1())
            }
            assertContainsSubsequently(e.message, ["Failed to create", "containsMock is not"])
            @PowerAssert(!e.message.contains("a cannot be"))
        }

        success {
            let containsMock = CallsExample(mock<Example1>())
            let e = assertThrows<MockFrameworkException> {
                @On(containsMock.callSingle())
            }
            assertContainsSubsequently(e.message,
                ["Failed to create", "containsMock is not", "callSingle cannot be stubbed"])
        }
    }

    @TestCase
    func cantCallOriginalForNonSpy(): Unit {
        ignoreExpectations {
            let notASpy = mock<Example1>()
            let e = assertThrows<MockFrameworkException> {
                @On(notASpy.a()).callsOriginal()
            }
        }
        ignoreExpectations {
            let notASpy = mock<Example1>()
            let selector = @On(notASpy.a()).returns("").once().then().returns("a").once().then()
            let e = assertThrows<MockFrameworkException> {
                selector.callsOriginal()
            }
        }
    }

    @TestCase
    func callsOriginalNotASpy(): Unit {
        ignoreExpectations {
            let notASpy = mock<Example1>()
            let e = assertThrows<MockFrameworkException> {
                @On(notASpy.a()).callsOriginal()
            }
            @PowerAssert(e.message.contains("Action callsOriginal"))
        }
        ignoreExpectations {
            let notASpy = mock<Example1>()
            let selector = @On(notASpy.a()).returns("").once().then().returns("a").once().then()
            let e = assertThrows<MockFrameworkException> {
                selector.callsOriginal()
            }
        }
    }

    @TestCase
    func noInteractionsWrongArguments(): Unit {
        ignoreExpectations {
            let e1 = assertThrows<MockFrameworkException> {
                Verify.noInteractions()
            }
            @PowerAssert(e1.message.contains("Invalid input: empty object array"))

            let e2 = assertThrows<MockFrameworkException> {
                let notAMock = Example1()
                Verify.noInteractions(notAMock)
            }
            @PowerAssert(e2.message.contains("Invalid input: arguments to Verify.noInteractions must be mock or spy objects"))

            let e3 = assertThrows<MockFrameworkException> {
                let mock1 = mock<Example1>()
                let mock2 = mock<Example1>()
                let notAMock = Example1()
                Verify.noInteractions(mock1, notAMock, mock2)
            }
            @PowerAssert(e3.message.contains("Invalid input: arguments to Verify.noInteractions must be mock or spy objects"))

            let e4 = assertThrows<MockFrameworkException> {
                let mock1 = mock<Example1>()
                Verify.noInteractions(mock1, mock1)
            }
            @PowerAssert(e4.message.contains("Invalid input: several references to the same object"))
        }
    }

    func assertCannotReconfigure(actionSelector: MethodActionSelector<String>): Unit {
        misconfigurationFailure("Action was already specified") {
            actionSelector.returns("")
        }

        misconfigurationFailure("Action was already specified") {
            actionSelector.returns("")
        }
    }

    func assertCannotReconfigure<A>(cardinalitySelector: CardinalitySelector<A>): Unit where A <: ActionSelector {
        misconfigurationFailure("Cardinality was already specified") {
            cardinalitySelector.atLeastTimes(5)
        }

        misconfigurationFailure("Cardinality was already specified") {
            cardinalitySelector.times(4)
        }
    }
}
