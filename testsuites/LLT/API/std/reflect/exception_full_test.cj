/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*

@Test
class ExceptionFullTest {
    @TestCase
    func testReflectExceptionToString(): Unit {
        let ex = ReflectException("test message")
        let str = ex.toString()
        @Expect(str.contains("ReflectException"))
    }

    @TestCase
    func testInfoNotFoundExceptionToString(): Unit {
        let ex = InfoNotFoundException("info not found")
        let str = ex.toString()
        @Expect(str.contains("InfoNotFoundException"))
    }

    @TestCase
    func testMisMatchExceptionToString(): Unit {
        let ex = MisMatchException("type mismatch")
        let str = ex.toString()
        @Expect(str.contains("MisMatchException"))
    }

    @TestCase
    func testIllegalSetExceptionToString(): Unit {
        let ex = IllegalSetException("cannot set")
        let str = ex.toString()
        @Expect(str.contains("IllegalSetException"))
    }

    @TestCase
    func testIllegalTypeExceptionToString(): Unit {
        let ex = IllegalTypeException("wrong type")
        let str = ex.toString()
        @Expect(str.contains("IllegalTypeException"))
    }

    @TestCase
    func testInvocationTargetExceptionToString(): Unit {
        let ex = InvocationTargetException("invocation failed")
        let str = ex.toString()
        @Expect(str.contains("InvocationTargetException"))
    }

    func testExceptionMessage(): Unit {
        let ex1 = ReflectException()
        @Expect(ex1.message == "")

        let ex2 = ReflectException("custom message")
        @Assert(ex2.message, "custom message")
    }

    @TestCase
    func testExceptionEquality(): Unit {
        let ex1 = InfoNotFoundException("test")
        let ex2 = InfoNotFoundException("test")
        @Expect(ex1.message == ex2.message)
    }

    @TestCase
    func testExceptionThrowHierarchy(): Unit {
        var caughtReflectException = false

        try {
            throw IllegalSetException("test")
        } catch (e: ReflectException) {
            caughtReflectException = true
        }

        @Expect(caughtReflectException)
    }
}
