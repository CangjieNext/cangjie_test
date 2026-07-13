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
 * Branch-focused coverage for std.collection middle_operation.cj iterator adapters.
 */
@Test
class CollectionMiddleOpsCoverageTest {
    func buildLarge(): ArrayList<Int64> {
        ArrayList<Int64>(4096, {i => i})
    }

    @TestCase
    func testFilterMapFlatMapOnLargeIterable(): Unit {
        let list = buildLarge()
        let mapped = collectArray(list.iterator().filterMap<Int64>({x => if (x % 2 == 0) { Some(x) } else { None }}))
        @Expect(mapped.size, 2048)
        let flat = collectArray(flatMap<Int64, Int64>({x => ArrayList([x, x + 1])})(list))
        @Expect(flat.size, 8192)
    }

    @TestCase
    func testSkipTakeStepOnLargeIterable(): Unit {
        let list = buildLarge()
        @Expect(collectArray(skip(100)(list)).size, 3996)
        @Expect(collectArray(take(50)(list)).size, 50)
        @Expect(collectArray(step(512)(list)).size, 8)
        @Expect(collectArray(skip(5000)(list)).size, 0)
    }

    @TestCase
    func testZipConcatEnumerateOnLargeIterable(): Unit {
        let list = buildLarge()
        let other = ArrayList<Int64>(4096, {i => i + 10000})
        @Expect(collectArray(zip(other)(list)).size, 4096)
        let head = ArrayList<Int64>([99])
        @Expect(collectArray(concat(head)(list)).size, 4097)
        @Expect(collectArray(enumerate(list)).size, 4096)
    }

    @TestCase
    func testSkipInvalidArgument(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @ExpectThrows[IllegalArgumentException](collectArray(skip(-1)(list)))
    }
}
