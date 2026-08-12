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
import std.sort.*

/*
 * Incremental coverage for std.collection array_list.cj:
 * invalid capacity, first/last, take/skip/step error paths and empty inputs,
 * filter/map on empty list, get() bounds.
 */
@Test
class ArrayListCoverageTest {
    var collected = ArrayList<Int64>()

    func buildLarge(): ArrayList<Int64> {
        ArrayList<Int64>(8192, {i => i})
    }

    @TestCase
    func testInvalidCapacity(): Unit {
        @ExpectThrows[IllegalArgumentException](ArrayList<Int64>(-1))
    }

    @TestCase
    func testFirstAndLastProperties(): Unit {
        let empty = ArrayList<Int64>()
        @Expect(empty.first, None)
        @Expect(empty.last, None)

        let list = ArrayList<Int64>([10, 20, 30])
        @Expect(list.first, Some(10))
        @Expect(list.last, Some(30))
    }

    @TestCase
    func testGetOptionBounds(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @Expect(list.get(0), Some(1))
        @Expect(list.get(2), Some(3))
        @Expect(list.get(-1), None)
        @Expect(list.get(3), None)
    }

    @TestCase
    func testTakeSkipStepHappyAndEmpty(): Unit {
        let list = ArrayList<Int64>([0, 1, 2, 3, 4])
        @Expect(list.take(2).toArray(), [0, 1])
        @Expect(list.take(0).toArray(), Array<Int64>())
        @Expect(list.take(10).toArray(), [0, 1, 2, 3, 4])
        @Expect(list.skip(2).toArray(), [2, 3, 4])
        @Expect(list.skip(0).toArray(), [0, 1, 2, 3, 4])
        @Expect(list.skip(10).toArray(), Array<Int64>())
        @Expect(list.step(2).toArray(), [0, 2, 4])

        let empty = ArrayList<Int64>()
        @Expect(empty.take(1).toArray(), Array<Int64>())
        @Expect(empty.skip(1).toArray(), Array<Int64>())
        @Expect(empty.step(1).toArray(), Array<Int64>())
    }

    @TestCase
    func testTakeSkipStepInvalidCount(): Unit {
        let list = ArrayList<Int64>([1])
        @ExpectThrows[IllegalArgumentException](list.take(-1))
        @ExpectThrows[IllegalArgumentException](list.skip(-1))
        @ExpectThrows[IllegalArgumentException](list.step(0))
        @ExpectThrows[IllegalArgumentException](list.step(-2))
    }

    @TestCase
    func testFilterMapEmptyAndNonempty(): Unit {
        let empty = ArrayList<Int64>()
        @Expect(empty.filter({x => x > 0}).toArray(), Array<Int64>())
        @Expect(empty.map<Int64>({x => x + 1}).toArray(), Array<Int64>())

        let list = ArrayList<Int64>([1, 2, 3, 4])
        @Expect(list.filter({x => x % 2 == 0}).toArray(), [2, 4])
        @Expect(list.map<String>({x => "v${x}"}).toArray(), ["v1", "v2", "v3", "v4"])
    }

    @TestCase
    func testTakeSkipZeroAndSkipBeyondSize(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        @Expect(list.take(0).toArray(), Array<Int64>())
        @Expect(list.skip(0).toArray(), [1, 2, 3, 4, 5])
        @Expect(list.skip(10).toArray(), Array<Int64>())
        @Expect(list.take(3).toArray(), [1, 2, 3])
        @Expect(list.step(3).toArray(), [1, 4])
    }

    @TestCase
    func testFirstPropertyOnNonempty(): Unit {
        let list = ArrayList<Int64>([9, 8, 7])
        @Expect(list.first, Some(9))
        @Expect(list.last, Some(7))
        list.remove(at: 0)
        @Expect(list.first, Some(8))
    }

    @TestCase
    func testAddRemoveAndSliceBranches(): Unit {
        var list = ArrayList<Int64>([1, 2, 3])
        list.add(all: [4, 5])
        @Expect(list.toArray(), [1, 2, 3, 4, 5])
        list.add(99, at: 2)
        @Expect(list.toArray(), [1, 2, 99, 3, 4, 5])
        list.add(all: [10, 11], at: 0)
        @Expect(list.get(0), Some(10))
        list.remove(at: 0)
        list.remove(1..4)
        @Expect(list.size >= 1, true)
        list.removeIf({x => x % 2 == 0})
        list.reverse()
        let part = list.slice(0..list.size)
        @Expect(part.size, list.size)
        list.clear()
        @Expect(list.isEmpty(), true)
    }

    @TestCase
    func testAddAtInvalidIndex(): Unit {
        let list = ArrayList<Int64>([1])
        @ExpectThrows[IndexOutOfBoundsException](list.add(2, at: 5))
        @ExpectThrows[IndexOutOfBoundsException](list.remove(at: 3))
    }

    @TestCase
    func testFlatMapFilterMapIntersperseZipEnumerate(): Unit {
        let list = ArrayList<Int64>([0, 1, 2, 3, 4])
        @Expect(list.filterMap<String>({v => if (v < 3) { Some("x${v}") } else { None }}).toArray(),
            ["x0", "x1", "x2"])
        @Expect(list.flatMap({v => ArrayList<Int64>([v, v + 10])}).toArray(),
            [0, 10, 1, 11, 2, 12, 3, 13, 4, 14])
        @Expect(list.intersperse(-1).toArray(), [0, -1, 1, -1, 2, -1, 3, -1, 4])

        let other = ArrayList<String>(["a", "b", "c", "d", "e"])
        let zipped = list.zip(other)
        @Expect(zipped.size, 5)
        @Expect(zipped.toArray()[0][0], 0)
        @Expect(zipped.toArray()[0][1], "a")
        let enumerated = list.enumerate().toArray()[2]
        @Expect(enumerated[0], 2)
        @Expect(enumerated[1], 2)
    }

    @TestCase
    func testAggregateHelpersCloneReserveAndToString(): Unit {
        var list = ArrayList<Int64>([2, 4, 6, 8])
        @Expect(list.all({x => x % 2 == 0}), true)
        @Expect(list.any({x => x == 8}), true)
        @Expect(list.none({x => x < 0}), true)
        @Expect(list.fold<Int64>(0, {r, x => r + x}), 20)
        @Expect(list.reduce({a, b => a + b}), Some(20))

        let empty = ArrayList<Int64>()
        @Expect(empty.reduce({a, b => a + b}), None<Int64>)
        @Expect(empty.any({_ => true}), false)

        list.reserve(100)
        let cloned = list.clone()
        cloned.add(10)
        @Expect(cloned.size, 5)
        @Expect(list.size, 4)
        @Expect(list.toString().contains("2"), true)
    }

    @TestCase
    func testAddAllAtAndRemoveIfMultiple(): Unit {
        var list = ArrayList<Int64>([1, 2, 3])
        list.add(all: [4, 5], at: 1)
        @Expect(list.toArray(), [1, 4, 5, 2, 3])
        list.removeIf({x => x % 2 == 0})
        @Expect(list.toArray(), [1, 5, 3])
        list.add(all: [7, 8], at: 0)
        @Expect(list.get(0), Some(7))
    }

    @TestCase
    func testLargeListSortRemoveRangeAndSlice(): Unit {
        var list = buildLarge()
        @Expect(list.size, 8192)
        sort(list, stable: false)
        @Expect(list.first, Some(0))
        @Expect(list.last, Some(8191))
        list.remove(100..200)
        @Expect(list.size, 8092)
        let part = list.slice(500..600)
        @Expect(part.size, 100)
        sort(list, by: {a, b => if (a < b) { Ordering.LT } else if (a > b) { Ordering.GT } else { Ordering.EQ }})
        @Expect(list.all({x => x >= 0}), true)
    }

    @TestCase
    func testLargeListAggregateAndClone(): Unit {
        let list = buildLarge()
        @Expect(list.fold<Int64>(0, {r, x => r + x}), 8192 * 8191 / 2)
        @Expect(list.reduce({a, b => a + b}), Some(8192 * 8191 / 2))
        let cloned = list.clone()
        cloned.clear()
        @Expect(cloned.isEmpty(), true)
        @Expect(list.size, 8192)
    }

    @TestCase
    func testLargeListFilterMapFlatMapAndRemoveIf(): Unit {
        var list = buildLarge()
        let evens = list.filter({x => x % 2 == 0})
        @Expect(evens.size, 4096)
        list.removeIf({x => x % 17 == 0})
        @Expect(list.size < 8192, true)
        let mapped = list.filterMap<Int64>({x => if (x < 10) { Some(x * 10) } else { None }})
        @Expect(mapped.size, 9)
    }

    @TestCase
    func testEqualsContainsAndSubscript(): Unit {
        let a = ArrayList<Int64>([1, 2, 3])
        let b = ArrayList<Int64>([1, 2, 3])
        let c = ArrayList<Int64>([1, 2, 4])
        @Expect(a == b, true)
        @Expect(a != c, true)
        @Expect(a.contains(2), true)
        @Expect(a.contains(99), false)
        @Expect(ArrayList<Int64>().contains(1), false)
        a[1] = 22
        @Expect(a[1], 22)
        @Expect(a[0], 1)
    }

    @TestCase
    func testRemoveRangeClosedOpenAndEmpty(): Unit {
        var list = ArrayList<Int64>([0, 1, 2, 3, 4, 5])
        list.remove(2..4)
        @Expect(list.toArray(), [0, 1, 4, 5])
        list.remove(1..=1)
        @Expect(list.toArray(), [0, 4, 5])
        list.remove(2..2)
        @Expect(list.size, 3)

        var big = buildLarge()
        let tail = big.slice(8000..8192)
        @Expect(tail.size, 192)
        let closed = big.slice(100..=109)
        @Expect(closed.size, 10)
    }

    @TestCase
    func testRemoveRangeInvalidStepAndBounds(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let badStep = Range<Int64>(0, 2, 2, true, true, false)
        @ExpectThrows[IllegalArgumentException](list.remove(badStep))
        @ExpectThrows[IndexOutOfBoundsException](list.remove(5..6))
    }

    @TestCase
    func testZipEnumerateEmptyAndShorter(): Unit {
        @Expect(ArrayList<Int64>().enumerate().isEmpty(), true)
        @Expect(ArrayList<Int64>().zip(ArrayList<Int64>()).isEmpty(), true)
        let long = ArrayList<Int64>([1, 2, 3, 4, 5])
        let short = ArrayList<Int64>([10, 20])
        @Expect(long.zip(short).size, 2)
        @Expect(long.enumerate().size, 5)
    }

    @TestCase
    func testAddAllViaLinkedListGrowAndEmpty(): Unit {
        var list = ArrayList<Int64>(1)
        let src = LinkedList<Int64>()
        for (i in 0..32) {
            src.addLast(i)
        }
        list.add(all: src)
        @Expect(list.size, 32)
        list.add(all: ArrayList<Int64>())
        @Expect(list.size, 32)
        list.add(all: [100, 101], at: 0)
        @Expect(list.get(0), Some(100))
    }

    @TestCase
    func testForEachAndIteratorOnLargeList(): Unit {
        let list = buildLarge()
        collected.clear()
        list.forEach({x => collected.add(x)})
        @Expect(collected.size, 8192)
        var it = list.iterator()
        var steps: Int64 = 0
        while (let Some(_) <- it.next()) {
            steps++
            if (steps == 100) {
                break
            }
        }
        @Expect(steps, 100)
    }

    @TestCase
    func testRemoveIfClearsAllAndFlatMapEmpty(): Unit {
        var list = ArrayList<Int64>([2, 4, 6])
        list.removeIf({_ => true})
        @Expect(list.isEmpty(), true)
        list.add(all: [1, 2])
        let flat = list.flatMap({_ => ArrayList<Int64>()})
        @Expect(flat.isEmpty(), true)
    }

    @TestCase
    func testOperatorSliceAndRemoveRange(): Unit {
        var list = ArrayList<Int64>([0, 1, 2, 3, 4])
        let part = list[1..4]
        @Expect(part.toArray(), [1, 2, 3])
        list.remove(2..5)
        @Expect(list.toArray(), [0, 1])
    }

    @TestCase
    func testLargeListMassSortAndReverse(): Unit {
        var list = buildLarge()
        sort(list, stable: true)
        @Expect(list[100], 100)
        list.reverse()
        @Expect(list[0], 8191)
        sort(list, stable: false, descending: true)
        @Expect(list[0], 8191)
        sort(list, by: {a, b => if (a < b) { Ordering.LT } else if (a > b) { Ordering.GT } else { Ordering.EQ }})
        @Expect(list.all({x => x >= 0}), true)
    }

    @TestCase
    func testInitFromCollectionAndCopyConstructor(): Unit {
        let src = buildLarge()
        let copy = ArrayList<Int64>(src)
        @Expect(copy.size, src.size)
        @Expect(copy == src, true)
        copy[0] = -1
        @Expect(copy != src, true)
    }

    @TestCase
    func testInitFromArrayAndStaticOf(): Unit {
        let arr: Array<Int64> = [7, 8, 9]
        let fromArr = ArrayList<Int64>(arr)
        @Expect(fromArr.toArray(), [7, 8, 9])
        let fromOf = ArrayList<Int64>.of([1, 2])
        @Expect(fromOf.size, 2)
    }

    @TestCase
    func testGrowFromSmallCapacity(): Unit {
        var list = ArrayList<Int64>(4)
        for (i in 0..128) {
            list.add(i)
        }
        @Expect(list.size, 128)
        @Expect(list.capacity >= 128, true)
    }

    @TestCase
    func testIntersperseSingletonAndRemoveLast(): Unit {
        let one = ArrayList<Int64>([42])
        @Expect(one.intersperse(-1).toArray(), [42])
        var list = ArrayList<Int64>([1, 2, 3])
        @Expect(list.remove(at: 2), 3)
        @Expect(list.size, 2)
    }

    @TestCase
    func testSubscriptSetOutOfBounds(): Unit {
        let list = ArrayList<Int64>([1])
        @ExpectThrows[IndexOutOfBoundsException](list[1] = 2)
        @ExpectThrows[IndexOutOfBoundsException](list[-1] = 2)
    }

    @TestCase
    func testSliceInvalidRangeExceptions(): Unit {
        let list = ArrayList<Int64>([0, 1, 2])
        let badStep = Range<Int64>(0, 2, 2, true, true, false)
        @ExpectThrows[IllegalArgumentException](list.slice(badStep))
        @ExpectThrows[IndexOutOfBoundsException](list.slice(5..6))
    }

    @TestCase
    func testRemoveIfConcurrentModification(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        try {
            list.removeIf({_ => list.add(0); true})
            @Expect(false, true)
        } catch (_: ConcurrentModificationException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testAddAllAtEndViaArrayCollection(): Unit {
        var list = ArrayList<Int64>([1])
        let extra: Array<Int64> = [2, 3, 4]
        list.add(all: extra)
        @Expect(list.toArray(), [1, 2, 3, 4])
        list.add(all: [5, 6], at: list.size)
        @Expect(list.last, Some(6))
    }

    @TestCase
    func testNoneAllAnyShortCircuit(): Unit {
        let list = ArrayList<Int64>([2, 4, 6])
        @Expect(list.none({x => x == 2}), false)
        @Expect(list.all({x => x > 0}), true)
        @Expect(list.any({x => x == 99}), false)
    }

    @TestCase
    func testClearNonemptyAndAddAtSizeIndex(): Unit {
        var list = ArrayList<Int64>([1, 2, 3])
        list.clear()
        @Expect(list.isEmpty(), true)
        list.add(9, at: 0)
        @Expect(list.toArray(), [9])
        list.add(10, at: list.size)
        @Expect(list.toArray(), [9, 10])
    }

    @TestCase
    func testInitNegativeSizeAndInvalidInitElement(): Unit {
        @ExpectThrows[IllegalArgumentException](ArrayList<Int64>(-1, {i => i}))
    }

    @TestCase
    func testRemoveIfKeepsOrderWithGaps(): Unit {
        var list = ArrayList<Int64>([1, 2, 3, 4, 5, 6, 7, 8])
        list.removeIf({x => x % 2 == 0})
        @Expect(list.toArray(), [1, 3, 5, 7])
    }

    @TestCase
    func testIntersperseTwoElementsAndOperatorOpenSlice(): Unit {
        let pair = ArrayList<Int64>([1, 2])
        @Expect(pair.intersperse(0).toArray(), [1, 0, 2])
        let list = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8])
        let tail = list[0..]
        @Expect(tail.size, 9)
        @Expect(tail[0], 0)
    }

    @TestCase
    func testSliceRangeBoundaryExceptions(): Unit {
        let one = ArrayList<Int64>([10])
        @ExpectThrows[IndexOutOfBoundsException](one.slice(1..=5))
        @ExpectThrows[IndexOutOfBoundsException](one.slice(1..5))
        let list = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8])
        @ExpectThrows[IndexOutOfBoundsException](list.slice(-1..5))
        @ExpectThrows[IndexOutOfBoundsException](list.slice(8..=2))
        @Expect(list.slice(0..0).isEmpty(), true)
    }

    @TestCase
    func testAddAllFromArrayListPathAndInsertMiddleNoGrow(): Unit {
        var list = ArrayList<Int64>(32)
        let src = ArrayList<Int64>([1, 2, 3])
        list.add(all: src)
        @Expect(list.size, 3)
        list.add(all: [4, 5], at: 1)
        @Expect(list.toArray(), [1, 4, 5, 2, 3])
    }

    @TestCase
    func testIteratorConcurrentModificationOnNext(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var it = list.iterator()
        @Expect(it.next().isSome(), true)
        list.add(4)
        try {
            it.next()
            @Expect(false, true)
        } catch (_: ConcurrentModificationException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testOperatorGetOutOfBoundsAndEmptySlice(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @ExpectThrows[IndexOutOfBoundsException](list[3])
        @Expect(list[0..0].isEmpty(), true)
    }

    @TestCase
    func testRangeSliceClosedBounds(): Unit {
        let list = buildLarge()
        let head = list.slice(0..=16)
        @Expect(head.size, 17)
        @Expect(head[0], 0)
        @Expect(head[16], 16)
        let mid = list.slice(100..=200)
        @Expect(mid.size, 101)
        @Expect(mid[0], 100)
    }

    @TestCase
    func testRemoveIfClearsRepeatsAndRemoveAt(): Unit {
        var list = ArrayList<Int64>([5, 5, 5, 5])
        list.removeIf({x => x == 5})
        @Expect(list.isEmpty(), true)
        list = ArrayList<Int64>([1, 2, 3])
        list.remove(at: 1)
        @Expect(list.toArray(), [1, 3])
    }

    @TestCase
    func testEqualsSameContentDifferentInstances(): Unit {
        let a = ArrayList<Int64>([1, 2, 3])
        let b = ArrayList<Int64>([1, 2, 3])
        @Expect(a == b, true)
        b.add(4)
        @Expect(a == b, false)
        @Expect(a != b, true)
    }

    @TestCase
    func testReserveAndRemoveAtEndOnLargeList(): Unit {
        var list = buildLarge()
        list.reserve(8192)
        @Expect(list.size, 8192)
        list.remove(at: list.size - 1)
        @Expect(list.size, 8191)
    }

    @TestCase
    func testRemoveRangeMiddleAndSubscriptSetOnLarge(): Unit {
        var list = buildLarge()
        list.remove(100..=200)
        @Expect(list.size, 8192 - 101)
        list[0] = -1
        @Expect(list[0], -1)
    }

    @TestCase
    func testRemoveIfAlternatingCompactionOnLarge(): Unit {
        var list = buildLarge()
        list.removeIf({x => x % 2 == 0})
        @Expect(list.size, 4096)
        @Expect(list[0], 1)
        @Expect(list[1], 3)
    }

    @TestCase
    func testStepTakeSkipOnLargeList(): Unit {
        let list = buildLarge()
        @Expect(list.step(1024).size, 8)
        @Expect(list.take(3).toArray(), [0, 1, 2])
        @Expect(list.skip(8190).size, 2)
    }

    @TestCase
    func testRemoveIfRemovesAllElements(): Unit {
        var list = ArrayList<Int64>([1, 2, 3])
        list.removeIf({x => true})
        @Expect(list.isEmpty(), true)
        @Expect(list.size, 0)
    }

    @TestCase
    func testAddAllAtZeroAndGrowFromEmpty(): Unit {
        var list = ArrayList<Int64>()
        list.add(all: [1, 2, 3], at: 0)
        @Expect(list.toArray(), [1, 2, 3])
        list.add(all: ArrayList<Int64>([4, 5]))
        @Expect(list.size, 5)
    }

    @TestCase
    func testAddAllArrayListAtMiddleWithoutGrow(): Unit {
        var list = ArrayList<Int64>(32)
        list.add(all: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let src = ArrayList<Int64>([90, 91])
        list.add(all: src, at: 5)
        @Expect(list.toArray(), [0, 1, 2, 3, 4, 90, 91, 5, 6, 7, 8, 9])
    }

    @TestCase
    func testEmptyToStringAndFlatMapEmptyResult(): Unit {
        @Expect(ArrayList<Int64>().toString(), "[]")
        let empty = ArrayList<Int64>().flatMap<Int64>({x => ArrayList<Int64>([x])})
        @Expect(empty.isEmpty(), true)
    }

    @TestCase
    func testEqualsFalseForDifferentSizes(): Unit {
        @Expect(ArrayList<Int64>([1]) == ArrayList<Int64>([1, 2]), false)
        @Expect(ArrayList<Int64>([1, 2]) != ArrayList<Int64>([1]), true)
    }

    @TestCase
    func testClearAlreadyEmptyNoOp(): Unit {
        var list = ArrayList<Int64>()
        list.clear()
        @Expect(list.isEmpty(), true)
    }
}
