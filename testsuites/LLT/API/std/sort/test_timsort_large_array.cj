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

let TESTING_TIMES = 5
let RANDOM = Random()

func isSorted<T>(arr: Array<T>, comparator: (T, T) -> Ordering): Bool where T <: Comparable<T> {
    for (i in 1..arr.size) {
        if (comparator(arr[i - 1], arr[i]) == GT) {
            return false
        }
    }
    return true
}

func isStableSorted<T>(arr: Array<Array<T>>, comparator: (Array<T>, Array<T>) -> Ordering): Bool where T <: Comparable<T> {
    for (i in 1..arr.size) {
        let cmp = comparator(arr[i - 1], arr[i])
        if (cmp == GT) {
            return false
        }
        if (cmp == EQ && arr[i - 1][1] > arr[i][1]) {
            return false
        }
    }
    return true
}

@Test
class timsortLargeArrayTest {
    @TestCase
    func sortLargeArrayTier1(): Unit {
        let sizes = [50, 80, 100, 119]
        for (size in sizes) {
            for (_ in 0..TESTING_TIMES) {
                var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
                sort(arr, stable: true)
                @Assert(isSorted(arr, {l, r => l.compare(r)}))
            }
        }
    }

    @TestCase
    func sortLargeArrayTier2(): Unit {
        let sizes = [150, 500, 1000, 1540]
        for (size in sizes) {
            for (_ in 0..TESTING_TIMES) {
                var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
                sort(arr, stable: true)
                @Assert(isSorted(arr, {l, r => l.compare(r)}))
            }
        }
    }

    @TestCase
    func sortLargeArrayTier3(): Unit {
        let sizes = [2000, 10000, 50000, 100000]
        for (size in sizes) {
            for (_ in 0..TESTING_TIMES) {
                var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
                sort(arr, stable: true)
                @Assert(isSorted(arr, {l, r => l.compare(r)}))
            }
        }
    }

    @TestCase
    func sortLargeArrayTier4(): Unit {
        let sizes = [150000, 200000]
        for (size in sizes) {
            for (_ in 0..TESTING_TIMES) {
                var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
                sort(arr, stable: true)
                @Assert(isSorted(arr, {l, r => l.compare(r)}))
            }
        }
    }

    @TestCase
    func sortLargeArrayStableDescending(): Unit {
        let size = 50000
        for (_ in 0..TESTING_TIMES) {
            var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
            sort(arr, stable: true, descending: true)
            @Assert(isSorted(arr, {l, r => r.compare(l)}))
        }
    }

    @TestCase
    func sortLargeArrayByComparator(): Unit {
        let size = 50000
        for (_ in 0..TESTING_TIMES) {
            var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
            let comparator = {l: Int64, r: Int64 => l.compare(r)}
            sort(arr, by: comparator, stable: true)
            @Assert(isSorted(arr, comparator))
        }
    }

    @TestCase
    func sortLargeArrayWithKey(): Unit {
        let size = 30000
        for (_ in 0..TESTING_TIMES) {
            var arr = Array<(Int64, Int64)>(size, {i => (RANDOM.nextInt64(), i)})
            sort(arr, key: {x => x[0]}, stable: true)
            
            for (i in 1..arr.size) {
                if (arr[i - 1][0] > arr[i][0]) {
                    @Assert(false)
                    return
                }
                if (arr[i - 1][0] == arr[i][0] && arr[i - 1][1] > arr[i][1]) {
                    @Assert(false)
                    return
                }
            }
            @Assert(true)
        }
    }

    @TestCase
    func stableSortLargeArray(): Unit {
        let size = 50000
        for (_ in 0..TESTING_TIMES) {
            var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
            stableSort(arr)
            @Assert(isSorted(arr, {l, r => l.compare(r)}))
        }
    }

    @TestCase
    func stableSortLargeArrayByComparator(): Unit {
        let size = 50000
        for (_ in 0..TESTING_TIMES) {
            var arr = Array<Int64>(size, {_ => RANDOM.nextInt64()})
            let comparator = {l: Int64, r: Int64 => l.compare(r)}
            stableSort(arr, comparator)
            @Assert(isSorted(arr, comparator))
        }
    }

    @TestCase
    func sortLargeArrayBoundaryCases(): Unit {
        let boundarySizes = [119, 120, 1541, 1542, 119150, 119151]
        for (size in boundarySizes) {
            var arr = Array<Int64>(size, {i => size - i})
            sort(arr, stable: true)
            @Assert(isSorted(arr, {l, r => l.compare(r)}))
        }
    }

    @TestCase
    func sortLargeArrayAllEqualElements(): Unit {
        let size = 100000
        var arr = Array<Int64>(size, {i => i})
        sort(arr, stable: true)
        for (i in 0..size) {
            @Assert(arr[i], i)
        }
    }

    @TestCase
    func sortLargeArrayReverseSorted(): Unit {
        let size = 100000
        var arr = Array<Int64>(size, {i => size - i})
        sort(arr, stable: true)
        @Assert(isSorted(arr, {l, r => l.compare(r)}))
    }

    @TestCase
    func sortLargeArrayAlreadySorted(): Unit {
        let size = 100000
        var arr = Array<Int64>(size, {i => i})
        sort(arr, stable: true)
        @Assert(isSorted(arr, {l, r => l.compare(r)}))
    }
}
