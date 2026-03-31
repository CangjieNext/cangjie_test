/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

@Test
class EnumerateIteratorOverflowTest {
    @TestCase
    func testEnumerateBasic(): Unit {
        let arr = [10, 20, 30, 40, 50]
        var count: Int64 = 0
        for ((i, v) in arr.enumerate()) {
            @Expect(i, count)
            @Expect(v, arr[count])
            count++
        }
        @Expect(count, 5)
    }

    @TestCase
    func testEnumerateEmpty(): Unit {
        let arr: Array<Int64> = []
        var count: Int64 = 0
        for ((i, v) in arr.enumerate()) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func testEnumerateSingleElement(): Unit {
        let arr = [42]
        var found = false
        for ((i, v) in arr.enumerate()) {
            @Expect(i, 0)
            @Expect(v, 42)
            found = true
        }
        @Expect(found, true)
    }

    @TestCase
    func testEnumerateIndexSequence(): Unit {
        let arr = [100, 200, 300]
        var expectedIdx: Int64 = 0
        for ((i, v) in arr.enumerate()) {
            @Expect(i, expectedIdx)
            expectedIdx++
        }
        @Expect(expectedIdx, 3)
    }

    @TestCase
    func testEnumerateWithTake(): Unit {
        let arr = [1, 2, 3, 4, 5]
        var count: Int64 = 0
        for ((i, v) in arr.enumerate().take(3)) {
            @Expect(i, count)
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func testEnumerateWithSkip(): Unit {
        let arr = [1, 2, 3, 4, 5]
        var count: Int64 = 0
        for ((i, v) in arr.enumerate().skip(2)) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func testEnumerateLargeCollection(): Unit {
        let arr = Array<Int64>(1000, { i => i })
        var lastIdx: Int64 = -1
        var lastVal: Int64 = -1
        for ((i, v) in arr.enumerate()) {
            lastIdx = i
            lastVal = v
        }
        @Expect(lastIdx, 999)
        @Expect(lastVal, 999)
    }
}
