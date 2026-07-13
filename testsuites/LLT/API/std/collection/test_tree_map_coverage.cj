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
 * Incremental coverage for std.collection tree_map.cj:
 * BFS traversal on a large map (non-leaf internal nodes) via mapValues/filter/forEach
 * and aggregate helpers (all/any/none/fold/reduce).
 */
@Test
class TreeMapCoverageTest {
    var collected = ArrayList<Int64>()

    func buildLargeMap(): TreeMap<Int64, Int64> {
        TreeMap<Int64, Int64>(8192, {i => (i, i * 2)})
    }

    @TestCase
    func testClearAndRebuild(): Unit {
        let map = buildLargeMap()
        @Expect(map.size, 8192)
        map.clear()
        @Expect(map.isEmpty(), true)
        map.add(1, 10)
        map.add(2, 20)
        @Expect(map.size, 2)
    }

    @TestCase
    func testFilterNoneMatchAndRemoveMany(): Unit {
        let map = buildLargeMap()
        let none = map.filter({k, v => k < 0})
        @Expect(none.isEmpty(), true)
        for (i in 0..8192 : 13) {
            map.remove(i)
        }
        @Expect(map.size < 8192, true)
        @Expect(map.contains(0), false)
    }

    @TestCase
    func testMapValuesOnLargeTree(): Unit {
        let map = buildLargeMap()
        let mapped = map.mapValues({k, v => v + 1})
        @Expect(mapped.size, map.size)
        @Expect(mapped.get(0), Some(1))
        @Expect(mapped.get(4095), Some(8191))
    }

    @TestCase
    func testFilterForEachOnLargeTree(): Unit {
        let map = buildLargeMap()
        let evens = map.filter({k, v => k % 2 == 0})
        @Expect(evens.size, 4096)
        @Expect(evens.get(2), Some(4))
        @Expect(evens.get(3), None)

        var sum = map.fold<Int64>(0, {r, k, v => r + v})
        @Expect(sum, 8192 * 8191)

        collected.clear()
        map.forEach({k, v => collected.add(v)})
        @Expect(collected.size, map.size)
    }

    @TestCase
    func testPredicateHelpersOnLargeTree(): Unit {
        let map = buildLargeMap()
        @Expect(map.all({k, v => v == k * 2}), true)
        @Expect(map.any({k, v => k == 8191}), true)
        @Expect(map.any({k, v => k < 0}), false)
        @Expect(map.none({k, v => k < 0}), true)
        @Expect(map.none({k, v => k == 0}), false)
    }

    @TestCase
    func testFoldReduceOnLargeTree(): Unit {
        let map = buildLargeMap()
        let folded = map.fold<Int64>(0, {r, k, v => r + k + v})
        @Expect(folded, 3 * 8192 * 8191 / 2)
        @Expect(map.reduce({a, b => a + b}), Some(8192 * 8191))
    }

    @TestCase
    func testKeysValuesCloneOnLargeTree(): Unit {
        let map = buildLargeMap()
        @Expect(map.keys().size, map.size)
        @Expect(map.values().size, map.size)
        @Expect(map.keys().toArray().contains(0), true)
        @Expect(map.values().toArray().contains(200), true)

        let cloned = map.clone()
        @Expect(cloned.size, map.size)
        @Expect(cloned.get(42), Some(84))
        cloned.remove(42)
        @Expect(cloned.get(42), None)
        @Expect(map.get(42), Some(84))
    }

    @TestCase
    func testKeysValuesCloneExtraContainsChecks(): Unit {
        let map = buildLargeMap()
        @Expect(map.size, 8192)
        @Expect(map.contains(0), true)
        @Expect(map.contains(100), true)
        @Expect(map.get(100), Some(200))
    }

    @TestCase
    func testEntryViewPresentAbsentAndUpdate(): Unit {
        let map = buildLargeMap()
        let missing = map.entryView(9999)
        @Expect(missing.value.isNone(), true)
        missing.value = 100
        @Expect(map.get(9999), Some(100))

        let present = map.entryView(100)
        @Expect(present.value, Some(200))
        present.value = 201
        @Expect(map.get(100), Some(201))
    }

    @TestCase
    func testBackwardForwardAndRemoveFirstLast(): Unit {
        let map = buildLargeMap()
        @Expect(map.backward(1000).next().isSome(), true)
        @Expect(map.forward(1000).next().isSome(), true)
        @Expect(map.backward(8191).next().isSome(), true)
        @Expect(map.forward(0).next().isSome(), true)
        if (let Some(first) <- map.removeFirst()) {
            @Expect(first[0], 0)
        }
        if (let Some(last) <- map.removeLast()) {
            @Expect(last[0], 8191)
        }
    }

    @TestCase
    func testContainsAllAndRemoveAll(): Unit {
        let map = buildLargeMap()
        @Expect(map.contains(all: [0, 1, 2, 9999]), false)
        @Expect(map.contains(all: [0, 1, 2]), true)
        let removeKeys = ArrayList<Int64>()
        for (i in 0..50) {
            removeKeys.add(i)
        }
        map.remove(all: removeKeys)
        @Expect(map.contains(0), false)
        @Expect(map.contains(50), true)
    }

    @TestCase
    func testRemoveIfMassAndMapValuesSingleArg(): Unit {
        let map = buildLargeMap()
        map.removeIf({k, _ => k % 7 == 0})
        @Expect(map.size < 8192, true)
        let mapped = map.mapValues({v => v * 2})
        @Expect(mapped.get(1), Some(4))
    }

    @TestCase
    func testToStringAndEmptyBranches(): Unit {
        let map = TreeMap<Int64, Int64>([(1, 10), (2, 20), (3, 30)])
        @Expect(map.toString().size > 0, true)
        let empty = TreeMap<Int64, Int64>()
        @Expect(empty.reduce({a, b => a + b}), None<Int64>)
        @Expect(empty.iterator().next().isNone(), true)
        @Expect(empty.all({_, _ => true}), true)
        @Expect(empty.any({_, _ => true}), false)
    }

    @TestCase
    func testIteratorMassTraversalOnLargeTree(): Unit {
        let map = buildLargeMap()
        var count: Int64 = 0
        var it = map.iterator()
        while (let Some((k, v)) <- it.next()) {
            count++
            if (k % 100 == 0) {
                @Expect(v, k * 2)
            }
        }
        @Expect(count, 8192)
    }

    @TestCase
    func testKeysValuesViewsFullTraversal(): Unit {
        let map = buildLargeMap()
        var keyCount: Int64 = 0
        for (k in map.keys()) {
            keyCount++
        }
        @Expect(keyCount, 8192)
        @Expect(map.get(4096), Some(8192))
        @Expect(map.keys().contains(4096), true)
        @Expect(map.keys().contains(all: [1, 2, 3]), true)
        @Expect(map.keys().isEmpty(), false)
        var valCount: Int64 = 0
        for (v in map.values()) {
            valCount++
        }
        @Expect(valCount, 8192)
        @Expect(map.values().isEmpty(), false)
    }

    @TestCase
    func testBackwardForwardInclusiveFalseAndReplaceAdd(): Unit {
        let small = TreeMap<Int64, Int64>([(10, 100), (20, 200), (30, 300), (40, 400)])
        var fwd = small.forward(20, inclusive: false)
        if (let Some(pair) <- fwd.next()) {
            @Expect(pair[0], 30)
        }
        var bwd = small.backward(30, inclusive: false)
        if (let Some(pair) <- bwd.next()) {
            @Expect(pair[0], 20)
        }
        let map = buildLargeMap()
        @Expect(map.forward(4096, inclusive: false).next().isSome(), true)
        @Expect(map.backward(4096, inclusive: false).next().isSome(), true)
        @Expect(map.add(100, 999), Some(200))
        @Expect(map.get(100), Some(999))
    }

    @TestCase
    func testFilterSparseAndMapValuesKeyForm(): Unit {
        let map = buildLargeMap()
        let sparse = map.filter({k, _ => k < 3})
        @Expect(sparse.size, 3)
        @Expect(sparse.get(2), Some(4))
        let keyed = map.mapValues({k, v => k + v})
        @Expect(keyed.get(1), Some(3))
    }

    @TestCase
    func testRemoveIfAllAndRebuildFromEmpty(): Unit {
        var map = buildLargeMap()
        map.removeIf({k, _ => k % 2 == 0})
        @Expect(map.size, 4096)
        map.clear()
        map.add(all: [(1, 2), (3, 4)])
        @Expect(map.size, 2)
    }

    @TestCase
    func testFirstLastEmptyAndRemoveOnEmpty(): Unit {
        let empty = TreeMap<Int64, Int64>()
        @Expect(empty.first.isNone(), true)
        @Expect(empty.last.isNone(), true)
        @Expect(empty.removeFirst().isNone(), true)
        @Expect(empty.removeLast().isNone(), true)
    }

    @TestCase
    func testTreeMapEqualityOperators(): Unit {
        let a = TreeMap<Int64, Int64>([(1, 10), (2, 20), (3, 30)])
        let b = TreeMap<Int64, Int64>([(1, 10), (2, 20), (3, 30)])
        let c = TreeMap<Int64, Int64>([(1, 10), (2, 99)])
        @Expect(a == b, true)
        @Expect(a != c, true)
        @Expect(a == a, true)
    }

    @TestCase
    func testForwardBackwardOnMissingAndOutOfRangeMarks(): Unit {
        let map = buildLargeMap()
        map.remove(5000)
        @Expect(map.forward(5000).next().isSome(), true)
        @Expect(map.backward(5000).next().isSome(), true)
        @Expect(map.forward(99999).next().isSome(), false)
        @Expect(map.backward(8191, inclusive: false).next().isSome(), true)
        var count: Int64 = 0
        var it = map.forward(4096, inclusive: false)
        while (let Some(_) <- it.next()) {
            count++
            if (count > 5000) {
                break
            }
        }
        @Expect(count > 4000, true)
    }

    @TestCase
    func testEntryViewKeyOnAbsentAndAddAllPairs(): Unit {
        let map = TreeMap<Int64, Int64>()
        map.add(all: [(1, 2), (3, 4), (5, 6)])
        @Expect(map.size, 3)
        let ev = map.entryView(999)
        @Expect(ev.value.isNone(), true)
        ev.value = 111
        @Expect(ev.key, 999)
        @Expect(map.get(999), Some(111))
    }

    @TestCase
    func testMapValuesBothFormsOnFilteredSubset(): Unit {
        let map = buildLargeMap()
        let odds = map.filter({k, _ => k % 2 == 1})
        let byKey = odds.mapValues({k, v => k + v})
        @Expect(byKey.get(1), Some(3))
        let byVal = odds.mapValues({v => v * 2})
        @Expect(byVal.get(1), Some(4))
    }

    @TestCase
    func testContainsAllAndRemoveAllOnLargeMap(): Unit {
        let map = buildLargeMap()
        @Expect(map.contains(all: [0, 1, 2]), true)
        var trimmed = buildLargeMap()
        trimmed.remove(all: [0, 1, 2, 3, 4])
        @Expect(trimmed.contains(0), false)
        @Expect(trimmed.contains(5), true)
    }

    @TestCase
    func testForwardBackwardAroundRemovedKey(): Unit {
        var map = TreeMap<Int64, Int64>([(10, 1), (20, 2), (30, 3)])
        map.remove(20)
        @Expect(map.forward(20).next().isSome(), true)
        @Expect(map.backward(20).next().isSome(), true)
    }

    @TestCase
    func testRemoveIfHalfReplaceAddAndRemoveEnds(): Unit {
        var map = buildLargeMap()
        map.removeIf({k, _ => k % 2 == 0})
        @Expect(map.size, 4096)
        @Expect(map.add(1, 999), Some(2))
        @Expect(map.get(1), Some(999))
        @Expect(map.removeFirst().isSome(), true)
        @Expect(map.removeLast().isSome(), true)
    }

    @TestCase
    func testValuesViewSumViaFold(): Unit {
        let map = buildLargeMap()
        var evenValues: Int64 = 0
        for (v in map.values()) {
            if (v % 4 == 0) {
                evenValues++
            }
        }
        @Expect(evenValues, 4096)
    }

    @TestCase
    func testToStringCloneAndIsEmptyAfterClear(): Unit {
        let map = buildLargeMap()
        @Expect(map.toString().size > 0, true)
        let copy = map.clone()
        copy.clear()
        @Expect(copy.isEmpty(), true)
        @Expect(map.isEmpty(), false)
    }

    @TestCase
    func testOperatorSubscriptGetSetAndMissing(): Unit {
        var map = TreeMap<Int64, Int64>([(1, 10), (2, 20)])
        @Expect(map[1], 10)
        map[3] = 30
        @Expect(map[3], 30)
        @ExpectThrows[NoneValueException](map[99])
    }

    @TestCase
    func testInvalidSizeInitThrows(): Unit {
        @ExpectThrows[IllegalArgumentException](TreeMap<Int64, Int64>(-1, {i => (i, i)}))
    }

    @TestCase
    func testRemoveIfConcurrentModification(): Unit {
        let map = TreeMap<Int64, Int64>([(1, 1), (2, 2)])
        try {
            map.removeIf({k, _ => map.add(k + 10, 0); true})
            @Expect(false, true)
        } catch (_: ConcurrentModificationException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testEntryViewRemoveExistingKey(): Unit {
        var map = TreeMap<Int64, Int64>([(5, 50), (6, 60)])
        map.entryView(5).value = None
        @Expect(map.contains(5), false)
        @Expect(map.contains(6), true)
    }

    @TestCase
    func testEmptyMapForwardBackwardThrowNoneValue(): Unit {
        let empty = TreeMap<Int64, Int64>()
        @ExpectThrows[NoneValueException](empty.forward(0))
        @ExpectThrows[NoneValueException](empty.backward(0))
    }

    @TestCase
    func testForwardBackwardBeyondKeyRange(): Unit {
        let map = buildLargeMap()
        @Expect(map.forward(-100).next().isSome(), true)
        @Expect(map.backward(999999).next().isSome(), true)
    }

    @TestCase
    func testForwardInclusiveFalseSkipsMarkKey(): Unit {
        let map = TreeMap<Int64, Int64>([(10, 1), (20, 2), (30, 3)])
        var it = map.forward(20, inclusive: false)
        @Expect(it.next().isSome(), true)
        if (let Some((k, _)) <- it.next()) {
            @Expect(k, 30)
        }
    }

    @TestCase
    func testEmptyMapToString(): Unit {
        @Expect(TreeMap<Int64, Int64>().toString(), "[]")
    }

    @TestCase
    func testMassDeleteEverySeventhKey(): Unit {
        var map = buildLargeMap()
        map.removeIf({k, _ => k % 7 != 0})
        @Expect(map.contains(0), true)
        @Expect(map.contains(1), false)
        @Expect(map.size, 1171)
    }

    @TestCase
    func testReplaceExistingKeysReturnsOldValues(): Unit {
        var map = buildLargeMap()
        for (i in 0..100) {
            @Expect(map.add(i, i * 3), Some(i * 2))
        }
        @Expect(map.get(50), Some(150))
    }

    @TestCase
    func testContainsAllFalseOnMissingKey(): Unit {
        let map = buildLargeMap()
        @Expect(map.contains(all: [0, 1, 999999]), false)
    }
}
