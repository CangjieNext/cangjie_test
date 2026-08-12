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

import std.collection.*
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayStack_Remove {
    func strategyBuilder<T>(len: Int64, element!: T) {
        @Strategy
        func strategy(): GenerateEachInputProvider<ArrayStack<T>> {
            GenerateEachInputProvider { =>
                let arrdeque = ArrayStack<T>(len)
                for (_ in 0..len) {
                    arrdeque.add(element)
                }
                return arrdeque
            }
        }
        strategy
    }

    @Bench[x in strategyBuilder<Int64>(8, element: 0)]
    func BenchmarkArrayStack_remove_Int64_N8(x: ArrayStack<Int64>): Unit {
        blackBox(x.remove())
    }

    @Bench[x in strategyBuilder<UInt8>(8, element: 0)]
    func BenchmarkArrayStack_remove_UInt8(x: ArrayStack<UInt8>): Unit {
        blackBox(x.remove())
    }

    @Bench[x in strategyBuilder<String>(8, element: "test")]
    func BenchmarkArrayStack_remove_String(x: ArrayStack<String>): Unit {
        blackBox(x.remove())
    }

    @Bench[x in strategyBuilder<Int64>(128, element: 0)]
    func BenchmarkArrayStack_remove_Int64_N128(x: ArrayStack<Int64>): Unit {
        blackBox(x.remove())
    }
}