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
 * Branch-focused coverage for std.collection linked_list.cj node and aggregate APIs.
 */
@Test
class LinkedListCoverageTest {
    func buildLarge(): LinkedList<Int64> {
        LinkedList<Int64>(2048, {i => i})
    }

    func buildLarge8192(): LinkedList<Int64> {
        LinkedList<Int64>(8192, {i => i})
    }

    @TestCase
    func testNodeInsertRemoveAndSplitOff(): Unit {
        let list = buildLarge()
        let node = list.nodeAt(10)
        @Expect(node.isSome(), true)
        if (let Some(n) <- node) {
            let inserted = list.addAfter(n, 999)
            @Expect(list.toArray().contains(999), true)
            list.remove(inserted)
            let tail = list.splitOff(n)
            @Expect(tail.size > 0, true)
            @Expect(list.size > 0, true)
        }
        @Expect(list.removeFirst().isSome(), true)
        @Expect(list.removeLast().isSome(), true)
    }

    @TestCase
    func testTakeSkipStepAndReverse(): Unit {
        let list = buildLarge()
        @Expect(list.take(3).toArray(), [0, 1, 2])
        @Expect(list.skip(2000).size, 48)
        @Expect(list.step(64).size > 0, true)
        list.reverse()
        @Expect(list.first, Some(2047))
    }

    @TestCase
    func testFilterMapFlatMapIntersperse(): Unit {
        let list = buildLarge()
        @Expect(list.filter({x => x % 2 == 0}).size, 1024)
        @Expect(list.filterMap<Int64>({x => if (x < 3) { Some(x + 100) } else { None }}).size, 3)
        @Expect(list.flatMap({x => LinkedList([x, x + 2048])}).size, list.size * 2)
        @Expect(list.intersperse(-1).size, list.size * 2 - 1)
    }

    @TestCase
    func testAggregateHelpersAndIterators(): Unit {
        let list = buildLarge()
        @Expect(list.all({x => x >= 0}), true)
        @Expect(list.any({x => x == 2047}), true)
        @Expect(list.none({x => x < 0}), true)
        @Expect(list.fold<Int64>(0, {r, x => r + x}), 2048 * 2047 / 2)
        @Expect(list.reduce({a, b => a + b}), Some(2048 * 2047 / 2))
        if (let Some(n) <- list.nodeAt(1000)) {
            @Expect(list.forward(n).next().isSome(), true)
            @Expect(list.backward(n).next().isSome(), true)
        }
        let other = LinkedList<Int64>([1, 2, 3])
        @Expect(list.zip(other).size, 3)
        @Expect(list.enumerate().toArray()[1][0], 1)
    }

    @TestCase
    func testRemoveIfClearAndToString(): Unit {
        var list = buildLarge()
        list.removeIf({x => x % 17 == 0})
        @Expect(list.size < 2048, true)
        list.clear()
        @Expect(list.isEmpty(), true)
        list.addLast(42)
        @Expect(list.toString().contains("42"), true)
    }

    @TestCase
    func testLarge8192AggregateHelpersAndIterators(): Unit {
        let list = buildLarge8192()
        @Expect(list.all({x => x >= 0}), true)
        @Expect(list.any({x => x == 8191}), true)
        @Expect(list.none({x => x < 0}), true)
        @Expect(list.fold<Int64>(0, {r, x => r + x}), 8192 * 8191 / 2)
        @Expect(list.reduce({a, b => a + b}), Some(8192 * 8191 / 2))
        if (let Some(n) <- list.nodeAt(4000)) {
            @Expect(list.forward(n).next().isSome(), true)
            @Expect(list.backward(n).next().isSome(), true)
        }
    }

    @TestCase
    func testNodeAtInvalidAndAddBeforeAfter(): Unit {
        let list = LinkedList<Int64>([10, 20, 30])
        @Expect(list.nodeAt(-1).isNone(), true)
        @Expect(list.nodeAt(10).isNone(), true)
        if (let Some(n) <- list.nodeAt(1)) {
            list.addBefore(n, 15)
            list.addAfter(n, 25)
            @Expect(list.toArray(), [10, 15, 20, 25, 30])
        }
    }

    @TestCase
    func testRemoveNodeAndSplitOffHead(): Unit {
        var list = buildLarge8192()
        if (let Some(n) <- list.nodeAt(0)) {
            let tail = list.splitOff(n)
            @Expect(list.isEmpty(), true)
            @Expect(tail.size, 8192)
        }
    }

    @TestCase
    func testTakeSkipStepInvalidOnLarge8192List(): Unit {
        let list = buildLarge8192()
        @ExpectThrows[IllegalArgumentException](list.take(-1))
        @ExpectThrows[IllegalArgumentException](list.skip(-1))
        @ExpectThrows[IllegalArgumentException](list.step(0))
        @Expect(list.take(0).isEmpty(), true)
    }

    @TestCase
    func testAddFirstLastAndRemoveNodeMiddle(): Unit {
        var list = LinkedList<Int64>([1, 2, 3, 4])
        list.addFirst(0)
        list.addLast(5)
        if (let Some(n) <- list.nodeAt(2)) {
            @Expect(list.remove(n), 2)
        }
        @Expect(list.toArray(), [0, 1, 3, 4, 5])
    }

    @TestCase
    func testSplitOffTailAndZipEnumerateEmpty(): Unit {
        var list = LinkedList<Int64>([10, 20, 30])
        if (let Some(n) <- list.nodeAt(1)) {
            let tail = list.splitOff(n)
            @Expect(list.toArray(), [10])
            @Expect(tail.toArray(), [20, 30])
        }
        @Expect(LinkedList<Int64>().enumerate().isEmpty(), true)
        @Expect(LinkedList<Int64>().zip(LinkedList<Int64>()).isEmpty(), true)
    }

    @TestCase
    func testLarge8192ListNoneAllAnyAndMembership(): Unit {
        let list = buildLarge8192()
        @Expect(list.none({x => x == 8191}), false)
        @Expect(list.any({x => x == 8191}), true)
        @Expect(list.any({x => x == 99999}), false)
        @Expect(list.all({x => x >= 0 && x < 8192}), true)
    }

    @TestCase
    func testLarge8192ListFilterMapAndFlatMapChain(): Unit {
        let list = buildLarge8192()
        let mapped = list.filter({x => x < 10}).map({x => x * 10})
        @Expect(mapped.toArray(), [0, 10, 20, 30, 40, 50, 60, 70, 80, 90])
        let flat = list.take(5).flatMap({x => LinkedList<Int64>([x, x + 100])})
        @Expect(flat.size, 10)
    }

    @TestCase
    func testNodeAddBeforeAfterOnLarge8192List(): Unit {
        var list = buildLarge8192()
        if (let Some(n) <- list.nodeAt(100)) {
            list.addBefore(n, 999)
            list.addAfter(n, 888)
        }
        @Expect(list.any({x => x == 999}), true)
        @Expect(list.any({x => x == 888}), true)
    }
}
