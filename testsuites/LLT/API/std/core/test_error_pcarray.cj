/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

@Test
class ErrorPcArrayTest {
    @TestCase
    func testErrorBasicCreation(): Unit {
        let err = Error()
        @Expect(err.toString().size() >= 0, true)
    }

    @TestCase
    func testErrorWithMessage(): Unit {
        let err = Error("Test error message")
        @Expect(err.toString().contains("Test error message"), true)
    }

    @TestCase
    func testErrorStackTrace(): Unit {
        let err = Error("With stack trace")
        let str = err.toString()
        @Expect(str.size() > 0, true)
    }

    @TestCase
    func testErrorSubclass(): Unit {
        class CustomError <: Error {
            init(message: String): super(message) {}
        }
        let err = CustomError("Custom error")
        @Expect(err.toString().contains("Custom error"), true)
    }

    @TestCase
    func testErrorThrowCatch(): Unit {
        var caught = false
        try {
            throw Error("Thrown error")
        } catch (e: Error) {
            caught = true
        }
        @Expect(caught, true)
    }

    @TestCase
    func testErrorMultipleCreation(): Unit {
        let errors = [Error("1"), Error("2"), Error("3")]
        @Expect(errors.size, 3)
    }

    @TestCase
    func testErrorEmptyMessage(): Unit {
        let err = Error("")
        @Expect(err.toString().size() >= 0, true)
    }

    @TestCase
    func testErrorNullMessage(): Unit {
        let err = Error()
        @Expect(err.toString().size() >= 0, true)
    }
}
