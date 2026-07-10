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
 * Branch-focused coverage for std.collection hash_set.cj on a large set.
 */
@Test
class HashSetCoverageTest {
    var collected = ArrayList<Int64>()

    func buildLarge(): HashSet<Int64> {
        HashSet<Int64>(8192, {i => i})
    }

    @TestCase
    func testLargeSetContainsAndViews(): Unit {
        let set = buildLarge()
        @Expect(set.contains(0), true)
        @Expect(set.contains(8191), true)
        @Expect(set.contains(all: [1, 2, 3, 9999]), false)
        @Expect(set.contains(all: [1, 2, 3]), true)
        @Expect(set.toArray().size, set.size)
        @Expect(set.toString().size > 0, true)
    }

    @TestCase
    func testAddRemoveAllAndRemoveIf(): Unit {
        let set = buildLarge()
        @Expect(set.add(9999), true)
        @Expect(set.add(9999), false)
        let batch = ArrayList<Int64>()
        for (i in 0..256) {
            batch.add(i)
        }
        set.remove(all: batch)
        @Expect(set.contains(0), false)
        @Expect(set.contains(300), true)
        set.removeIf({x => x % 7 == 0})
        @Expect(set.size > 0, true)
    }

    @TestCase
    func testMapFilterForEachOnLargeSet(): Unit {
        let set = buildLarge()
        let mapped = set.map<String>({x => "v${x}"})
        @Expect(mapped.contains("v0"), true)
        let evens = set.filter({x => x % 2 == 0})
        @Expect(evens.contains(2), true)
        @Expect(evens.contains(1), false)
        collected.clear()
        set.forEach({x => collected.add(x)})
        @Expect(collected.size, set.size)
    }

    @TestCase
    func testPredicateHelpersCloneRetain(): Unit {
        let set = buildLarge()
        @Expect(set.all({x => x >= 0}), true)
        @Expect(set.any({x => x == 8191}), true)
        @Expect(set.none({x => x < 0}), true)
        @Expect(set.fold<Int64>(0, {r, x => r + x}), 8192 * 8191 / 2)
        @Expect(set.reduce({a, b => a + b}), Some(8192 * 8191 / 2))

        let other = HashSet<Int64>([1, 2, 3, 9999])
        @Expect(set.subsetOf(set), true)
        set.retain(all: other)
        @Expect(set.size, 3)

        let cloned = set.clone()
        cloned.add(42)
        @Expect(cloned.contains(42), true)
        @Expect(set.contains(42), false)
    }

    @TestCase
    func testClearReserveAndFilterMap(): Unit {
        var set = buildLarge()
        set.reserve(512)
        set.clear()
        @Expect(set.isEmpty(), true)
        set.add(all: [10, 20, 30])
        let fm = set.filterMap<Int64>({x => if (x == 20) { Some(x + 1) } else { None }})
        @Expect(fm.contains(21), true)
        @Expect(set.reduce({a, b => a + b}), Some(60))
    }

    @TestCase
    func testSubsetRetainAndRemoveIfOnLargeSet(): Unit {
        var set = buildLarge()
        @Expect(set.subsetOf(set), true)
        let small = HashSet<Int64>([1, 2, 3])
        set.retain(all: small)
        @Expect(set.size, 3)
        @Expect(set.contains(2), true)
    }

    @TestCase
    func testRemoveIfAndToArrayOnLargeSet(): Unit {
        var set = buildLarge()
        set.removeIf({x => x >= 8000})
        @Expect(set.contains(7999), true)
        @Expect(set.contains(8000), false)
        @Expect(set.toArray()[0], 0)
    }
}
