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
class CPointerMinusOverflowTest {
    @TestCase
    func testCPointerMinusNormal(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 10)
            let newPtr = ptr - 5
            @Expect(newPtr.isNull(), false)
            LibC.free(ptr)
        }
    }

    @TestCase
    func testCPointerMinusZero(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 10)
            let newPtr = ptr - 0
            @Expect(newPtr, ptr)
            LibC.free(ptr)
        }
    }

    @TestCase
    func testCPointerMinusPositive(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 10)
            let newPtr = ptr - 1
            @Expect(newPtr.isNull(), false)
            LibC.free(ptr)
        }
    }

    @TestCase
    func testCPointerMinusLargeValue(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 100)
            let newPtr = ptr - 50
            @Expect(newPtr.isNull(), false)
            LibC.free(ptr)
        }
    }

    @TestCase
    func testCPointerMinusInt64MinThrowsException(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 10)
            var exceptionThrown = false
            try {
                let newPtr = ptr - Int64.Min
            } catch (e: OverflowException) {
                exceptionThrown = true
            }
            @Expect(exceptionThrown, true)
            LibC.free(ptr)
        }
    }

    @TestCase
    func testCPointerMinusInt64Max(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 10)
            var exceptionThrown = false
            try {
                let newPtr = ptr - Int64.Max
            } catch (e: OverflowException) {
                exceptionThrown = true
            }
            @Expect(exceptionThrown, true)
            LibC.free(ptr)
        }
    }

    @TestCase
    func testCPointerMinusMultipleOperations(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 100)
            let ptr1 = ptr - 10
            let ptr2 = ptr1 - 10
            let ptr3 = ptr2 - 10
            @Expect(ptr3.isNull(), false)
            LibC.free(ptr)
        }
    }
}
