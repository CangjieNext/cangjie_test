/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

internal import std.unittest.prop_test.*
internal import std.random.*
internal import std.collection.*

func testConstructionAndAppend() {
    let zero = LazySeq<Int64>()
    if (collectArray(zero) != []) {
        throw Exception()
    }
    let one = LazySeq(0)
    if (collectArray(one) != [0]) {
        throw Exception()
    }

    let two = one.append(2)
    if (collectArray(one) != [0]) {
        throw Exception()
    }
    if (collectArray(two) != [0, 2]) {
        throw Exception()
    }

    let three = two.prepend(4)
    if (collectArray(three) != [4, 0, 2]) {
        throw Exception()
    }

    let five = two.concat(three)
    if (collectArray(five) != [0, 2, 4, 0, 2]) {
        throw Exception()
    }

    let ofIter = LazySeq.of([1, 2, 3, 4, 5].iterator())
    if (collectArray(ofIter) != [1, 2, 3, 4, 5]) {
        throw Exception()
    }
}

func testMix() {
    let mix1 = LazySeq.of([1, 2, 3, 4, 5]).mixWith(LazySeq.of([5, 6, 7]))
    if (collectArray(mix1) != [1, 5, 2, 6, 3, 7, 4, 5]) {
        throw Exception("Expected: [1, 5, 2, 6, 3, 7, 4, 5], got ${collectArray(mix1)}")
    }

    let mix2 = LazySeq<Int64>.mix(LazySeq.of([1, 2, 3, 4, 5]), LazySeq.of([5, 6, 7]))

    if (collectArray(mix2) != [1, 5, 2, 6, 3, 7, 4, 5]) {
        throw Exception("Expected: [1, 5, 2, 6, 3, 7, 4, 5], got ${collectArray(mix2)}")
    }

    let mix3 = LazySeq<Int64>.mix(LazySeq.of([1, 4]), LazySeq.of([2, 5, 7]), LazySeq.of([3, 6, 8, 9]))

    if (collectArray(mix3) != [1, 2, 3, 4, 5, 6, 7, 8, 9]) {
        throw Exception("Expected: [1, 2, 3, 4, 5, 6, 7, 8, 9], got ${collectArray(mix3)}")
    }

    let mix4 = LazySeq<Int64>.mix(LazySeq.of([1, 5]), LazySeq.of([2, 6, 9]), LazySeq.of([3, 7, 10, 11]),
        LazySeq.of([4, 8]))

    if (collectArray(mix4) != [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]) {
        throw Exception("Expected: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], got ${collectArray(mix4)}")
    }

    let mix5 = LazySeq<Int64>.mix(LazySeq.of([1, 6]), LazySeq.of([2, 7, 10]), LazySeq.of([3, 8, 11, 12]),
        LazySeq.of([4, 9]), LazySeq.of([5]))

    if (collectArray(mix5) != [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]) {
        throw Exception("Expected: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], got ${collectArray(mix5)}")
    }
}

func testMap() {
    let empty = LazySeq<Int64>().map<Int64> {it => it + 1}
    if (collectArray(empty) != []) {
        throw Exception()
    }

    let foo = LazySeq<Int64>.of([1, 2, 3, 4]).map<Int64> {it => it * 2}
    if (collectArray(foo) != [2, 4, 6, 8]) {
        throw Exception()
    }
}

main() {
    testConstructionAndAppend()
    testMix()
    testMap()
}
