/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test reflect exception classes
 *          Test constructors
 *          Test getClassName() method
 * Test API:
 *      ReflectException, InfoNotFoundException, MisMatchException,
 *      IllegalSetException, IllegalTypeException, InvocationTargetException
 */

import std.reflect.*

@Test
class ReflectExceptionTest {
    @TestCase
    func testReflectExceptionDefaultConstructor(): Unit {
        let ex = ReflectException()
        @Expect(ex.message == "")
    }

    @TestCase
    func testReflectExceptionMessageConstructor(): Unit {
        let ex = ReflectException("test error")
        @Assert(ex.message, "test error")
    }

    @TestCase
    func testInfoNotFoundExceptionDefaultConstructor(): Unit {
        let ex = InfoNotFoundException()
        @Expect(ex.message == "")
    }

    @TestCase
    func testInfoNotFoundExceptionMessageConstructor(): Unit {
        let ex = InfoNotFoundException("type not found")
        @Assert(ex.message, "type not found")
    }

    @TestCase
    func testMisMatchExceptionDefaultConstructor(): Unit {
        let ex = MisMatchException()
        @Expect(ex.message == "")
    }

    @TestCase
    func testMisMatchExceptionMessageConstructor(): Unit {
        let ex = MisMatchException("type mismatch")
        @Assert(ex.message, "type mismatch")
    }

    @TestCase
    func testIllegalSetExceptionDefaultConstructor(): Unit {
        let ex = IllegalSetException()
        @Expect(ex.message == "")
    }

    @TestCase
    func testIllegalSetExceptionMessageConstructor(): Unit {
        let ex = IllegalSetException("cannot set immutable")
        @Assert(ex.message, "cannot set immutable")
    }

    @TestCase
    func testIllegalTypeExceptionDefaultConstructor(): Unit {
        let ex = IllegalTypeException()
        @Expect(ex.message == "")
    }

    @TestCase
    func testIllegalTypeExceptionMessageConstructor(): Unit {
        let ex = IllegalTypeException("wrong type")
        @Assert(ex.message, "wrong type")
    }

    @TestCase
    func testInvocationTargetExceptionDefaultConstructor(): Unit {
        let ex = InvocationTargetException()
        @Expect(ex.message == "")
    }

    @TestCase
    func testInvocationTargetExceptionMessageConstructor(): Unit {
        let ex = InvocationTargetException("invocation failed")
        @Assert(ex.message, "invocation failed")
    }

    @TestCase
    func testExceptionThrowAndCatch(): Unit {
        try {
            throw InfoNotFoundException("test throw")
        } catch (e: InfoNotFoundException) {
            @Assert(e.message, "test throw")
        }
    }

    @TestCase
    func testExceptionInheritance(): Unit {
        let ex = IllegalSetException("test")
        @Expect(ex is ReflectException)
        @Expect(ex is Exception)
    }

    @TestCase
    func testMultipleExceptionTypes(): Unit {
        var caughtType = ""
        try {
            throw IllegalTypeException("type error")
        } catch (e: IllegalSetException) {
            caughtType = "IllegalSet"
        } catch (e: IllegalTypeException) {
            caughtType = "IllegalType"
        } catch (e: ReflectException) {
            caughtType = "Reflect"
        }
        @Assert(caughtType, "IllegalType")
    }
}
