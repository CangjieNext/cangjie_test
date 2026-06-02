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

// Insertion sorting is the most basic stable sorting algorithm.
// so it is used as a standard to verify the correctness and stability of the sorting algorithm.

let TESTING_TIMES = 100
let LONG_ARRAY_SIZE: UInt16 = 2048
let DF: () -> Int8 = Random().nextInt8
let NUM: () -> UInt16 = Random().nextUInt16

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

func insertionSortArray<T>(arr: Array<Array<T>>, begin: Int64, end: Int64, comparator: (Array<T>, Array<T>) -> Ordering): Unit {
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
class arraySortTest {
    @TestCase
    func stableSortBySuccess(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = arr.clone()
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            } else {
                {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            }
            insertionSortArray(arr, 0, n - 1, comparator)
            arr1.sortBy(comparator: comparator, stable: true)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
                @Assert(arr[j][1], arr1[j][1])
            }
        }
    }

    @TestCase
    func stableSortSuccess(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = arr.clone()
            let comparator = {left: Int8, right: Int8 => left.compare(right)}
            insertionSort(arr, 0, n - 1, comparator)
            arr1.sort(stable: true)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func stableSortDescendingSuccess(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = arr.clone()
            let comparator = {left: Int8, right: Int8 => right.compare(left)}
            insertionSort(arr, 0, n - 1, comparator)
            arr1.sortDescending(stable: true)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func unstableSortbySuccess(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = arr.clone()
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Int8, right: Int8 => right.compare(left)}
            } else {
                {left: Int8, right: Int8 => left.compare(right)}
            }
            insertionSort(arr, 0, n - 1, comparator)
            arr1.sortBy(comparator: comparator, stable: false)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func unstableSortSuccess(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = arr.clone()
            let comparator = {left: Int8, right: Int8 => left.compare(right)}
            insertionSort(arr, 0, n - 1, comparator)
            arr1.sort(stable: false)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func unstableSortDescendingSuccess(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = arr.clone()
            let comparator = {left: Int8, right: Int8 => right.compare(left)}
            insertionSort(arr, 0, n - 1, comparator)
            arr1.sortDescending(stable: false)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }
}
