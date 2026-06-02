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
const N: Int64 = 500
var sum = 0

@Test
class Test_concurrenthashmap_08 {
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
        //test the function of func [](key: K) using exist key.
        PreData()
        for (j in 0..N) {
            if (let Some(s) <- cmap) {
                @Expect(s[j], j+1)
            }
        }
    }
    @TestCase
    func test_02(): Unit {
        //test the function of func [](key: K) using unexist key.
        PreData()
        for (j in N..2 * N) {
            if (let Some(s) <- cmap) {
                try {
                    s[j]
                } catch (e: NoneValueException) {
                    @Expect(e.message.contains("Value does not exist"))
                    sum += 1
                }
            }
        }
        @Expect(sum, N)
    }
    @TestCase
    func test_03(): Unit {
        //test the function of func [](key: K, value!: V) using unexist and exist key.
        PreData()
        for (j in 0..2 * N) {
            if (let Some(s) <- cmap) {
                if (j <= N - 1) {
                    @Expect(s[j], j+1)
                } else {
                    try {
                        s[j]
                    } catch (e: NoneValueException) {
                        @Expect(e.message.contains("Value does not exist"))
                        sum += 1
                    }
                }
            }
        }
        @Expect(sum, N)
    }
}
