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
import std.deriving.*

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

// does not implement Shrink
@Derive[Equatable, Hashable]
class IntBox <: ToString {
    IntBox(let value: Int64) {}

    public func toString():String {
        value.toString()
    }
}

func testArray() {
    requireEquals<Array<Array<IntBox>>>(
        collectArray([IntBox(1), IntBox(2), IntBox(3), IntBox(4), IntBox(5)].shrink()),
        [
            [],
            [IntBox(1)],
            [IntBox(1), IntBox(2)],
            [IntBox(3), IntBox(4), IntBox(5)]
        ]
    )
    requireEquals<Array<Array<IntBox>>>(
        collectArray(Array<IntBox>().shrink()),
        []
    )
    requireEquals<Array<Array<IntBox>>>(
        collectArray([IntBox(1)].shrink()),
        [[]]
    )
    requireEquals<Array<Array<IntBox>>>(
        collectArray([IntBox(1), IntBox(2)].shrink()),
        [
            [],
            [IntBox(1)],
            [IntBox(2)]
        ]
    )
    requireEquals<Array<Array<IntBox>>>(
        collectArray([IntBox(1), IntBox(2), IntBox(3)].shrink()),
        [
            [],
            [IntBox(1)],
            [IntBox(2), IntBox(3)]
        ]
    )
}

func testArrayList() {
    requireEquals<Array<ArrayList<IntBox>>>(
        collectArray(ArrayList([IntBox(1), IntBox(2), IntBox(3), IntBox(4), IntBox(5)]).shrink()),
        [
            ArrayList([]),
            ArrayList([IntBox(1)]),
            ArrayList([IntBox(1), IntBox(2)]),
            ArrayList([IntBox(3), IntBox(4), IntBox(5)])
        ]
    )
    requireEquals<Array<ArrayList<IntBox>>>(
        collectArray(ArrayList([IntBox(1)]).shrink()),
        [ArrayList([])]
    )
    requireEquals<Array<ArrayList<IntBox>>>(
        collectArray(ArrayList([IntBox(1), IntBox(2)]).shrink()),
        [
            ArrayList([]),
            ArrayList([IntBox(1)]),
            ArrayList([IntBox(2)])
        ]
    )
    requireEquals<Array<ArrayList<IntBox>>>(
        collectArray(ArrayList([IntBox(1), IntBox(2), IntBox(3)]).shrink()),
        [
            ArrayList([]),
            ArrayList([IntBox(1)]),
            ArrayList([IntBox(2), IntBox(3)])
        ]
    )
}

func testHashSet() {
    requireEquals<Array<HashSet<IntBox>>>(
        collectArray(HashSet([IntBox(1), IntBox(2), IntBox(3), IntBox(4), IntBox(5)]).shrink()),
        [
            HashSet([]),
            HashSet([IntBox(1), IntBox(2)]),
            HashSet([IntBox(3), IntBox(4), IntBox(5)])
        ]
    )
    requireEquals<Array<HashSet<IntBox>>>(
        collectArray(HashSet<IntBox>().shrink()),
        []
    )
    requireEquals<Array<HashSet<IntBox>>>(
        collectArray(HashSet([IntBox(1)]).shrink()),
        [HashSet([])]
    )
    requireEquals<Array<HashSet<IntBox>>>(
        collectArray(HashSet([IntBox(1), IntBox(2)]).shrink()),
        [
            HashSet([]),
            HashSet([IntBox(1)]),
            HashSet([IntBox(2)])
        ]
    )
    requireEquals<Array<HashSet<IntBox>>>(
        collectArray(HashSet([IntBox(1), IntBox(2), IntBox(3)]).shrink()),
        [
            HashSet([]),
            HashSet([IntBox(1)]),
            HashSet([IntBox(2), IntBox(3)])
        ]
    )
}

func testHashMapNoKNoV() {
    requireEquals<Array<HashMap<IntBox, IntBox>>>(
        collectArray(HashMap([(IntBox(1), IntBox(1)), (IntBox(2), IntBox(2)), (IntBox(3), IntBox(3))]).shrink()),
        [
            HashMap([]),
            HashMap([(IntBox(1), IntBox(1))]),
            HashMap([(IntBox(2), IntBox(2)), (IntBox(3), IntBox(3))])
        ]
    )
    requireEquals<Array<HashMap<IntBox, IntBox>>>(
        collectArray(HashMap<IntBox, IntBox>().shrink()),
        []
    )
    requireEquals<Array<HashMap<IntBox, IntBox>>>(
        collectArray(HashMap([(IntBox(1), IntBox(1))]).shrink()),
        [HashMap([])]
    )
}

func testHashMapNoK() {
    requireEquals<Array<HashMap<IntBox, Int64>>>(
        collectArray(HashMap([(IntBox(1), 1), (IntBox(2), 2), (IntBox(3), 3)]).shrink()),
        [
            HashMap([]),
            HashMap([(IntBox(1), 1)]),
            HashMap([(IntBox(2), 2), (IntBox(3), 3)]),
            HashMap([(IntBox(1), 0), (IntBox(2), 2), (IntBox(3), 3)]),
            HashMap([(IntBox(1), 1), (IntBox(2), 0), (IntBox(3), 3)]),
            HashMap([(IntBox(1), 1), (IntBox(2), 2), (IntBox(3), 0)]),
            HashMap([(IntBox(1), 1), (IntBox(2), 1), (IntBox(3), 3)]),
            HashMap([(IntBox(1), 1), (IntBox(2), 2), (IntBox(3), 1)])
        ]
    )
    requireEquals<Array<HashMap<IntBox, Int64>>>(
        collectArray(HashMap<IntBox, Int64>().shrink()),
        []
    )
    requireEquals<Array<HashMap<IntBox, Int64>>>(
        collectArray(HashMap([(IntBox(1), 1)]).shrink()),
        [
            HashMap([]),
            HashMap([(IntBox(1), 0)])
        ]
    )
}

func testHashMapNoV() {
    requireEquals<Array<HashMap<Int64, IntBox>>>(
        collectArray(HashMap([(1, IntBox(1)), (2, IntBox(2)), (3, IntBox(3))]).shrink()),
        [
            HashMap([]),
            HashMap([(1, IntBox(1))]),
            HashMap([(2, IntBox(2)), (3, IntBox(3))]),
            HashMap([(0, IntBox(1)), (2, IntBox(2)), (3, IntBox(3))]),
            HashMap([(1, IntBox(1)), (0, IntBox(2)), (3, IntBox(3))]),
            HashMap([(1, IntBox(1)), (2, IntBox(2)), (0, IntBox(3))]),
            HashMap([(1, IntBox(1)), (1, IntBox(2)), (3, IntBox(3))]),
            HashMap([(1, IntBox(1)), (2, IntBox(2)), (1, IntBox(3))])
        ]
    )
    requireEquals<Array<HashMap<Int64, IntBox>>>(
        collectArray(HashMap<Int64, IntBox>().shrink()),
        []
    )
    requireEquals<Array<HashMap<Int64, IntBox>>>(
        collectArray(HashMap([(1, IntBox(1))]).shrink()),
        [
            HashMap([]),
            HashMap([(0, IntBox(1))])
        ]
    )
}

main() {
    testArray()
    testArrayList()
    testHashSet()
    testHashMapNoKNoV()
    testHashMapNoK()
    testHashMapNoV()
}
