/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt -Woff all --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public class Fields {
    public var s: String = "initial"
    public var i: Int64 = 5

    func check(value: Int64) {
        @Assert(i == value)
    }
}

@Test
public class StubbingFieldsTest {
    let m = mock<Fields>()

    @TestCase
    func mockBaseField(): Unit {
        success {
            @On(m.s).returns("x").once().then().returns("y").once()
            @Assert(m.s, "x")
            @Assert(m.s, "y")
        }

        success {
            @On(m.i = _).doesNothing()
            m.i = 1
            m.i = 2
            m.i = 3
        }

        success {
            @On(m.i).returnsConsecutively(1, 2)
            @Assert(m.i, 1)
            @Assert(m.i, 2)
        }

        runtimeException<ExpectationFailedException>(["Too many invocations for stub m.s = _"]) {
            @On(m.s = _).doesNothing().times(1)
            m.s = "b"
            m.s = "b"
        }

        expectationFailure(["Too few invocations for stub m.s = _"]) {
            @On(m.s = _).doesNothing()
        }
    }

    @TestCase
    func spy(): Unit {
        success {
            let original = Fields()
            let spy = spy(original)
            @On(spy.i).returns(0)
            @Assert(spy.i, 0)
            @On(spy.i).getsOriginal().once()
            original.i = 4
            @Assert(spy.i, 4)
        }

        success {
            let original = Fields()
            let spy = spy(original)
            @On(spy.i).getsOriginal().once().then().returns(1).once().then().throws(Exception("a"))
            @Assert(spy.i, 5)
            @Assert(spy.i, 1)
            assertThrows<Exception> {
                spy.i
            }
        }

        success {
            let original = Fields()
            let spy = spy(original)
            @On(spy.i = _).doesNothing()
            @On(spy.i = 3).setsOriginal().once().then().doesNothing().once().then().throws(Exception("a"))
            @Assert(spy.i, 5)
            spy.i = 0
            original.check(5)
            spy.i = 3
            original.check(3)
            original.i = 4
            spy.i = 3
            original.check(4)
            assertThrows<Exception> {
                spy.i = 3
            }
        }
    }

    @TestCase
    func mustBeSpy() {
        ignoreExpectations {
            let e = assertThrows<MockFrameworkException> {
                @On(m.s).getsOriginal()
            }
            @PowerAssert(e.message.contains("Action getsOriginal"))
        }

        ignoreExpectations {
            let e = assertThrows<MockFrameworkException> {
                @On(m.s = _).setsOriginal()
            }
            @PowerAssert(e.message.contains("Action setsOriginal"))
        }
    }

    @TestCase
    func syntheticFields() {
        success {
            let sField = SyntheticField.create(initialValue: "foo")
            @On(m.s).getsField(sField).once().then().returns("bar").once()
            @Assert(m.s, "foo")
            @Assert(m.s, "bar")
        }

        success {
            let sField = SyntheticField.create(initialValue: "foo")
            @On(m.s).getsField(sField)
            @On(m.s = _).doesNothing()
            @On(m.s = "baz").setsField(sField)
            @On(m.s = "bar").setsField(sField).once().then().doesNothing()
            @Assert(m.s, "foo")
            m.s = "nothing"
            @Assert(m.s, "foo")
            m.s = "bar"
            @Assert(m.s, "bar")
            m.s = "baz"
            @Assert(m.s, "baz")
            m.s = "bar"
            @Assert(m.s, "baz")
        }
    }

    @TestCase
    func fieldsAreCreatedPerSession() {
        testSessions {
            MockFramework.openSession("outer", Stateless)
            let sField = SyntheticField.create(initialValue: "foo")
            @On(m.s).getsField(sField)
            @On(m.s = _).setsField(sField)
            @Assert(m.s, "foo")
            m.s = "bar"
            @Assert(m.s, "bar")

            MockFramework.openSession("intermediate1", Verifiable)
            @Assert(m.s, "foo")
            m.s = "baz"
            @Assert(m.s, "baz")
            MockFramework.closeSession()

            @Assert(m.s, "bar")

            MockFramework.openSession("intermediate2", Verifiable)
            @Assert(m.s, "foo")
            m.s = "baz1"
            @Assert(m.s, "baz1")
            MockFramework.closeSession()

            @Assert(m.s, "bar")
            m.s = "bar1"
            @Assert(m.s, "bar1")
            MockFramework.closeSession()
        }
    }
}
