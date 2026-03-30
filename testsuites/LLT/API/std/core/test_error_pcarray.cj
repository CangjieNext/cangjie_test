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
    func testExceptionBasicCreation(): Unit {
        let ex = Exception("Test exception")
        @Expect(ex.message, "Test exception")
    }

    @TestCase
    func testExceptionWithMessage(): Unit {
        let ex = Exception("Test error message")
        @Expect(ex.toString().contains("Test error message"), true)
    }

    @TestCase
    func testExceptionThrowCatch(): Unit {
        var caught = false
        try {
            throw Exception("Thrown exception")
        } catch (e: Exception) {
            caught = true
        }
        @Expect(caught, true)
    }

    @TestCase
    func testExceptionMultipleCreation(): Unit {
        let exceptions = [Exception("1"), Exception("2"), Exception("3")]
        @Expect(exceptions.size, 3)
    }

    @TestCase
    func testExceptionEmptyMessage(): Unit {
        let ex = Exception("")
        @Expect(ex.message, "")
    }

    @TestCase
    func testExceptionInheritance(): Unit {
        let ex = Exception("Test")
        @Expect(ex.message, "Test")
    }
}
