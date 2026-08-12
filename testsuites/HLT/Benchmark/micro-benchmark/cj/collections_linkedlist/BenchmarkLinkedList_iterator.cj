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
public class Test_LinkedList_iterator {
    func strategyBuilder<T>(len: Int64, element!: T) {
        @Strategy
        func strategy(): LinkedList<T> {
            let linkedList = LinkedList<T>()
            for (_ in 0..len) {
                linkedList.addFirst(element)
            }
            return linkedList
        }
        strategy
    }

    @Bench[x in strategyBuilder<Int64>(16, element: 0)]
    func BenchmarkLinkedList_iterator_Int64_N16(x: LinkedList<Int64>): Unit {
        let iter = x.iterator()
        while (true) {
            match (iter.next()) {
                case Some(i) => ()
                case None => break
            }
        }
    }

    @Bench[x in strategyBuilder<Int64>(128, element: 0)]
    func BenchmarkLinkedList_iterator_Int64_N128(x: LinkedList<Int64>): Unit {
        let iter = x.iterator()
        while (true) {
            match (iter.next()) {
                case Some(i) => ()
                case None => break
            }
        }
    }

    @Bench[x in strategyBuilder<String>(16, element: "test")]
    func BenchmarkLinkedList_iterator_String_N16(x: LinkedList<String>): Unit {
        let iter = x.iterator()
        while (true) {
            match (iter.next()) {
                case Some(i) => ()
                case None => break
            }
        }
    }

    @Bench[x in strategyBuilder<String>(128, element: "test")]
    func BenchmarkLinkedList_iterator_String_N128(x: LinkedList<String>): Unit {
        let iter = x.iterator()
        while (true) {
            match (iter.next()) {
                case Some(i) => ()
                case None => break
            }
        }
    }
}