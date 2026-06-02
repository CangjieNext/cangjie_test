/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.concurrent.*

var cmap = Option<ConcurrentHashMap<Int64, Int64>>.None
const N: Int64 = 100

@Test
class Test_concurrenthashmap_22 {
    public func PreData(): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.put(i, i + 1)
        }
        cmap = Option<ConcurrentHashMap<Int64, Int64>>.Some(cmap1)
    }
    @TestCase
    func test_01(): Unit {
        //put the data and then test the ConcurrentHashMapIterator next.
        PreData()
        let res = cmap.getOrThrow().iterator()
        let Arr = Array<(Int64, Int64)>(N, {i => (i, i + 1)})
        for (i in 0..N) {
            @Expect(res.next().getOrThrow()[0], Arr[i][0])
        }
    }

    @TestCase
    func test_02(): Unit {
        //put the data and then test the ConcurrentHashMapIterator next.
        PreData()
        let res = cmap.getOrThrow().iterator()
        let Arr = Array<(Int64, Int64)>(N, {i => (i, i + 1)})
        for (i in 0..N) {
            @Expect(res.next().getOrThrow()[1], Arr[i][1])
        }
    }

    @TestCase
    func test_03(): Unit {
        //put the data and then test the init ConcurrentHashMapIterator using next.
        PreData()
        let res = ConcurrentHashMapIterator<Int64, Int64>(cmap.getOrThrow())
        let Arr = Array<(Int64, Int64)>(N, {i => (i, i + 1)})
        for (i in 0..N) {
            @Expect(res.next().getOrThrow()[0], Arr[i][0])
        }
    }

    @TestCase
    func test_04(): Unit {
        //put the data and then test the init ConcurrentHashMapIterator using next.
        PreData()
        let res = ConcurrentHashMapIterator<Int64, Int64>(cmap.getOrThrow())
        let Arr = Array<(Int64, Int64)>(N, {i => (i, i + 1)})
        for (i in 0..N) {
            @Expect(res.next().getOrThrow()[1], Arr[i][1])
        }
    }
}
