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
class Test_concurrenthashmap_07 {
    public func PreData(): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.put(i, i + 1)
        }
        cmap = Option<ConcurrentHashMap<Int64, Int64>>.Some(cmap1)
    }

    @TestCase
    func test_01(): Unit {
        //test the function of func [](key: K, value!: V) using exist key.
        PreData()
        for (j in 0..N) {
            if (let Some(s) <- cmap) {
                s[j] = j + 5
            }
        }
        let res = Array<Int64>(N, repeat: 0)
        let resArr = Array<Int64>(N, {i => i + 5})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_02(): Unit {
        //test the function of func [](key: K, value!: V) using unexist key.
        PreData()
        for (j in N..2 * N) {
            if (let Some(s) <- cmap) {
                s[j] = j + 1
            }
        }
        let res = Array<Int64>(2 * N, repeat: 0)
        let resArr = Array<Int64>(2 * N, {i => i + 1})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_03(): Unit {
        //test the function of func [](key: K, value!: V) using unexist and exist key.
        PreData()
        for (j in 0..2 * N) {
            if (let Some(s) <- cmap) {
                s[j] = j + 5
            }
        }
        let res = Array<Int64>(2 * N, repeat: 0)
        let resArr = Array<Int64>(2 * N, {i => i + 5})
        for ((k, v) in cmap.getOrThrow()) {
            res[k] = v
        }
        @Expect(res, resArr)
        @Expect(res.size, resArr.size)
    }
}
