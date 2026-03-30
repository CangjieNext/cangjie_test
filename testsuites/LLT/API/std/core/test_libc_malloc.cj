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
class LibCMallocTest {
    @TestCase
    func testMallocOverflowThrowsException(): Unit {
        var exceptionThrown = false
        try {
            let ptr = LibC.malloc<Int64>(count: Int64.Max)
        } catch (e: IllegalMemoryException) {
            exceptionThrown = true
        }
        @Expect(exceptionThrown, true)
    }

    @TestCase
    func testMallocNormalAllocation(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 10)
            @Expect(ptr.isNull(), false)
            
            ptr.write(0, 42)
            let value = ptr.read(0)
            @Expect(value, 42)
            
            LibC.free(ptr)
        }
    }

    @TestCase
    func testMallocSingleElement(): Unit {
        unsafe {
            let ptr = LibC.malloc<Int64>(count: 1)
            @Expect(ptr.isNull(), false)
            
            ptr.write(0, 100)
            let value = ptr.read(0)
            @Expect(value, 100)
            
            LibC.free(ptr)
        }
    }

    @TestCase
    func testMallocNegativeCountThrowsException(): Unit {
        var exceptionThrown = false
        try {
            let ptr = LibC.malloc<Int64>(count: -1)
        } catch (e: IllegalArgumentException) {
            exceptionThrown = true
        }
        @Expect(exceptionThrown, true)
    }

    @TestCase
    func testMallocZeroCountThrowsException(): Unit {
        var exceptionThrown = false
        try {
            let ptr = LibC.malloc<Int64>(count: 0)
        } catch (e: IllegalArgumentException) {
            exceptionThrown = true
        }
        @Expect(exceptionThrown, true)
    }
}
