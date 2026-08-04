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
public class Test_LinkedList_AddBefore {
    func strategyBuilder(len: Int64, pos: Int64) {
        @Strategy
        func strategy(): GenerateEachInputProvider<(LinkedList<Int64>, LinkedListNode<Int64>)> {
            GenerateEachInputProvider { =>
                let linkedlist = LinkedList<Int64>(len, {x: Int64 => x})
                let node = linkedlist.nodeAt(pos).getOrThrow()
                return (linkedlist, node)
            }
        }
        strategy
    }

    @Bench[tuple in strategyBuilder(16, 0)]
    func BenchmarkLinkedList_addBefore_N16_p1(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = tuple
        linkedlist.addBefore(node, 0)
    }

    @Bench[tuple in strategyBuilder(16, 7)]
    func BenchmarkLinkedList_addBefore_N16_p2(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = tuple
        linkedlist.addBefore(node, 0)
    }

    @Bench[tuple in strategyBuilder(16, 15)]
    func BenchmarkLinkedList_addBefore_N16_p3(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = tuple
        linkedlist.addBefore(node, 0)
    }

    @Bench[tuple in strategyBuilder(256, 0)]
    func BenchmarkLinkedList_addBefore_N256_p1(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = tuple
        linkedlist.addBefore(node, 0)
    }

    @Bench[tuple in strategyBuilder(256, 127)]
    func BenchmarkLinkedList_addBefore_N256_p2(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = tuple
        linkedlist.addBefore(node, 0)
    }

    @Bench[tuple in strategyBuilder(256, 255)]
    func BenchmarkLinkedList_addBefore_N256_p3(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
        let (linkedlist, node) = tuple
        linkedlist.addBefore(node, 0)
    }

    // @Bench[tuple in strategyBuilder(4096, 0)]
    // func BenchmarkLinkedList_addBefore_N4096_p1(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
    //     let (linkedlist, node) = tuple
    //     linkedlist.addBefore(node, 0)
    // }

    // @Bench[tuple in strategyBuilder(4096, 2047)]
    // func BenchmarkLinkedList_addBefore_N4096_p2(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
    //     let (linkedlist, node) = tuple
    //     linkedlist.addBefore(node, 0)
    // }

    // @Bench[tuple in strategyBuilder(4096, 4095)]
    // func BenchmarkLinkedList_addBefore_N4096_p3(tuple: (LinkedList<Int64>, LinkedListNode<Int64>)): Unit {
    //     let (linkedlist, node) = tuple
    //     linkedlist.addBefore(node, 0)
    // }
}