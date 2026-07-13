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
 * Branch-focused coverage for std.collection tree_set.cj on a large set.
 */
@Test
class TreeSetCoverageTest {
    var collected = ArrayList<Int64>()

    func buildLarge(): TreeSet<Int64> {
        TreeSet<Int64>(8192, {i => i})
    }

    @TestCase
    func testLargeSetContainsAndIterators(): Unit {
        let set = buildLarge()
        @Expect(set.contains(8191), true)
        @Expect(set.contains(all: [0, 1, 2, 9999]), false)
        @Expect(set.backward(1000).next().isSome(), true)
        @Expect(set.forward(1000).next().isSome(), true)
        @Expect(set.removeFirst(), Some(0))
        @Expect(set.removeLast(), Some(8191))
    }

    @TestCase
    func testAddRemoveIfAndClone(): Unit {
        let set = buildLarge()
        @Expect(set.add(9000), true)
        @Expect(set.add(9000), false)
        set.removeIf({x => x % 11 == 0})
        @Expect(set.size < 8192, true)
        let cloned = set.clone()
        cloned.clear()
        @Expect(cloned.isEmpty(), true)
        @Expect(set.isEmpty(), false)
    }

    @TestCase
    func testMapFilterForEachOnLargeSet(): Unit {
        let set = buildLarge()
        let mapped = set.map<Int64>({x => x + 1})
        @Expect(mapped.contains(1), true)
        let odds = set.filter({x => x % 2 == 1})
        @Expect(odds.contains(1), true)
        @Expect(odds.contains(2), false)
        collected.clear()
        set.forEach({x => collected.add(x)})
        @Expect(collected.size, set.size)
    }

    @TestCase
    func testPredicateHelpersAndRetain(): Unit {
        let set = buildLarge()
        @Expect(set.all({x => x >= 0}), true)
        @Expect(set.any({x => x > 4000}), true)
        @Expect(set.none({x => x < 0}), true)
        @Expect(set.fold<Int64>(0, {r, x => r + x}), 8192 * 8191 / 2)
        @Expect(set.reduce({a, b => a + b}), Some(8192 * 8191 / 2))
        let keep = HashSet<Int64>([1, 2, 3])
        set.retain(all: keep)
        @Expect(set.size, 3)
        @Expect(set.subsetOf(keep), true)
    }

    @TestCase
    func testFilterMapAndToArray(): Unit {
        let set = buildLarge()
        let fm = set.filterMap<Int64>({x => if (x < 5) { Some(x * 10) } else { None }})
        @Expect(fm.size, 5)
        @Expect(set.toArray().contains(100), true)
        @Expect(set.toString().size > 0, true)
    }

    @TestCase
    func testForwardBackwardInclusiveFalseAndEmptyFirstLast(): Unit {
        let set = TreeSet<Int64>([10, 20, 30, 40])
        @Expect(set.forward(20, inclusive: false).next().isSome(), true)
        @Expect(set.backward(30, inclusive: false).next().isSome(), true)
        let empty = TreeSet<Int64>()
        @Expect(empty.first.isNone(), true)
        @Expect(empty.last.isNone(), true)
    }

    @TestCase
    func testRemoveAllAndContainsAll(): Unit {
        var set = buildLarge()
        set.remove(all: [0, 1, 2, 3, 4])
        @Expect(set.contains(0), false)
        @Expect(set.contains(5), true)
        @Expect(set.contains(all: [5, 6, 7]), true)
    }
}
