/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_args

internal import std.random.*
internal import std.unittest.prop_test.*
internal import std.collection.*
internal import std.sort.SortExtension

func requireEquals<T>(lhv: T, rhv: T) where T <: Equatable<T> & ToString {
    if (lhv != rhv) {
        eprintln("Expected ${rhv}, got ${lhv}")
        throw Exception()
    }
}

func sorted<T>(arr: Array<T>): Array<T> where T <: Comparable<T> {
    arr.sort()
    return arr
}

func testArray() {
    requireEquals<Array<Array<Int64>>>(
        collectArray([1, 2, 3, 4, 5].shrink()),
        [
            [],
            [1],
            [1, 2],
            [3, 4, 5],
            [0, 2, 3, 4, 5],
            [1, 0, 3, 4, 5],
            [1, 2, 0, 4, 5],
            [1, 2, 3, 0, 5],
            [1, 2, 3, 4, 0],
            [1, 1, 3, 4, 5],
            [1, 2, 1, 4, 5],
            [1, 2, 3, 1, 5],
            [1, 2, 3, 4, 1],
            [1, 2, 3, 2, 5],
            [1, 2, 3, 4, 2]
        ]
    )
    requireEquals<Array<Array<Int64>>>(
        collectArray(Array<Int64>().shrink()),
        []
    )
    requireEquals<Array<Array<Int64>>>(
        collectArray([1].shrink()),
        [
            [],
            [0]
        ]
    )
    requireEquals<Array<Array<Int64>>>(
        collectArray([1, 2].shrink()),
        [
            [],
            [1],
            [2],
            // shrink elements:
            [0, 2],
            [1, 0],
            [1, 1]
        ]
    )
    requireEquals<Array<Array<Int64>>>(
        collectArray([1, 2, 3].shrink()),
        [
            [],
            [1],
            [2, 3],
            // shrink elements:
            [0, 2, 3],
            [1, 0, 3],
            [1, 2, 0],
            [1, 1, 3],
            [1, 2, 1]
        ]
    )
}

func testArrayList() {
    requireEquals<Array<ArrayList<Int64>>>(
        collectArray(ArrayList([1, 2, 3, 4, 5]).shrink()),
        [
            ArrayList([]),
            ArrayList([1]),
            ArrayList([1, 2]),
            ArrayList([3, 4, 5]),
            ArrayList([0, 2, 3, 4, 5]),
            ArrayList([1, 0, 3, 4, 5]),
            ArrayList([1, 2, 0, 4, 5]),
            ArrayList([1, 2, 3, 0, 5]),
            ArrayList([1, 2, 3, 4, 0]),
            ArrayList([1, 1, 3, 4, 5]),
            ArrayList([1, 2, 1, 4, 5]),
            ArrayList([1, 2, 3, 1, 5]),
            ArrayList([1, 2, 3, 4, 1]),
            ArrayList([1, 2, 3, 2, 5]),
            ArrayList([1, 2, 3, 4, 2])
        ]
    )
    requireEquals<Array<ArrayList<Int64>>>(
        collectArray(ArrayList([1]).shrink()),
        [
            ArrayList([]),
            ArrayList([0])
        ]
    )
    requireEquals<Array<ArrayList<Int64>>>(
        collectArray(ArrayList([1, 2]).shrink()),
        [
            ArrayList([]),
            ArrayList([1]),
            ArrayList([2]),
            // shrink elements:
            ArrayList([0, 2]),
            ArrayList([1, 0]),
            ArrayList([1, 1])
        ]
    )
    requireEquals<Array<ArrayList<Int64>>>(
        collectArray(ArrayList([1, 2, 3]).shrink()),
        [
            ArrayList([]),
            ArrayList([1]),
            ArrayList([2, 3]),
            // shrink elements:
            ArrayList([0, 2, 3]),
            ArrayList([1, 0, 3]),
            ArrayList([1, 2, 0]),
            ArrayList([1, 1, 3]),
            ArrayList([1, 2, 1])
        ]
    )
}

func testHashSet() {
    requireEquals<Array<HashSet<Int64>>>(
        collectArray(HashSet([1, 2, 3, 4, 5]).shrink()),
        [
            HashSet([]),
            HashSet([1, 2]),
            HashSet([3, 4, 5]),
            HashSet([0, 2, 3, 4, 5]),
            HashSet([1, 0, 3, 4, 5]),
            HashSet([1, 2, 0, 4, 5]),
            HashSet([1, 2, 3, 0, 5]),
            HashSet([1, 2, 3, 4, 0]),
            HashSet([1, 1, 3, 4, 5]),
            HashSet([1, 2, 1, 4, 5]),
            HashSet([1, 2, 3, 1, 5]),
            HashSet([1, 2, 3, 4, 1]),
            HashSet([1, 2, 3, 2, 5]),
            HashSet([1, 2, 3, 4, 2])
        ]
    )
    requireEquals<Array<HashSet<Int64>>>(
        collectArray(HashSet<Int64>().shrink()),
        []
    )
    requireEquals<Array<HashSet<Int64>>>(
        collectArray(HashSet([1]).shrink()),
        [
            HashSet([]),
            HashSet([0])
        ]
    )
    requireEquals<Array<HashSet<Int64>>>(
        collectArray(HashSet([1, 2]).shrink()),
        [
            HashSet([]),
            HashSet([1]),
            HashSet([2]),
            // shrink elements:
            HashSet([0, 2]),
            HashSet([1, 0]),
            HashSet([1, 1])
        ]
    )
    requireEquals<Array<HashSet<Int64>>>(
        collectArray(HashSet([1, 2, 3]).shrink()),
        [
            HashSet([]),
            HashSet([1]),
            HashSet([2, 3]),
            // shrink elements:
            HashSet([0, 2, 3]),
            HashSet([1, 0, 3]),
            HashSet([1, 2, 0]),
            HashSet([1, 1, 3]),
            HashSet([1, 2, 1])
        ]
    )
}

func testHashMap() {
    requireEquals<Array<HashMap<Int64, Int64>>>(
        collectArray(HashMap([(1, 1), (2, 2), (3, 3)]).shrink()),
        [
            HashMap([]),
            HashMap([(1, 1)]),
            HashMap([(2, 2), (3, 3)]),
            HashMap([(1, 0), (2, 2), (3, 3)]),
            HashMap([(1, 1), (2, 0), (3, 3)]),
            HashMap([(1, 1), (2, 2), (3, 0)]),
            HashMap([(1, 1), (2, 1), (3, 3)]),
            HashMap([(1, 1), (2, 2), (3, 1)]),
            HashMap([(0, 1), (2, 2), (3, 3)]),
            HashMap([(1, 1), (0, 2), (3, 3)]),
            HashMap([(1, 1), (2, 2), (0, 3)]),
            HashMap([(1, 2), (3, 3)]),
            HashMap([(1, 3), (2, 2)])
        ]
    )
    requireEquals<Array<HashMap<Int64, Int64>>>(
        collectArray(HashMap<Int64, Int64>().shrink()),
        []
    )
    requireEquals<Array<HashMap<Int64, Int64>>>(
        collectArray(HashMap([(1, 1)]).shrink()),
        [
            HashMap([]),
            HashMap([(1, 0)]),
            HashMap([(0, 1)])
        ]
    )
}

main() {
    testArray()
    testArrayList()
    testHashSet()
    testHashMap()
}
