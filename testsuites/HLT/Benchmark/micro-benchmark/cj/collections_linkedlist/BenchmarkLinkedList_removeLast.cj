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
public class Test_LinkedList_RemoveLast {
    func strategyBuilder<T>(len: Int64, element!: T) {
        @Strategy
        func strategy(): GenerateEachInputProvider<LinkedList<T>> {
            GenerateEachInputProvider { =>
                let linkedlist = LinkedList<T>()
                for (_ in 0..len) {
                    linkedlist.addFirst(element)
                }
                return linkedlist
            }
        }
        strategy
    }

    @Bench[x in strategyBuilder<Int64>(8, element: 0)]
    func BenchmarkLinkedList_removeLast_Int64_N8(x: LinkedList<Int64>): Unit {
        x.removeLast()
    }

    @Bench[x in strategyBuilder<UInt8>(8, element: 0)]
    func BenchmarkLinkedList_removeLast_UInt8(x: LinkedList<UInt8>): Unit {
        x.removeLast()
    }

    @Bench[x in strategyBuilder<String>(8, element: "test")]
    func BenchmarkLinkedList_removeLast_String(x: LinkedList<String>): Unit {
        x.removeLast()
    }

    @Bench[x in strategyBuilder<Int64>(128, element: 0)]
    func BenchmarkLinkedList_removeLast_Int64_N128(x: LinkedList<Int64>): Unit {
        x.removeLast()
    }

    // time too long
    @Bench[x in strategyBuilder<Int64>(1024, element: 0)]
    func BenchmarkLinkedList_removeLast_Int64_N1024(x: LinkedList<Int64>): Unit {
        x.removeLast()
    }
}