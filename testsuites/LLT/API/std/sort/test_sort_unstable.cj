/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.sort.*
import std.random.*
import std.math.*

// Insertion sorting is the most basic stable sorting algorithm.
// so it is used as a standard to verify the correctness and stability of the sorting algorithm.

let TESTING_TIMES = 100
let LONG_ARRAY_SIZE: UInt16 = 2048
let RANDOM = Random()
let TEST_ARR: Array<Int64> = [32, 54, 72, 86, 92, 12, 28, 61, 44]

func comparatorInt64(left: Int64, right: Int64): Ordering {
    if (left > right) {
        return Ordering.GT
    } else if (left < right) {
        return Ordering.LT
    }
    return Ordering.EQ
}

func insertionSort<T>(arr: Array<T>, begin: Int64, end: Int64, comparator: (T, T) -> Ordering): Unit {
    if (begin < 0 || end >= arr.size) {
        return
    }
    var i: Int64 = begin + 1
    while (i <= end) {
        var point = arr[i]
        var j = i - 1
        while (j >= begin) {
            var temp = arr[j]
            match (comparator(temp, point)) {
                case GT => arr[j + 1] = temp
                case _ => break
            }
            j--
        }
        arr[j + 1] = point
        i++
    }
}

@Test
class unstableSortTest {
    @TestCase
    func sortByInputInt8SizeInt32ValueSuccess(): Unit {
        let df: () -> Int32 = RANDOM.nextInt32
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt8())
            var arr = Array<Int32>(n, {_ => df()})
            let arr1 = arr.clone()
            let y = RANDOM.nextUInt8() % 2
            let comparator = if (y == 0) {
                {left: Int32, right: Int32 => right.compare(left)}
            } else {
                {left: Int32, right: Int32 => left.compare(right)}
            }
            insertionSort(arr, 0, n - 1, comparator)
            unstableSort<Int32>(arr1, comparator)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortByInputInt16SizeInt8ValueSuccess(): Unit {
        let df: () -> Int8 = RANDOM.nextInt8
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt16() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => df()})
            let arr1 = arr.clone()
            let y = RANDOM.nextUInt16() % 2
            let comparator = if (y == 0) {
                {left: Int8, right: Int8 => right.compare(left)}
            } else {
                {left: Int8, right: Int8 => left.compare(right)}
            }
            insertionSort(arr, 0, n - 1, comparator)
            sort<Int8>(arr1, by: comparator)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortByInputPartSortedSuccess(): Unit {
        let df: () -> Int32 = RANDOM.nextInt32
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt16() % LONG_ARRAY_SIZE)
            var arr = Array<Int32>(n, {_ => df()})
            let y = RANDOM.nextUInt16() % 2
            let comparator = if (y == 0) {
                {left: Int32, right: Int32 => right.compare(left)}
            } else {
                {left: Int32, right: Int32 => left.compare(right)}
            }
            if (n > 32) {
                sort(arr[0..n * 9 / 10], by: comparator)
            }
            let arr1 = arr.clone()

            insertionSort(arr, 0, n - 1, comparator)
            sort<Int32>(arr1, by: comparator)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortByInputPartsSortedSuccess(): Unit {
        let df: () -> Int32 = RANDOM.nextInt32
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt16() % LONG_ARRAY_SIZE)
            var arr = Array<Int32>(n, {_ => df()})
            let y = RANDOM.nextUInt16() % 2
            let comparator = if (y == 0) {
                {left: Int32, right: Int32 => right.compare(left)}
            } else {
                {left: Int32, right: Int32 => left.compare(right)}
            }
            if (n > 32) {
                let y = Int64(sqrt(Float64(n)))
                for (x in 0..y) {
                    sort(arr[(y * x)..(y * x + y)], by: comparator)
                }
            }
            let arr1 = arr.clone()

            insertionSort(arr, 0, n - 1, comparator)
            sort<Int32>(arr1, by: comparator)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortInputInt8SizeInt32ValueSuccess(): Unit {
        let df: () -> Int32 = RANDOM.nextInt32
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt8())
            var arr = Array<Int32>(n, {_ => df()})
            let arr1 = arr.clone()
            let comparator = {left: Int32, right: Int32 => left.compare(right)}
            insertionSort(arr, 0, n - 1, comparator)
            sort<Int32>(arr1)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortInputInt16SizeInt8ValueSuccess(): Unit {
        let df: () -> Int8 = RANDOM.nextInt8
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt16() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => df()})
            let arr1 = arr.clone()
            let comparator = {left: Int8, right: Int8 => left.compare(right)}
            insertionSort(arr, 0, n - 1, comparator)
            sort<Int8>(arr1)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortInputPartSortedSuccess(): Unit {
        let df: () -> Int32 = RANDOM.nextInt32
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt16() % LONG_ARRAY_SIZE)
            var arr = Array<Int32>(n, {_ => df()})
            let comparator = {left: Int32, right: Int32 => left.compare(right)}
            if (n > 32) {
                sort(arr[0..n * 9 / 10])
            }
            let arr1 = arr.clone()

            insertionSort(arr, 0, n - 1, comparator)
            sort<Int32>(arr1)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortInputPartsSortedSuccess(): Unit {
        let df: () -> Int32 = RANDOM.nextInt32
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(RANDOM.nextUInt16() % LONG_ARRAY_SIZE)
            var arr = Array<Int32>(n, {_ => df()})
            let comparator = {left: Int32, right: Int32 => left.compare(right)}
            if (n > 32) {
                let y = Int64(sqrt(Float64(n)))
                for (x in 0..y) {
                    sort(arr[(y * x)..(y * x + y)])
                }
            }
            let arr1 = arr.clone()

            insertionSort(arr, 0, n - 1, comparator)
            sort<Int32>(arr1)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortIndexOutOfBoundsException0(): Unit {
        var arr = TEST_ARR.clone()
        try {
            sort(arr[-1..2])
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
            return
        }
        @Assert(false)
    }

    @TestCase
    func sortIndexOutOfBoundsException1(): Unit {
        var arr = TEST_ARR.clone()
        try {
            sort(arr[arr.size..arr.size + 3])
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
            return
        }
        @Assert(false)
    }

    @TestCase
    func sortIndexOutOfBoundsException2(): Unit {
        var arr: Array<Int64> = Array<Int64>()
        try {
            sort(arr[0..1])
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
            return
        }
        @Assert(false)
    }

    @TestCase
    func sortByIndexOutOfBoundsException0(): Unit {
        var arr = TEST_ARR.clone()
        try {
            sort(arr[-1..2], by: comparatorInt64)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
            return
        }
        @Assert(false)
    }

    @TestCase
    func sortByIndexOutOfBoundsException1(): Unit {
        var arr = TEST_ARR.clone()
        try {
            sort(arr[arr.size..arr.size + 3], by: comparatorInt64)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
            return
        }
        @Assert(false)
    }

    @TestCase
    func sortByIndexOutOfBoundsException2(): Unit {
        var arr: Array<Int64> = Array<Int64>()
        try {
            sort(arr[0..1], by: comparatorInt64)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
            return
        }
        @Assert(false)
    }
}
