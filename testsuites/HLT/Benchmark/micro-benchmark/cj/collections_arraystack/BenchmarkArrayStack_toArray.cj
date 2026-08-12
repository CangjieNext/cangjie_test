/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.runtime.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayStack_ToArray {
    func strategyBuilder(len: Int64) {
        @Strategy
        func strategy(): ArrayStack<Int64> {
            let arrdeque = ArrayStack<Int64>(len)
            for (i in 0..len) {
                arrdeque.add(i)
            }
            return arrdeque
        }
        strategy
    }

    @Bench[x in strategyBuilder(8)]
    func BenchmarkArrayStack_toArray_Int64_N8(x: ArrayStack<Int64>): Unit {
        blackBox(x.toArray())
    }

    @Bench[x in strategyBuilder(64)]
    func BenchmarkArrayStack_toArray_Int64_N64(x: ArrayStack<Int64>): Unit {
        blackBox(x.toArray())
    }

    @Bench[x in strategyBuilder(256)]
    func BenchmarkArrayStack_toArray_Int64_N256(x: ArrayStack<Int64>): Unit {
        blackBox(x.toArray())
    }

    @Bench[x in strategyBuilder(1024)]
    func BenchmarkArrayStack_toArray_Int64_N1024(x: ArrayStack<Int64>): Unit {
        blackBox(x.toArray())
    }
}