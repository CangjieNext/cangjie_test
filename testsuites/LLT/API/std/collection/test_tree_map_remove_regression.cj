/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

@Test
class TreeMapRemoveRegressionTest {
    @TestCase
    func removeFromEmptyAndMissingKey(): Unit {
        let map = TreeMap<Int64, Int64>()
        @Expect(map.remove(1), None<Int64>)
        @Expect(map.size, 0)

        map.add(all: [(1, 10), (2, 20), (3, 30)])
        @Expect(map.remove(-1), None<Int64>)
        @Expect(map.remove(4), None<Int64>)
        @Expect(map.size, 3)
        @Expect(map.get(2), Some(20))
    }

    @TestCase
    func removeAllInSequentialAndReverseOrder(): Unit {
        let sequential = TreeMap<Int64, Int64>()
        for (i in 0..512) {
            sequential.add(i, i * 2)
        }
        for (i in 0..512) {
            @Expect(sequential.remove(i), Some(i * 2))
            @Expect(sequential.get(i), None<Int64>)
        }
        @Expect(sequential.isEmpty(), true)

        let reverse = TreeMap<Int64, Int64>()
        for (i in 0..512) {
            reverse.add(i, i)
        }
        for (i in 0..512) {
            let key = 511 - i
            @Expect(reverse.remove(key), Some(key))
        }
        @Expect(reverse.size, 0)
    }

    @TestCase
    func removeKeepsSurvivorsOrderedAndReachable(): Unit {
        let map = TreeMap<Int64, Int64>()
        for (i in 0..1000) {
            map.add(i, i)
        }
        for (i in 0..1000 : 2) {
            @Expect(map.remove(i), Some(i))
        }

        var previous = -1
        var count = 0
        for ((key, value) in map) {
            @Expect(key > previous, true)
            @Expect(key % 2, 1)
            @Expect(value, key)
            previous = key
            count++
        }
        @Expect(count, 500)
        @Expect(map.size, 500)
    }

    @TestCase
    func addOverwriteAndReaddAfterDrainPreserveMapContract(): Unit {
        let map = TreeMap<Int64, Int64>()
        @Expect(map.add(7, 70), None<Int64>)
        @Expect(map.add(7, 71), Some(70))
        @Expect(map.size, 1)
        @Expect(map.get(7), Some(71))

        @Expect(map.remove(7), Some(71))
        @Expect(map.isEmpty(), true)
        @Expect(map.add(7, 72), None<Int64>)
        @Expect(map.get(7), Some(72))
    }

    @TestCase
    func removeFirstAndLastPreserveBoundaryValuesThroughDrain(): Unit {
        let empty = TreeMap<Int64, Int64>()
        @Expect(empty.removeFirst().isNone(), true)
        @Expect(empty.removeLast().isNone(), true)

        let single = TreeMap<Int64, Int64>()
        single.add(7, 70)
        let only = single.removeFirst().getOrThrow()
        @Expect(only[0], 7)
        @Expect(only[1], 70)
        @Expect(single.isEmpty(), true)
        @Expect(single.removeLast().isNone(), true)

        let map = TreeMap<Int64, Int64>()
        for (i in 0..256) {
            map.add(i, i * 10)
        }
        for (i in 0..128) {
            let first = map.removeFirst().getOrThrow()
            let last = map.removeLast().getOrThrow()
            @Expect(first[0], i)
            @Expect(first[1], i * 10)
            @Expect(last[0], 255 - i)
            @Expect(last[1], (255 - i) * 10)
        }
        @Expect(map.isEmpty(), true)
    }

    @TestCase
    func removeIfKeepsSuccessorsOrderedAndCanDrainTree(): Unit {
        let empty = TreeMap<Int64, Int64>()
        empty.removeIf({_, _ => true})
        @Expect(empty.isEmpty(), true)

        let single = TreeMap<Int64, Int64>()
        single.add(7, 70)
        single.removeIf({key, _ => key == 7})
        @Expect(single.isEmpty(), true)

        let map = TreeMap<Int64, Int64>()
        for (i in 0..512) {
            map.add(i, i * 10)
        }
        map.removeIf({key, _ => key % 3 == 0})

        var previous = -1
        var count = 0
        for ((key, value) in map) {
            @Expect(key > previous, true)
            @Expect(key % 3 != 0, true)
            @Expect(value, key * 10)
            previous = key
            count++
        }
        @Expect(count, 341)
        @Expect(map.size, 341)

        map.removeIf({_, _ => true})
        @Expect(map.isEmpty(), true)
        @Expect(map.removeFirst().isNone(), true)
        @Expect(map.removeLast().isNone(), true)
    }
}
