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
 * Branch-focused coverage for std.collection end_operation.cj on large iterables.
 */
@Test
class CollectionEndOpsCoverageTest {
    func buildLarge(): ArrayList<Int64> {
        ArrayList<Int64>(4096, {i => i})
    }

    @TestCase
    func testFoldReduceOnLargeIterator(): Unit {
        let list = buildLarge()
        let it = list.iterator()
        @Expect(fold(0, {r, x => r + x})(it), 4096 * 4095 / 2)
        let it2 = list.iterator()
        @Expect(reduce({a, b => a + b})(it2), Some(4096 * 4095 / 2))
    }

    @TestCase
    func testAllAnyNoneContainsOnLargeIterator(): Unit {
        let list = buildLarge()
        @Expect(all<Int64>({x => x >= 0})(list.iterator()), true)
        @Expect(any<Int64>({x => x == 4095})(list.iterator()), true)
        @Expect(none<Int64>({x => x < 0})(list.iterator()), true)
        @Expect(contains(777)(list.iterator()), true)
        @Expect(contains(99999)(list.iterator()), false)
    }

    @TestCase
    func testMaxMinCountIsEmpty(): Unit {
        let list = buildLarge()
        @Expect(max(list.iterator()), Some(4095))
        @Expect(min(list.iterator()), Some(0))
        @Expect(count(list.iterator()), 4096)
        @Expect(isEmpty(list.iterator()), false)
        @Expect(isEmpty(ArrayList<Int64>().iterator()), true)
    }

    @TestCase
    func testReduceOnEmptyAndSingleElement(): Unit {
        @Expect(reduce({a, b => a + b})(ArrayList<Int64>().iterator()), None)
        let one = ArrayList<Int64>([42])
        @Expect(reduce({a, b => a + b})(one.iterator()), Some(42))
    }
}
