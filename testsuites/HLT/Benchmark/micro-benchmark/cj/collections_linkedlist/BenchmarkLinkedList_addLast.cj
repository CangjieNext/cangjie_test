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
public class Test_LinkedList_AddLast {
    func strategyBuilder<T>() {
        @Strategy
        func strategy(): GenerateEachInputProvider<LinkedList<T>> {
            GenerateEachInputProvider { =>
                LinkedList<T>()
            }
        }
        strategy
    }

    @Bench[x in strategyBuilder<Int64>()]
    func BenchmarkLinkedList_addLast_Int64(x: LinkedList<Int64>): Unit {
        x.addLast(0)
    }

    @Bench[x in strategyBuilder<UInt8>()]
    func BenchmarkLinkedList_addLast_UInt8(x: LinkedList<UInt8>): Unit {
        x.addLast(0)
    }

    @Bench[x in strategyBuilder<Float64>()]
    func BenchmarkLinkedList_addLast_Float64(x: LinkedList<Float64>): Unit {
        x.addLast(3.14)
    }

    @Bench[x in strategyBuilder<String>()]
    func BenchmarkLinkedList_addLast_String(x: LinkedList<String>): Unit {
        x.addLast("test")
    }

    @Bench[x in strategyBuilder<Int64>()]
    func BenchmarkLinkedList_addLast_Int64_G16(x: LinkedList<Int64>): Unit {
        for (i in 0..16) {
            x.addLast(i)
        }
    }

    @Bench[x in strategyBuilder<Int64>()]
    func BenchmarkLinkedList_addLast_Int64_G128(x: LinkedList<Int64>): Unit {
        for (i in 0..128) {
            x.addLast(i)
        }
    }

    @Bench[x in strategyBuilder<Int64>()]
    func BenchmarkLinkedList_addLast_Int64_G1024(x: LinkedList<Int64>): Unit {
        for (i in 0..1024) {
            x.addLast(i)
        }
    }
}