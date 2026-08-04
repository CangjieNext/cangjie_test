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
public class Test_LinkedList_Init {
    func strategyBuilder<T>(len: Int64, element!: T) {
        @Strategy
        func strategy(): ArrayList<T> {
            let arrlist = ArrayList<T>(len)
            for (_ in 0..len) {
                arrlist.add(element)
            }
            return arrlist
        }
        strategy
    }

    @Bench[arr in strategyBuilder<Int64>(16, element: 0)]
    func BenchmarkLinkedList_Init_Int64_N16(arr: ArrayList<Int64>): Unit {
        var linkedList: LinkedList<Int64> = LinkedList<Int64>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<Int64>(256, element: 0)]
    func BenchmarkLinkedList_Init_Int64_N256(arr: ArrayList<Int64>): Unit {
        var linkedList: LinkedList<Int64> = LinkedList<Int64>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<Int64>(2048, element: 0)]
    func BenchmarkLinkedList_Init_Int64_N2048(arr: ArrayList<Int64>): Unit {
        var linkedList: LinkedList<Int64> = LinkedList<Int64>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<Int64>(16384, element: 0)]
    func BenchmarkLinkedList_Init_Int64_N16384(arr: ArrayList<Int64>): Unit {
        var linkedList: LinkedList<Int64> = LinkedList<Int64>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<Int64>(131072, element: 0)]
    func BenchmarkLinkedList_Init_Int64_N131072(arr: ArrayList<Int64>): Unit {
        var linkedList: LinkedList<Int64> = LinkedList<Int64>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<Int64>(1048576, element: 0)]
    func BenchmarkLinkedList_Init_Int64_N1048576(arr: ArrayList<Int64>): Unit {
        var linkedList: LinkedList<Int64> = LinkedList<Int64>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<String>(16, element: "test")]
    func BenchmarkLinkedList_Init_String_N16(arr: ArrayList<String>): Unit {
        var linkedList: LinkedList<String> = LinkedList<String>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<String>(256, element: "test")]
    func BenchmarkLinkedList_Init_String_N256(arr: ArrayList<String>): Unit {
        var linkedList: LinkedList<String> = LinkedList<String>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<String>(2048, element: "test")]
    func BenchmarkLinkedList_Init_String_N2048(arr: ArrayList<String>): Unit {
        var linkedList: LinkedList<String> = LinkedList<String>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<String>(16384, element: "test")]
    func BenchmarkLinkedList_Init_String_N16384(arr: ArrayList<String>): Unit {
        var linkedList: LinkedList<String> = LinkedList<String>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<String>(131072, element: "test")]
    func BenchmarkLinkedList_Init_String_N131072(arr: ArrayList<String>): Unit {
        var linkedList: LinkedList<String> = LinkedList<String>(arr)
        blackBox(linkedList)
    }

    @Bench[arr in strategyBuilder<String>(1048576, element: "test")]
    func BenchmarkLinkedList_Init_String_N1048576(arr: ArrayList<String>): Unit {
        var linkedList: LinkedList<String> = LinkedList<String>(arr)
        blackBox(linkedList)
    }
}
