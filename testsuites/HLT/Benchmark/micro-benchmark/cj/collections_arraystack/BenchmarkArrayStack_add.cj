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

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayStack_Add {
    func strategyBuilder<T>(len!: Int64 = 8) {
        @Strategy
        func strategy(): GenerateEachInputProvider<ArrayStack<T>> {
            GenerateEachInputProvider { =>
                ArrayStack<T>(len)
            }
        }
        strategy
    }

    @Bench[x in strategyBuilder<Int64>()]
    func BenchmarkArrayStack_add_Int64(x: ArrayStack<Int64>): Unit {
        x.add(0)
    }

    @Bench[x in strategyBuilder<UInt8>()]
    func BenchmarkArrayStack_add_UInt8(x: ArrayStack<UInt8>): Unit {
        x.add(0)
    }

    @Bench[x in strategyBuilder<Float64>()]
    func BenchmarkArrayStack_add_Float64(x: ArrayStack<Float64>): Unit {
        x.add(3.1415)
    }

    @Bench[x in strategyBuilder<String>()]
    func BenchmarkArrayStack_add_String(x: ArrayStack<String>): Unit {
        x.add("cangjie")
    }

    @Bench[x in strategyBuilder<Int64>(len: 24)]
    func BenchmarkArrayStack_add_Int64_G16(x: ArrayStack<Int64>): Unit {
        for (i in 0..16) {
            x.add(i)
        }
    }

    @Bench[x in strategyBuilder<Int64>(len: 192)]
    func BenchmarkArrayStack_add_Int64_G128(x: ArrayStack<Int64>): Unit {
        for (i in 0..128) {
            x.add(i)
        }
    }

    @Bench[x in strategyBuilder<Int64>(len: 1536)]
    func BenchmarkArrayStack_add_Int64_G1024(x: ArrayStack<Int64>): Unit {
        for (i in 0..1024) {
            x.add(i)
        }
    }
}