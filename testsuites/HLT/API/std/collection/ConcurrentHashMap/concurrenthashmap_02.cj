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
const M: Int64 = 2
var sum = 0

@Test
class Test_concurrenthashmap_02 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    public func PreData(): Unit {
        let cmap1 = ConcurrentHashMap<Int64, Int64>()
        for (i in 0..N) {
            cmap1.put(i, i + 1)
        }
        cmap = Option<ConcurrentHashMap<Int64, Int64>>.Some(cmap1)
    }

    @TestCase
    func test_01(): Unit {
        //put the data and then test the function of remove using exist key.
        PreData()
        for (j in N / M..N) {
            cmap.getOrThrow().remove(j)
        }
        let res = Array<Int64>(N / M, repeat: 0)
        let res1 = Array<Int64>(N / M, repeat: -1)
        let resArr = Array<Int64>(N / M, {i => i + 1})
        let resArr1 = Array<Int64>(N / M, repeat: -1)
        for ((k, v) in cmap.getOrThrow()) {
            if (k >= N / M) {
                res[k - N / M] = v
            } else {
                res[k] = v
            }
        }
        @Expect(res, resArr)
        @Expect(res1, resArr1)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_02(): Unit {
        //put the data and then test the function of remove using unexist key.
        PreData()
        for (j in N..2 * N) {
            cmap.getOrThrow().remove(j)
        }
        let res = Array<Int64>(N, repeat: 0)
        let res1 = Array<Int64>(N, repeat: -1)
        let resArr = Array<Int64>(N, {i => i + 1})
        let resArr1 = Array<Int64>(N, repeat: -1)
        for ((k, v) in cmap.getOrThrow()) {
            if (k >= N) {
                res[k - N / M] = v
            } else {
                res[k] = v
            }
        }
        @Expect(res, resArr)
        @Expect(res1, resArr1)
        @Expect(res.size, resArr.size)
    }

    @TestCase
    func test_03(): Unit {
        //test the return value of remove using exist key.
        PreData()
        for (i in 0..N) {
            @Expect(cmap.getOrThrow().remove(i), Some(i+1))
        }
    }

    @TestCase
    func test_04(): Unit {
        //test the return value of remove using unexist key.
        PreData()
        for (i in N..2 * N) {
            @Expect(cmap.getOrThrow().remove(i), None)
        }
    }
}
