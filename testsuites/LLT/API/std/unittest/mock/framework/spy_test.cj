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

public func stubP1(e: Example_LN, predicate: (Int64) -> Bool): MethodActionSelector<String> {
    @On(e.p(argThat(predicate)))
}

public func stubP2(e: Example_LN, predicate: (Int64) -> Bool): MethodActionSelector<String> {
    @On(e.p(argThat(predicate)))
}

class A {
    func a(): String {
        return "original"
    }

    func b(): String {
        return "original"
    }
}

class B {
    B(var j: Int64) {}

    func i(i: Int64): Int64 {
        return i + j
    }
}

class C {
    C(
        let a: A,
        let b: B
    ) {}

    func combine(): String {
        return "${a.a()}${a.b()}${b.i(0)}${b.i(5)}"
    }
}

@Test
public class SpyTest {
    let aSpy = spy<A>(A())

    @TestCase
    func simpleSpySetup(): Unit {
        success {
            @On(aSpy.a()).returns("a").times(2).then().throws(Exception("a"))

            @Assert(aSpy.a(), "a")
            @Assert(aSpy.a(), "a")
            assertThrows<Exception> {
                aSpy.a()
            }
            assertThrows<Exception> {
                aSpy.a()
            }
        }
    }

    @TestCase
    func spyCallsOriginalByDefault(): Unit {
        success {
            @Assert(aSpy.a(), "original")
            @Assert(aSpy.b(), "original")
            @Assert(aSpy.a(), "original")
            let spy2 = spy(A())
            @Assert(spy2.a(), "original")
            @Assert(spy2.b(), "original")
            @Assert(spy2.a(), "original")
        }
    }

    @TestCase func spyCanBeConfiguredToCallOriginal(): Unit {
        success {
            @On(aSpy.a()).callsOriginal()
            @Assert(aSpy.a(), "original")
            @Assert(aSpy.a(), "original")
        }

        success {
            @On(aSpy.a()).callsOriginal().once().then().throws(Exception(""))
            @Assert(aSpy.a(), "original")
            assertThrows<Exception> {
                aSpy.a()
            }
        }

        success {
            @On(aSpy.a()).returns("a").once().then().callsOriginal()
            @Assert(aSpy.a(), "a")
            @Assert(aSpy.a(), "original")
            @Assert(aSpy.a(), "original")
        }
    }

    @TestCase func callsOriginalHasExpectations(): Unit {
        expectationFailure(["Actual: 2"]) {
            @On(aSpy.a()).callsOriginal().times(3)
            @Assert(aSpy.a(), "original")
            @Assert(aSpy.a(), "original")
        }

        expectationFailure(["at least once", "Actual: 0"]) {
            @On(aSpy.a()).callsOriginal()
        }
    }

    @TestCase
    func spiesCanUseInternalState(): Unit {
        success {
            let spy1 = spy(B(0))
            let spy2 = spy(B(2))
            @Assert(spy1.i(0), 0)
            @Assert(spy1.i(5), 5)
            @Assert(spy2.i(0), 2)
            @Assert(spy2.i(5), 7)
        }
    }

    @TestCase
    func spiesArgumentMatchers(): Unit {
        success {
            let spy = spy(B(5))
            @On(spy.i(3)).returns(100)
            @On(spy.i(4)).returns(200)
            @Assert(spy.i(5), 10)
            @Assert(spy.i(0), 5)
            @Assert(spy.i(3), 100)
            @Assert(spy.i(4), 200)
        }
    }

    @TestCase func spyInsideAnotherObject(): Unit {
        success {
            let a = spy(A())
            let b = spy(B(5))
            let c = C(a, b)
            @Assert(c.combine(), "originaloriginal510")
            @On(a.a()).returns("foo")
            @Assert(c.combine(), "foooriginal510")
            @On(a.b()).returns("bar")
            @Assert(c.combine(), "foobar510")
            @On(b.i(_)).returns(0)
            @Assert(c.combine(), "foobar00")
            @On(b.i(_)).callsOriginal()
            @Assert(c.combine(), "foobar510")
        }

        success {
            let a = spy(A())
            let b = spy(B(5))
            let c = spy(C(a, b))
            @Assert(c.combine(), "originaloriginal510")
            @On(a.a()).returns("foo")
            @Assert(c.combine(), "foooriginal510")
            @On(a.b()).returns("bar")
            @Assert(c.combine(), "foobar510")
            @On(b.i(_)).returns(0)
            @Assert(c.combine(), "foobar00")
            @On(c.combine()).returns("x")
            @Assert(c.combine(), "x")
            @On(c.combine()).callsOriginal()
            @Assert(c.combine(), "foobar00")
            @On(b.i(_)).callsOriginal()
            @Assert(c.combine(), "foobar510")
        }
    }

    @TestCase func listenToSpyArguments(): Unit {
        success {
            let a = spy(A())
            let b = spy(B(5))
            let c = spy(C(a, b))
            let listener = ValueListener<Int64>.new()
            @On(b.i(capture(listener))).callsOriginal()
            @Assert(c.combine(), "originaloriginal510")
            @Assert(listener.allValues(), [0, 5])
        }
    }

    @TestCase func verifySpyCalls(): Unit {
        success {
            let a = spy(A())
            let b = spy(B(5))
            let c = spy(C(a, b))
            @Assert(c.combine(), "originaloriginal510")
            @Assert(c.combine(), "originaloriginal510")
            Verify.ordered(
                @Called(a.a()),
                @Called(a.b()),
                @Called(b.i(0)),
                @Called(b.i(5)),
                @Called(a.a()),
                @Called(a.b()),
                @Called(b.i(0)),
                @Called(b.i(5))
            )
            Verify.ordered(
                @Called(c.combine()),
                @Called(a.a()),
                @Called(a.b()),
                @Called(b.i(0)),
                @Called(b.i(5)),
                @Called(c.combine()),
                @Called(a.a()),
                @Called(a.b()),
                @Called(b.i(0)),
                @Called(b.i(5))
            )
            Verify.that(
                @Called(b.i(0)).times(2)
            )
            Verify.unordered(
                @Called(c.combine()).times(2)
            )
            Verify.unordered(Partial,
                @Called(b.i(0)).times(2)
            )
        }
    }

    @TestCase func stubSpyExpectationFailed(): Unit {
        expectationFailure([
            "Required", "Actual: 1", "handled by this",
            "spy_test.cj", "not handled by this", "spy_test.cj", "invoked original"

        ]) {
            let b = spy(B(5))
            b.i(5)
            @On(b.i(5)).returns(5).times(2)
            b.i(5)
        }

        expectationFailure([
            "Too few invocations for stub e.p(argThat(predicate)) declared at",
                "Required: exactly 3 times",
                "Actual: 2",
                "Invocations handled by this stub occured at:",
                    "line_numbers.cj:67",
                    "line_numbers.cj:71",
                "Listing matching invocations not handled by this stub:",
                    "line_numbers.cj:71",
                        "was handled by stub e.p(argThat(predicate)) declared at",
                "Listing non-matching invocations that were not handled by any stub:",
                    "line_numbers.cj:63",
                        "invoked original (default for spy object).",
                    "line_numbers.cj:63",
                        "invoked original (default for spy object).",
                    "line_numbers.cj:67",
                        "invoked original (default for spy object)."
        ]) {
            let e = spy(Example_LN())
            (stubP2(e) { i: Int64 => i > 3 }).returns("a").times(3)
            (stubP1(e) { i: Int64 => i > 5 }).returns("b")
            callP1(e, 1)
            callP1(e, 2)
            callP2(e, 3)
            callP2(e, 4)
            callP3(e, 5)
            callP3(e, 6)
        }
    }
}
