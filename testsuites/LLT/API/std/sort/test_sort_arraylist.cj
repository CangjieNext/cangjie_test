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
import std.collection.*

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
    func sortStableTrueDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let comparator = {left: Int8, right: Int8 => left.compare(right)}
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1, stable: true)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortStableTrueDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let comparator = {left: Int8, right: Int8 => right.compare(left)}
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1, stable: true, descending: true)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortStableFalseDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let comparator = {left: Int8, right: Int8 => left.compare(right)}
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortStableFalseDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let comparator = {left: Int8, right: Int8 => right.compare(left)}
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1, descending: true)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortByStableTrueDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            } else {
                {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            }
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, by: comparator, stable: true)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
                @Assert(arr[j][1], arr1[j][1])
            }
        }
    }

    @TestCase
    func sortByStableFalseDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Int8, right: Int8 => right.compare(left)}
            } else {
                {left: Int8, right: Int8 => left.compare(right)}
            }
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1, by: comparator)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortByStableTrueDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            } else {
                {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            }
            let comparator1 = if (y == 0) {
                {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            } else {
                {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            }
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, by: comparator1, stable: true, descending: true)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
                @Assert(arr[j][1], arr1[j][1])
            }
        }
    }

    @TestCase
    func sortByStableFalseDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Int8, right: Int8 => left.compare(right)}
            } else {
                {left: Int8, right: Int8 => right.compare(left)}
            }
            let comparator1 = if (y == 0) {
                {left: Int8, right: Int8 => right.compare(left)}
            } else {
                {left: Int8, right: Int8 => left.compare(right)}
            }
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1, by: comparator1, descending: true)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortLessThanStableTrueDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            } else {
                {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            }
            let lessThan = {
                l: Array<Int8>, r: Array<Int8> => match (comparator(l, r)) {
                    case LT => true
                    case _ => false
                }
            }
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, lessThan: lessThan, stable: true)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
                @Assert(arr[j][1], arr1[j][1])
            }
        }
    }

    @TestCase
    func sortLessThanStableFalseDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Int8, right: Int8 => right.compare(left)}
            } else {
                {left: Int8, right: Int8 => left.compare(right)}
            }
            let lessThan = {
                l: Int8, r: Int8 => match (comparator(l, r)) {
                    case LT => true
                    case _ => false
                }
            }
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1, lessThan: lessThan)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortLessThanStableTrueDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            } else {
                {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            }
            let comparator1 = if (y == 0) {
                {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            } else {
                {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            }
            let lessThan = {
                l: Array<Int8>, r: Array<Int8> => match (comparator1(l, r)) {
                    case LT => true
                    case _ => false
                }
            }
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, lessThan: lessThan, stable: true, descending: true)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
                @Assert(arr[j][1], arr1[j][1])
            }
        }
    }

    @TestCase
    func sortLessThanStableFalseDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Int8>(n, {_ => DF()})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = if (y == 0) {
                {left: Int8, right: Int8 => left.compare(right)}
            } else {
                {left: Int8, right: Int8 => right.compare(left)}
            }
            let comparator1 = if (y == 0) {
                {left: Int8, right: Int8 => right.compare(left)}
            } else {
                {left: Int8, right: Int8 => left.compare(right)}
            }
            let lessThan = {
                l: Int8, r: Int8 => match (comparator1(l, r)) {
                    case LT => true
                    case _ => false
                }
            }
            insertionSort(arr, 0, n - 1, comparator)
            sort(arr1, lessThan: lessThan, descending: true)
            for (j in 0..n) {
                @Assert(arr[j], arr1[j])
            }
        }
    }

    @TestCase
    func sortKeyStableTrueDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, key: {i: Array<Int8> => i[0]}, stable: true, descending: true)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
                @Assert(arr[j][1], arr1[j][1])
            }
        }
    }

    @TestCase
    func sortKeyStableFalseDescendingTrue(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = {left: Array<Int8>, right: Array<Int8> => right[0].compare(left[0])}
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, key: {i: Array<Int8> => i[0]}, stable: false, descending: true)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
            }
        }
    }

    @TestCase
    func sortKeyStableTrueDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, key: {i: Array<Int8> => i[0]}, stable: true, descending: false)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
                @Assert(arr[j][1], arr1[j][1])
            }
        }
    }

    @TestCase
    func sortKeyStableFalseDescendingFalse(): Unit {
        for (_ in 0..TESTING_TIMES) {
            let n = Int64(NUM() % LONG_ARRAY_SIZE)
            var arr = Array<Array<Int8>>(n, {_ => [DF(), DF()]})
            let arr1 = ArrayList.of(arr)
            let y = NUM() % 2
            let comparator = {left: Array<Int8>, right: Array<Int8> => left[0].compare(right[0])}
            insertionSortArray(arr, 0, n - 1, comparator)
            sort(arr1, key: {i: Array<Int8> => i[0]}, stable: false, descending: false)
            for (j in 0..n) {
                @Assert(arr[j][0], arr1[j][0])
            }
        }
    }

    @TestCase
    func sortSimple(): Unit {
        var a2 = ArrayList<Int64>()
        a2.add(0)
        a2.add(7)
        a2.add(8)
        a2.add(9)
        a2.add(10)
        a2.add(11)
        a2.add(12)
        a2.add(13)
        a2.add(14)
        a2.add(15)
        sort(a2)
        @Assert(a2.toString(), "[0, 7, 8, 9, 10, 11, 12, 13, 14, 15]")
    }
}
