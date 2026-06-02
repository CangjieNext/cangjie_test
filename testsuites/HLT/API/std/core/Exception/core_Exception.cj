/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*

var temp: Int8 = 1

func f1() {
    return temp + 126
}

@Test
class TestException {
    @TestCase
    func test_Exception(): Unit {
        var a = Exception("exception")
        @Assert(a.message, "exception")

        var a1 = Exception()
        @Assert(a1.message, "")

        var a2 = Exception()
        @Assert(a2.toString(), "Exception")

        var a3 = Exception("this is exception")
        @Assert(a3.toString(), "Exception: this is exception")
    }

    @TestCase
    func test_ArithmeticException(): Unit {
        var count = 0
        try {
            var a: Int8 = f1()
            var b: Int8 = f1()
            print(a + b)
        } catch (e: ArithmeticException) {
            count += 1
        }

        try {
            var a = f1() - 127
            var b = 1 / a
        } catch (e: ArithmeticException) {
            count += 1
        }

        try {
            throw ArithmeticException()
        } catch (e: ArithmeticException) {
            count += 1
        }

        try {
            throw ArithmeticException("123")
        } catch (e: ArithmeticException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "ArithmeticException: 123") {
                count += 1
            }
        }
        @Assert(count, 5)
    }

    @TestCase
    func test_SpawnException(): Unit {
        var count = 0
        try {
            throw SpawnException("123")
        } catch (e: SpawnException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "SpawnException: 123") {
                count += 1
            }
        }

        try {
            throw SpawnException()
        } catch (e: SpawnException) {
            if (e.message == "") {
                count += 1
            }
            if (e.toString() == "SpawnException") {
                count += 1
            }
        }

        @Assert(count, 4)
    }

    @TestCase
    func test_IllegalArgumentException(): Unit {
        var count = 0
        try {
            throw IllegalArgumentException("123")
        } catch (e: IllegalArgumentException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "IllegalArgumentException: 123") {
                count += 1
            }
        }

        try {
            throw IllegalArgumentException()
        } catch (e: IllegalArgumentException) {
            if (e.message == "") {
                count += 1
            }
            if (e.toString() == "IllegalArgumentException") {
                count += 1
            }
        }

        @Assert(count, 4)
    }

    @TestCase
    func test_IndexOutOfBoundsException(): Unit {
        var count = 0
        try {
            throw IndexOutOfBoundsException("123")
        } catch (e: IndexOutOfBoundsException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "IndexOutOfBoundsException: 123") {
                count += 1
            }
        }

        try {
            throw IndexOutOfBoundsException()
        } catch (e: IndexOutOfBoundsException) {
            if (e.message == "") {
                count += 1
            }
            if (e.toString() == "IndexOutOfBoundsException") {
                count += 1
            }
        }

        @Assert(count, 4)
    }

    @TestCase
    func test_NegativeArraySizeException(): Unit {
        var count = 0
        try {
            throw NegativeArraySizeException("123")
        } catch (e: NegativeArraySizeException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "NegativeArraySizeException: 123") {
                count += 1
            }
        }

        try {
            throw NegativeArraySizeException()
        } catch (e: NegativeArraySizeException) {
            if (e.message == "") {
                count += 1
            }
            if (e.toString() == "NegativeArraySizeException") {
                count += 1
            }
        }

        @Assert(count, 4)
    }

    @TestCase
    func test_NoneValueException(): Unit {
        var count = 0
        try {
            throw NoneValueException("123")
        } catch (e: NoneValueException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "NoneValueException: 123") {
                count += 1
            }
        }

        try {
            throw NoneValueException()
        } catch (e: NoneValueException) {
            if (e.message == "") {
                count += 1
            }
            if (e.toString() == "NoneValueException") {
                count += 1
            }
        }

        @Assert(count, 4)
    }

    @TestCase
    func test_OverflowException(): Unit {
        var count = 0
        try {
            throw OverflowException("123")
        } catch (e: OverflowException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "OverflowException: 123") {
                count += 1
            }
        }

        try {
            throw OverflowException()
        } catch (e: OverflowException) {
            if (e.message == "") {
                count += 1
            }
            if (e.toString() == "OverflowException") {
                count += 1
            }
        }

        @Assert(count, 4)
    }

    @TestCase
    func test_IllegalMemoryException(): Unit {
        var count = 0
        try {
            throw IllegalMemoryException("123")
        } catch (e: IllegalMemoryException) {
            if (e.message == "123") {
                count += 1
            }
            if (e.toString() == "IllegalMemoryException: 123") {
                count += 1
            }
        }

        try {
            throw IllegalMemoryException()
        } catch (e: IllegalMemoryException) {
            if (e.message == "") {
                count += 1
            }
            if (e.toString() == "IllegalMemoryException") {
                count += 1
            }
        }

        @Assert(count, 4)
    }
}
