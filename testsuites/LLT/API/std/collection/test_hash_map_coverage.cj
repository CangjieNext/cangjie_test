/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt -Woff unused
// EXEC: %run %run_opt %output %run_utest_opt

import std.collection.*

/*
 * Branch-focused coverage for std.collection hash_map.cj:
 * resize chains, contains(all:), keys/values views, entryView absent/present,
 * remove from bucket chain, aggregate helpers on a large map.
 */
@Test
class HashMapCoverageTest {
    var collected = ArrayList<Int64>()

    func buildLargeMap(): HashMap<Int64, Int64> {
        HashMap<Int64, Int64>(8192, {i => (i, i * 3)})
    }

    @TestCase
    func testAddAllAndReplaceExistingKey(): Unit {
        let map = HashMap<Int64, Int64>([(1, 1), (2, 2)])
        map.add(all: [(3, 3), (4, 4)])
        @Expect(map.size, 4)
        map.add(2, 22)
        @Expect(map.get(2), Some(22))
        map.add(all: [(5, 5), (6, 6)])
        @Expect(map.contains(5), true)
    }

    @TestCase
    func testLargeMapResizeAndIteration(): Unit {
        let map = buildLargeMap()
        let allKeys = ArrayList<Int64>()
        for (i in 0..8192) {
            allKeys.add(i)
        }
        @Expect(map.contains(all: allKeys), true)
        @Expect(map.keys().contains(all: allKeys), true)
        @Expect(map.keys().isEmpty(), false)
        @Expect(map.values().isEmpty(), false)

        allKeys.add(9999)
        @Expect(map.contains(all: allKeys), false)
        @Expect(map.keys().contains(all: allKeys), false)
    }

    @TestCase
    func testEntryViewPresentAbsentAndUpdate(): Unit {
        let map = buildLargeMap()
        let missing = map.entryView(9999)
        @Expect(missing.value.isNone(), true)
        missing.value = 111
        @Expect(map.get(9999), Some(111))

        let present = map.entryView(10)
        @Expect(present.value, Some(30))
        present.value = 31
        @Expect(map.get(10), Some(31))
    }

    @TestCase
    func testRemoveAndChainCollision(): Unit {
        let map = buildLargeMap()
        @Expect(map.remove(10), Some(30))
        @Expect(map.contains(10), false)
        @Expect(map.remove(10), None<Int64>)

        for (i in 0..8192 : 17) {
            map.remove(i)
        }
        @Expect(map.size < 8192, true)
    }

    @TestCase
    func testMapValuesFilterForEachOnLargeMap(): Unit {
        let map = buildLargeMap()
        let mapped = map.mapValues({v => v + 1})
        @Expect(mapped.get(0), Some(1))
        @Expect(mapped.size, map.size)

        let evens = map.filter({k, _ => k % 2 == 0})
        @Expect(evens.contains(2), true)
        @Expect(evens.contains(1), false)

        collected.clear()
        map.forEach({_, v => collected.add(v)})
        @Expect(collected.size, map.size)
    }

    @TestCase
    func testPredicateHelpersAndClone(): Unit {
        let map = buildLargeMap()
        @Expect(map.all({k, v => v == k * 3}), true)
        @Expect(map.any({k, _ => k == 8191}), true)
        @Expect(map.none({k, _ => k < 0}), true)
        @Expect(map.fold<Int64>(0, {r, k, v => r + k + v}), 4 * 8191 * 8192 / 2)
        var sum: Int64 = 0
        for (i in 0..8192) {
            sum += i * 3
        }
        @Expect(map.reduce({a, b => a + b}), Some(sum))

        let cloned = HashMap<Int64, Int64>(map)
        @Expect(cloned.size, map.size)
        cloned.remove(0)
        @Expect(cloned.get(0), None)
        @Expect(map.get(0), Some(0))
    }

    @TestCase
    func testRemoveAllRemoveIfClearAndReserve(): Unit {
        let map = buildLargeMap()
        let toRemove = ArrayList<Int64>()
        for (i in 0..100) {
            toRemove.add(i)
        }
        map.remove(all: toRemove)
        @Expect(map.contains(0), false)
        @Expect(map.contains(100), true)

        map.removeIf({k, _ => k % 3 == 0})
        @Expect(map.contains(101), true)
        @Expect(map.contains(102), false)
        @Expect(map.size > 0, true)

        let before = map.size
        map.reserve(256)
        map.clear()
        @Expect(map.isEmpty(), true)
        map.add(1, 2)
        @Expect(map.size, 1)
        @Expect(before > 1, true)
    }

    @TestCase
    func testIteratorRemoveAndViewsToArray(): Unit {
        let map = HashMap<Int64, Int64>([(1, 10), (2, 20), (3, 30)])
        var it = map.iterator()
        let first = it.next()
        @Expect(first.isSome(), true)
        if (let Some(pair) <- first) {
            @Expect(pair[0], 1)
            @Expect(pair[1], 10)
        }
        let removed = it.remove()
        @Expect(removed.isSome(), true)
        @Expect(map.size, 2)
        @Expect(it.next().isSome(), true)
        @Expect(it.next().isSome(), true)
        @Expect(it.next().isNone(), true)

        @Expect(map.keys().toArray().contains(2), true)
        @Expect(map.values().toArray().contains(30), true)
        @Expect(map.toString().size > 0, true)
    }

    @TestCase
    func testMapValuesKeyTransformAndEmptyReduce(): Unit {
        let map = HashMap<Int64, Int64>([(5, 50)])
        let keyed = map.mapValues({k, v => k + v})
        @Expect(keyed.get(5), Some(55))

        let empty = HashMap<Int64, Int64>()
        @Expect(empty.reduce({a, b => a + b}), None<Int64>)
        @Expect(empty.all({_, _ => true}), true)
        @Expect(empty.any({_, _ => true}), false)
    }

    @TestCase
    func testIteratorMassRemoveOnLargeMap(): Unit {
        let map = buildLargeMap()
        var it = map.iterator()
        var removed: Int64 = 0
        while (let Some((k, _)) <- it.next()) {
            if (k % 4 == 0) {
                if (it.remove().isSome()) {
                    removed++
                }
            }
        }
        @Expect(removed > 1000, true)
        @Expect(map.size < 8192, true)
    }

    @TestCase
    func testKeysValuesMassIterationAndToString(): Unit {
        let map = buildLargeMap()
        var keyCount: Int64 = 0
        for (k in map.keys()) {
            keyCount++
            if (keyCount > 2000) {
                break
            }
        }
        @Expect(keyCount, 2001)
        var valSum: Int64 = 0
        for (v in map.values()) {
            valSum += v
            if (valSum > 1000000) {
                break
            }
        }
        @Expect(valSum > 1000000, true)
        @Expect(map.toString().contains("0"), true)
    }

    @TestCase
    func testRemoveAllLargeBatchAndReadd(): Unit {
        let map = buildLargeMap()
        let batch = ArrayList<Int64>()
        for (i in 100..501) {
            batch.add(i)
        }
        map.remove(all: batch)
        @Expect(map.contains(100), false)
        @Expect(map.contains(500), false)
        @Expect(map.contains(501), true)
        map.add(all: [(100, 300), (500, 1500)])
        @Expect(map.get(100), Some(300))
    }

    @TestCase
    func testToArrayAndKeysViewContains(): Unit {
        let map = buildLargeMap()
        @Expect(map.toArray().size, 8192)
        @Expect(map.keys().toArray().size, 8192)
        @Expect(map.values().toArray().size, 8192)
        @Expect(map.keys().contains(0), true)
        let subset = ArrayList<Int64>([1, 2, 3])
        @Expect(map.keys().contains(all: subset), true)
        @Expect(map.values().isEmpty(), false)
    }

    @TestCase
    func testAddReplaceFilterAndSecondMapValues(): Unit {
        var map = HashMap<Int64, Int64>([(5, 50)])
        @Expect(map.add(5, 55), Some(50))
        @Expect(map.get(5), Some(55))
        let only = map.filter({k, _ => k == 5})
        @Expect(only.size, 1)
        map.add(all: [(10, 100), (20, 200)])
        @Expect(map.size, 3)
        let valueOnly = map.mapValues({v => v + 1})
        @Expect(valueOnly.get(10), Some(101))
    }

    @TestCase
    func testFullIteratorTraversalAndNonePredicate(): Unit {
        let map = buildLargeMap()
        var count: Int64 = 0
        var it = map.iterator()
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 8192)
        @Expect(map.none({k, _ => k < 0}), true)
        @Expect(map.any({k, _ => k == 0}), true)
    }

    @TestCase
    func testRemoveChainMiddleBucketAndRemoveIfPartial(): Unit {
        var map = HashMap<Int64, Int64>(8)
        for (i in 0..64) {
            map.add(i, i * 2)
        }
        @Expect(map.remove(32), Some(64))
        @Expect(map.remove(33), Some(66))
        @Expect(map.contains(32), false)
        map.removeIf({k, _ => k % 5 == 0})
        @Expect(map.contains(10), false)
        @Expect(map.contains(11), true)
    }

    @TestCase
    func testRemoveIfConcurrentModificationAndEntryViewKey(): Unit {
        let map = HashMap<Int64, Int64>([(1, 10), (2, 20)])
        try {
            map.removeIf({k, _ => map.add(k + 100, 0); true})
            @Expect(false, true)
        } catch (_: ConcurrentModificationException) {
            @Expect(true, true)
        }
        let ev = map.entryView(999)
        ev.value = 7
        @Expect(ev.key, 999)
    }

    @TestCase
    func testFilterCloneAndForEachMutationFree(): Unit {
        let map = buildLargeMap()
        let small = map.filter({k, _ => k < 10})
        @Expect(small.size, 10)
        let cloned = HashMap<Int64, Int64>(small)
        @Expect(cloned.size, 10)
        cloned.add(99, 990)
        @Expect(small.contains(99), false)
        let sum = map.fold<Int64>(0, {r, _, v => r + v})
        @Expect(sum, 3 * 8192 * 8191 / 2)
    }

    @TestCase
    func testIteratorRemoveEveryThirdOnLarge(): Unit {
        var map = buildLargeMap()
        var it = map.iterator()
        var n: Int64 = 0
        while (let Some(_) <- it.next()) {
            if (n % 3 == 0) {
                it.remove()
            }
            n++
        }
        @Expect(map.size < 8192, true)
        @Expect(map.contains(0), false)
    }

    @TestCase
    func testMassRemoveIfAndClearRebuild(): Unit {
        var map = buildLargeMap()
        map.removeIf({k, _ => k % 10 == 0})
        @Expect(map.contains(10), false)
        @Expect(map.contains(11), true)
        map.clear()
        map.add(all: [(1, 2), (3, 4)])
        @Expect(map.size, 2)
    }

    @TestCase
    func testSmallMapChainCollisionsAndRemoveAll(): Unit {
        var map = HashMap<Int64, Int64>(4)
        for (i in 0..128) {
            map.add(i, i + 100)
        }
        @Expect(map.size, 128)
        map.remove(all: [0, 1, 2, 3, 4])
        @Expect(map.contains(0), false)
        @Expect(map.contains(5), true)
    }

    @TestCase
    func testCloneDeepCopyViaPrivateInit(): Unit {
        let map = buildLargeMap()
        let cloned = map.clone()
        @Expect(cloned.size, map.size)
        cloned.add(99999, 1)
        @Expect(map.contains(99999), false)
    }

    @TestCase
    func testEntryViewRemoveExistingKey(): Unit {
        var map = HashMap<Int64, Int64>([(5, 50)])
        map.entryView(5).value = None
        @Expect(map.contains(5), false)
    }

    @TestCase
    func testInvalidCapacityAndSizeThrows(): Unit {
        @ExpectThrows[IllegalArgumentException](HashMap<Int64, Int64>(-1))
        @ExpectThrows[IllegalArgumentException](HashMap<Int64, Int64>(-1, {i => (i, i)}))
    }

    @TestCase
    func testRemoveThenReuseFreeSlots(): Unit {
        var map = HashMap<Int64, Int64>(8)
        for (i in 0..32) {
            map.add(i, i)
        }
        for (i in 0..16) {
            map.remove(i)
        }
        for (i in 100..116) {
            map.add(i, i)
        }
        @Expect(map.contains(100), true)
        @Expect(map.contains(0), false)
    }

    @TestCase
    func testUpdateExistingKeyInBucketChain(): Unit {
        var map = HashMap<Int64, Int64>(4)
        for (i in 0..20) {
            map.add(i, i)
        }
        map.add(10, 999)
        @Expect(map.get(10), Some(999))
    }

    @TestCase
    func testOperatorSubscriptGetSetAndMissing(): Unit {
        var map = HashMap<Int64, Int64>([(1, 10)])
        @Expect(map[1], 10)
        map[2] = 20
        @Expect(map[2], 20)
        @ExpectThrows[NoneValueException](map[99])
    }

    @TestCase
    func testRemoveIfConcurrentModification(): Unit {
        let map = HashMap<Int64, Int64>([(1, 1), (2, 2)])
        try {
            map.removeIf({k, _ => map.add(k + 100, 0); true})
            @Expect(false, true)
        } catch (_: ConcurrentModificationException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testReserveTriggersResizeAndModCount(): Unit {
        var map = HashMap<Int64, Int64>(4)
        for (i in 0..8) {
            map.add(i, i)
        }
        map.reserve(512)
        for (i in 8..200) {
            map.add(i, i)
        }
        @Expect(map.size, 200)
        @Expect(map.contains(199), true)
    }

    @TestCase
    func testRemoveMiddleOfLongBucketChain(): Unit {
        var map = HashMap<Int64, Int64>(4)
        for (i in 0..100) {
            map.add(i * 97, i)
        }
        for (i in 10..90) {
            map.remove(i * 97)
        }
        @Expect(map.contains(0), true)
        @Expect(map.contains(970), false)
        @Expect(map.contains(99 * 97), true)
    }

    @TestCase
    func testEntryViewConcurrentModificationOnRead(): Unit {
        let map = HashMap<Int64, Int64>([(1, 1)])
        let ev = map.entryView(1)
        map.add(2, 2)
        try {
            ev.key
            @Expect(false, true)
        } catch (_: ConcurrentModificationException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testKeysIteratorConcurrentModification(): Unit {
        let map = buildLargeMap()
        var it = map.keys().iterator()
        @Expect(it.next().isSome(), true)
        map.add(99999, 1)
        try {
            it.next()
            @Expect(false, true)
        } catch (_: ConcurrentModificationException) {
            @Expect(true, true)
        }
    }
}
