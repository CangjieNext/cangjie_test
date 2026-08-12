/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.runtime.*
import std.collection.*

@When[backend == "cjnative"]
@Test
public class RuntimeApiTest {
    @TestCase
    func testGcAllocatesAndCollects(): Unit {
        var lists = ArrayList<Array<Int64>>()
        for (i in 0..100) {
            lists.add(Array<Int64>(1024, {j => Int64(i + j)}))
        }
        blackBox(lists.size)
        let freedBefore = getGCFreedSize()
        gc(heavy: true)
        @Expect(getGCFreedSize() >= freedBefore)
        lists.clear()
        gc()
    }

    @TestCase
    func testHeapSizesMonotonicRelation(): Unit {
        let maxHeap = getMaxHeapSize()
        let allocated = getAllocatedHeapSize()
        @Expect(allocated <= maxHeap)
    }
}
