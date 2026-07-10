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
 * Branch-focused coverage for std.collection transform_operation.cj collectors.
 */
@Test
class CollectionTransformOpsCoverageTest {
    func buildPairs(): ArrayList<(Int64, Int64)> {
        ArrayList<(Int64, Int64)>(2048, {i => (i, i * 2)})
    }

    @TestCase
    func testCollectLargeHashMapAndHashSet(): Unit {
        let pairs = buildPairs()
        let map = collectHashMap(pairs.iterator())
        @Expect(map.size, 2048)
        @Expect(map.get(100), Some(200))
        let list = ArrayList<Int64>(2048, {i => i})
        let set = collectHashSet(list.iterator())
        @Expect(set.size, 2048)
    }

    @TestCase
    func testCollectArrayListAndString(): Unit {
        let list = ArrayList<Int64>(1024, {i => i})
        let arr = collectArray(list.iterator())
        @Expect(arr.size, 1024)
        let al = collectArrayList(list.iterator())
        @Expect(al.size, 1024)
        let s = collectString<Int64>(delimiter: ",")(list.iterator())
        @Expect(s.size > 0, true)
        @Expect(s.contains("0"), true)
    }

    @TestCase
    func testCollectEmptyIterables(): Unit {
        let empty = ArrayList<Int64>()
        @Expect(collectArray(empty.iterator()).size, 0)
        @Expect(collectHashSet(empty.iterator()).isEmpty(), true)
        @Expect(collectString<Int64>(delimiter: "-")(empty.iterator()), "")
    }
}
