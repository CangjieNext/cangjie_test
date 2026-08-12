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
public class Test_LinkedList_Backward {
    func strategyBuilder(len: Int64) {
        @Strategy
        func strategy(): (LinkedList<Int64>, LinkedListNode<Int64>) {
            let linkedlist = LinkedList<Int64>(len, {x: Int64 => x})
            let node = linkedlist.nodeAt(len - 1).getOrThrow()
            return (linkedlist, node)
        }
        strategy
    }

    @Bench[x in strategyBuilder(16)]
    func BenchmarkLinkedList_backward_N16(x: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = x
        let iter = linkedlist.backward(node)
        while (true) {
            match (iter.next()) {
                case Some(i) => ()
                case None => break
            }
        }
    }

    @Bench[x in strategyBuilder(128)]
    func BenchmarkLinkedList_backward_N128(x: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = x
        let iter = linkedlist.backward(node)
        while (true) {
            match (iter.next()) {
                case Some(i) => ()
                case None => break
            }
        }
    }

    @Bench[x in strategyBuilder(4096)]
    func BenchmarkLinkedList_backward_N4096(x: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = x
        let iter = linkedlist.backward(node)
        while (true) {
            match (iter.next()) {
                case Some(i) => ()
                case None => break
            }
        }
    }
}