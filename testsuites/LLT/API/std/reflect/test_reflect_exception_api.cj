/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.reflect.*

@Test
public class ReflectExceptionTest {
    @TestCase
    func test_reflectException_default(): Unit {
        let e = ReflectException()
        @Expect(e.message, "")
    }

    @TestCase
    func test_reflectException_message(): Unit {
        let e = ReflectException("test error")
        @Expect(e.message, "test error")
    }

    @TestCase
    func test_infoNotFoundException_default(): Unit {
        let e = InfoNotFoundException()
        @Expect(e.message, "")
    }

    @TestCase
    func test_infoNotFoundException_message(): Unit {
        let e = InfoNotFoundException("not found")
        @Expect(e.message, "not found")
    }

    @TestCase
    func test_misMatchException_default(): Unit {
        let e = MisMatchException()
        @Expect(e.message, "")
    }

    @TestCase
    func test_misMatchException_message(): Unit {
        let e = MisMatchException("type mismatch")
        @Expect(e.message, "type mismatch")
    }

    @TestCase
    func test_illegalSetException_default(): Unit {
        let e = IllegalSetException()
        @Expect(e.message, "")
    }

    @TestCase
    func test_illegalSetException_message(): Unit {
        let e = IllegalSetException("illegal set")
        @Expect(e.message, "illegal set")
    }

    @TestCase
    func test_illegalTypeException_default(): Unit {
        let e = IllegalTypeException()
        @Expect(e.message, "")
    }

    @TestCase
    func test_illegalTypeException_message(): Unit {
        let e = IllegalTypeException("illegal type")
        @Expect(e.message, "illegal type")
    }

    @TestCase
    func test_invocationTargetException_default(): Unit {
        let e = InvocationTargetException()
        @Expect(e.message, "")
    }

    @TestCase
    func test_invocationTargetException_message(): Unit {
        let e = InvocationTargetException("invocation failed")
        @Expect(e.message, "invocation failed")
    }

    @TestCase
    func test_inheritance(): Unit {
        let e = InfoNotFoundException("child")
        let parent = ReflectException("parent")
        // InfoNotFoundException is a subtype of ReflectException
        @Expect(e is ReflectException)
        @Expect(e is InfoNotFoundException)
        @Expect(!(parent is InfoNotFoundException))
    }

    @TestCase
    func test_catch_as_reflectException(): Unit {
        var caught = false
        try {
            throw MisMatchException("caught as parent")
        } catch (e: ReflectException) {
            caught = true
            @Expect(e.message, "caught as parent")
        }
        @Expect(caught)
    }

    @TestCase
    func test_catch_specific(): Unit {
        var caught = false
        try {
            throw IllegalSetException("specific catch")
        } catch (e: IllegalSetException) {
            caught = true
            @Expect(e.message, "specific catch")
        }
        @Expect(caught)
    }
}
