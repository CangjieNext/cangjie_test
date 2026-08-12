/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

/*
 * Coverage for std.core Array extensions in array_common.cj:
 * indexOf/lastIndexOf (element and sub-array, with fromIndex),
 * trimStart/trimEnd, removePrefix/removeSuffix, Collection/ToString.
 */
@Test
class ArrayCommonCoverageTest {
    @TestCase
    func testIndexOfElementWithFromIndex(): Unit {
        let arr = [1, 2, 3, 2, 4, 2]
        @Expect(arr.indexOf(2), Some(1))
        @Expect(arr.indexOf(2, 0), Some(1))
        @Expect(arr.indexOf(2, 2), Some(3))
        @Expect(arr.indexOf(2, 4), Some(5))
        @Expect(arr.indexOf(2, 6), None)
        @Expect(arr.indexOf(2, -1), Some(1))
        @Expect(arr.indexOf(9), None)
        @Expect(Array<Int64>().indexOf(1), None)
        @Expect(Array<Int64>().indexOf(1, 0), None)
    }

    @TestCase
    func testIndexOfSubArray(): Unit {
        let arr = [1, 2, 3, 4, 2, 3, 5]
        @Expect(arr.indexOf([2, 3]), Some(1))
        @Expect(arr.indexOf([2, 3], 2), Some(4))
        @Expect(arr.indexOf([2, 3], 5), None)
        @Expect(arr.indexOf([2, 3], -1), Some(1))
        @Expect(arr.indexOf([9, 10]), None)
        @Expect(arr.indexOf([1, 2, 3, 4, 2, 3, 5, 6]), None)
        @Expect([1, 2].indexOf([1, 2, 3]), None)
    }

    @TestCase
    func testLastIndexOfElement(): Unit {
        let arr = [1, 2, 3, 2, 4, 2]
        @Expect(arr.lastIndexOf(2), Some(5))
        @Expect(arr.lastIndexOf(2, 0), Some(5))
        @Expect(arr.lastIndexOf(2, 3), Some(5))
        @Expect(arr.lastIndexOf(2, 4), Some(5))
        @Expect(arr.lastIndexOf(2, 5), Some(5))
        @Expect(arr.lastIndexOf(2, 6), None)
        @Expect(arr.lastIndexOf(2, -1), Some(5))
        @Expect(arr.lastIndexOf(9), None)
        @Expect(Array<Int64>().lastIndexOf(1), None)
    }

    @TestCase
    func testLastIndexOfSubArray(): Unit {
        let arr = [1, 2, 3, 4, 2, 3, 5]
        @Expect(arr.lastIndexOf([2, 3]), Some(4))
        @Expect(arr.lastIndexOf([2, 3], 0), Some(4))
        @Expect(arr.lastIndexOf([2, 3], 2), Some(4))
        @Expect(arr.lastIndexOf([2, 3], 4), Some(4))
        @Expect(arr.lastIndexOf([2, 3], 5), None)
        @Expect(arr.lastIndexOf([9, 10]), None)
        @Expect([1, 2].lastIndexOf([1, 2, 3]), None)
    }

    @TestCase
    func testTrimStartWithSet(): Unit {
        let arr = [0, 0, 1, 2, 0, 3]
        @Expect(arr.trimStart([0]), [1, 2, 0, 3])
        @Expect(arr.trimStart([0, 1]), [2, 0, 3])
        @Expect([0, 0, 0].trimStart([0]), Array<Int64>())
        @Expect([1, 2, 3].trimStart([9]), [1, 2, 3])
        @Expect([1, 2, 3].trimStart(Array<Int64>()), [1, 2, 3])
    }

    @TestCase
    func testTrimEndWithSet(): Unit {
        let arr = [1, 2, 0, 3, 0, 0]
        @Expect(arr.trimEnd([0]), [1, 2, 0, 3])
        @Expect(arr.trimEnd([0, 3]), [1, 2])
        @Expect([0, 0, 0].trimEnd([0]), Array<Int64>())
        @Expect([1, 2, 3].trimEnd([9]), [1, 2, 3])
    }

    @TestCase
    func testTrimWithPredicate(): Unit {
        let arr = [0, 0, 1, 2, 0, 3]
        @Expect(arr.trimStart({e => e == 0}), [1, 2, 0, 3])
        @Expect([1, 2, 0, 0].trimEnd({e => e == 0}), [1, 2])
        @Expect([0, 0].trimStart({e => e == 0}), Array<Int64>())
        @Expect([1, 2, 3].trimEnd({e => e > 10}), [1, 2, 3])
    }

    @TestCase
    func testRemovePrefixAndSuffix(): Unit {
        let arr = [1, 2, 3, 4, 5]
        @Expect(arr.removePrefix([1, 2]), [3, 4, 5])
        @Expect(arr.removeSuffix([4, 5]), [1, 2, 3])
        @Expect(arr.removePrefix([9]), arr)
        @Expect(arr.removeSuffix([9]), arr)
        @Expect(arr.removePrefix(Array<Int64>()), arr)
        @Expect(arr.removeSuffix(Array<Int64>()), arr)
        @Expect([1, 2].removePrefix([1, 2, 3]), [1, 2])
        @Expect([1, 2].removeSuffix([0, 1, 2]), [1, 2])
    }

    @TestCase
    func testArrayToString(): Unit {
        @Expect(Array<Int64>().toString(), "[]")
        @Expect([1].toString(), "[1]")
        @Expect([1, 2, 3].toString(), "[1, 2, 3]")
    }

    @TestCase
    func testCollectionInterfaceOnArray(): Unit {
        let arr: Collection<Int64> = [10, 20, 30]
        @Expect(arr.size, 3)
        @Expect(arr.isEmpty(), false)
        @Expect(arr.toArray(), [10, 20, 30])
        var sum = 0
        for (e in arr) {
            sum += e
        }
        @Expect(sum, 60)
        let empty: Collection<Int64> = Array<Int64>()
        @Expect(empty.isEmpty(), true)
        @Expect(empty.size, 0)
    }

    @TestCase
    func testContainsAndEquality(): Unit {
        let arr = [1, 2, 3]
        @Expect(arr.contains(2), true)
        @Expect(arr.contains(9), false)
        @Expect(Array<Int64>().contains(1), false)
        @Expect(arr == [1, 2, 3], true)
        @Expect(arr != [1, 2], true)
        @Expect([1, 2, 3] == [1, 2], false)
        @Expect([1, 2] != [1, 2, 3], true)
    }

    @TestCase
    func testInitWithInitElement(): Unit {
        let arr = Array<Int64>(4, {i => i + 1})
        @Expect(arr.size, 4)
        @Expect(arr[0], 1)
        @Expect(arr[2], 3)
        @Expect(arr[3], 4)
    }

    @TestCase
    func testTrimAllElementsRemoved(): Unit {
        @Expect([1, 1, 1].trimStart([1]), Array<Int64>())
        @Expect([1, 1, 1].trimEnd([1]), Array<Int64>())
        @Expect([0, 0].trimStart({e => e == 0}), Array<Int64>())
        @Expect([0, 0].trimEnd({e => e == 0}), Array<Int64>())
    }

    @TestCase
    func testIndexOfSingleArgAndLastIndexFromIndex(): Unit {
        @Expect([5, 6, 7].indexOf(6), Some(1))
        @Expect([1, 2, 3, 2].lastIndexOf(2, 2), Some(3))
        @Expect([1, 2, 3].lastIndexOf(9, 0), None)
    }

    @TestCase
    func testArrayEqualitySameContent(): Unit {
        @Expect([1, 2] == [1, 2], true)
        @Expect([1, 2] != [2, 1], true)
    }

    @TestCase
    func testRemovePrefixSuffixNoMatchAndFullMatch(): Unit {
        @Expect([1, 2, 3].removePrefix([9]), [1, 2, 3])
        @Expect([1, 2, 3].removeSuffix([9]), [1, 2, 3])
        @Expect([1, 2, 1, 2].removePrefix([1, 2]), [1, 2])
        @Expect([1, 2, 1, 2].removeSuffix([1, 2]), [1, 2])
    }

    @TestCase
    func testIndexOfSubArrayAtEndAndPastEnd(): Unit {
        let arr = [1, 2, 3, 4, 5]
        @Expect(arr.indexOf([4, 5]), Some(3))
        @Expect(arr.indexOf([4, 5], 4), None)
        @Expect(arr.lastIndexOf([1, 2]), Some(0))
        @Expect(arr.lastIndexOf([1, 2], 1), None)
    }
}
