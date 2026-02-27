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
class Test_concurrenthashmap_09 {
    public func PreData(): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.put(i, i + 1)
        }
        cmap = Option<ConcurrentHashMap<Int64, Int64>>.Some(cmap1)
    }

    @TestCase
    func test_01(): Unit {
        //test the function of isEmpty and size with empty.
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        @Expect(cmap1.isEmpty(), true)
        @Expect(cmap1.size, 0)
        @Expect(cmap1.get(1), None)
        @Expect(cmap1.contains(1), false)
    }

    @TestCase
    func test_02(): Unit {
        //test the function of size and isEmpty with not empty.
        PreData()
        @Expect(cmap.getOrThrow().isEmpty(), false)
        @Expect(cmap.getOrThrow().size, N)
    }

    @TestCase
    func test_03(): Unit {
        //test the function of get and contains with exist key.
        PreData()
        for (j in 0..N) {
            @Expect(cmap.getOrThrow().get(j), j+1)
            @Expect(cmap.getOrThrow().contains(j), true)
        }
    }

    @TestCase
    func test_04(): Unit {
        //test the function of get and contains with unexist key.
        PreData()
        for (j in N..2 * N) {
            @Expect(cmap.getOrThrow().get(j), None)
            @Expect(cmap.getOrThrow().contains(j), false)
        }
    }

    @TestCase
    func test_05(): Unit {
        //test the function of get and contains with unexist and exist key.
        PreData()
        for (j in 0..2 * N) {
            if (j <= N - 1) {
                @Expect(cmap.getOrThrow().get(j), j+1)
                @Expect(cmap.getOrThrow().contains(j), true)
            } else {
                @Expect(cmap.getOrThrow().get(j), None)
                @Expect(cmap.getOrThrow().contains(j), false)
            }
        }
    }
}
