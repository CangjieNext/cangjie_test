/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*

// Regression test for the ArrayList stable-sort run-stack overflow: the stack
// capacity was estimated from log2(size / minRun) while the run lengths kept
// on the stack decay Fibonacci-like, so a run layout of 3470, 1062, 657, 404,
// 252, 151, 100, 50, 49 (6195 elements in total) pushed a 9th run into an
// 8-slot stack and threw IndexOutOfBoundsException.

struct RunStackElem <: Comparable<RunStackElem> {
    let key: Int64
    let ordinal: Int64
    init(key: Int64, ordinal: Int64) {
        this.key = key
        this.ordinal = ordinal
    }
    public func compare(that: RunStackElem): Ordering {
        return key.compare(that.key)
    }
}

func makeFibonacciRunArrayList(): ArrayList<RunStackElem> {
    let runLens = [3470, 1062, 657, 404, 252, 151, 100, 50, 49]
    var total = 0
    for (l in runLens) {
        total += l
    }
    var arr = ArrayList<RunStackElem>(total, {i: Int64 => RunStackElem(0, i)})
    var pos = 0
    for (l in runLens) {
        for (j in 0..l) {
            arr[pos] = RunStackElem(j, pos)
            pos++
        }
    }
    return arr
}

func checkSortedAndStableArrayList(arr: ArrayList<RunStackElem>): Bool {
    for (i in 1..arr.size) {
        if (arr[i - 1].key > arr[i].key) {
            return false
        }
        if (arr[i - 1].key == arr[i].key && arr[i - 1].ordinal >= arr[i].ordinal) {
            return false
        }
    }
    return true
}

@Test
class arrayListTimSortRunStackTest {
    @TestCase
    func sortFibonacciRunsStable(): Unit {
        var arr = makeFibonacciRunArrayList()
        @Assert(arr.size, 6195)
        arr.sort(stable: true)
        @Assert(checkSortedAndStableArrayList(arr))
    }
}

main() {
    println("arraylist timsort run stack regression")
}
