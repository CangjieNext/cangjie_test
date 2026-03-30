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
class ArraySplitAtTest {
    @TestCase
    func testSplitAtBasic(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let (left, right) = arr.splitAt(2)
        @Expect(left.size, 2)
        @Expect(right.size, 3)
        @Expect(left[0], 1)
        @Expect(left[1], 2)
        @Expect(right[0], 3)
        @Expect(right[1], 4)
        @Expect(right[2], 5)
    }

    @TestCase
    func testSplitAtZero(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let (left, right) = arr.splitAt(0)
        @Expect(left.size, 0)
        @Expect(right.size, 5)
    }

    @TestCase
    func testSplitAtEnd(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let (left, right) = arr.splitAt(5)
        @Expect(left.size, 5)
        @Expect(right.size, 0)
    }

    @TestCase
    func testSplitAtMiddle(): Unit {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let (left, right) = arr.splitAt(5)
        @Expect(left.size, 5)
        @Expect(right.size, 5)
        @Expect(left[0], 1)
        @Expect(left[4], 5)
        @Expect(right[0], 6)
        @Expect(right[4], 10)
    }

    @TestCase
    func testSplitAtSingleElement(): Unit {
        let arr = [42]
        let (left, right) = arr.splitAt(0)
        @Expect(left.size, 0)
        @Expect(right.size, 1)
        
        let (left2, right2) = arr.splitAt(1)
        @Expect(left2.size, 1)
        @Expect(right2.size, 0)
    }

    @TestCase
    func testSplitAtEmptyArray(): Unit {
        let arr: Array<Int64> = []
        let (left, right) = arr.splitAt(0)
        @Expect(left.size, 0)
        @Expect(right.size, 0)
    }

    @TestCase
    func testSplitAtInvalidIndex(): Unit {
        let arr = [1, 2, 3]
        var exceptionThrown = false
        try {
            let (left, right) = arr.splitAt(-1)
        } catch (e: IllegalArgumentException) {
            exceptionThrown = true
        }
        @Expect(exceptionThrown, true)
    }

    @TestCase
    func testSplitAtInvalidIndex2(): Unit {
        let arr = [1, 2, 3]
        var exceptionThrown = false
        try {
            let (left, right) = arr.splitAt(4)
        } catch (e: IllegalArgumentException) {
            exceptionThrown = true
        }
        @Expect(exceptionThrown, true)
    }

    @TestCase
    func testSplitAtWithStrings(): Unit {
        let arr = ["a", "b", "c", "d", "e"]
        let (left, right) = arr.splitAt(3)
        @Expect(left.size, 3)
        @Expect(right.size, 2)
        @Expect(left[0], "a")
        @Expect(left[2], "c")
        @Expect(right[0], "d")
        @Expect(right[1], "e")
    }
}
