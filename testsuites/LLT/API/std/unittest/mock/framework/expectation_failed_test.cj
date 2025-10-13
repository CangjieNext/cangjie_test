/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// DEPENDENCE: ./line_number_utils
// DEPENDENCE: ./stub_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p line_number_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt -p stub_utils --mock=on %compile_lib_opt --output p3.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle p3.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import line_number_utils.*
import stub_utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public func stubA1(e: Example_LN): MethodActionSelector<String> {
    @On(e.a())
}

public func stubA2(e: Example_LN): MethodActionSelector<String> {
    @On(e.a())
}

public func stubA3(e: Example_LN): MethodActionSelector<String> {
    @On(e.a())
}

@Test
public class ExpectationFailedTest {
    let db = mock<BookDB>()
    let id = mock<BookId>()
    let pm = PreviewManager(db)

    @TestCase
    func testCardinalityUnderflow(): Unit {
        expectationFailure(["at least 4 times"]) {
            @On(
                db.getText(id)
            )
                .returns("Chapter 1\nOnce upon a time...\nChapter 2\nThere was a princess\nChapter 3\nAnd a dragon")
                .atLeastTimes(4)
            pm.getPreview(id)
        }
    }

    @TestCase
    func tooFewCallsChain(): Unit {
        expectationFailure(["Actual: 2"]) {
            @On(
                db.getText(id)
            ).returns("a").times(2).then().returns("b")
            assertEquals(db.getText(id), "a")
            assertEquals(db.getText(id), "a")
        }
    }

    @TestCase
    func tooFewCallsChain2(): Unit {
        expectationFailure(["at least 3 times"]) {
            @On(
                db.getText(id)
            ).returns("a").times(2).then().returns("b")
            assertEquals(db.getText(id), "a")
        }
    }

    @TestCase
    func tooFewCallsChain3(): Unit {
        expectationFailure(["at least 6 times"]) {
            @On(
                db.getText(id)
            )
                .returns("a")
                .times(2)
                .then()
                .returns("b")
                .times(3)
                .then()
                .returns("c")
            assertEquals(db.getText(id), "a")
        }
    }

    @TestCase
    func matcherCombinationsAndExpectations1(): Unit {
        expectationFailure(["exactly 4 times", "Actual: 3"]) {
            @On(
                db.y(any(), ofType<B>())
            )
                .returns("second b")
                .once()
                .then()
                .returns("xx")
                .times(3)

            assertEquals(db.y(A(6), B()), "second b")
            assertEquals(db.y(A(6), B()), "xx")
            assertEquals(db.y(A(6), B()), "xx")
        }
    }

    @TestCase
    func consequitivelyActionsCardinality(): Unit {
        expectationFailure(
            [
                "exactly 4 times",
                "Actual: 2"
            ]
        ) {
            @On(
                db.x()
            ).returnsConsecutively(["a", "b", "c", "d"])

            assertEquals(db.x(), "a")
            assertEquals(db.x(), "b")
        }
    }

    @TestCase
    func unnecessaryStubbing(): Unit {
        expectationFailure(["at least once"]) {
            @On(
                db.getText(id)
            ).returns("a")
            @On(
                db.getText(id)
            ).returns("b")
            assertEquals(db.getText(id), "b")
        }
    }

    @TestCase
    func callsHandledByDifferentScenarios(): Unit {
        expectationFailure(
            [
                "Too few invocations for stub e.a() declared at expectation_failed_test.cj:34",
                "line_numbers.cj:38",
                "line_numbers.cj:38",
                "Listing matching invocations not handled by this stub:",
                "line_numbers.cj:20",
                "was handled by stub e.a() declared at expectation_failed_test.cj:26",
                "line_numbers.cj:20",
                "was handled by stub e.a() declared at expectation_failed_test.cj:30",
                "line_numbers.cj:38",
                "was handled by stub e.a() declared at expectation_failed_test.cj:30",
                "line_numbers.cj:38",
                "was handled by stub e.a() declared at expectation_failed_test.cj:30"
            ]
        ) {
            let e = mock<Example_LN>()
            stubA1(e).returns("")
            callA(e, 1)
            stubA2(e).returns("")
            callA(e, 1)
            callA2(e, 2)
            stubA3(e).returns("").times(3)
            callA2(e, 2)
        }
    }
}
