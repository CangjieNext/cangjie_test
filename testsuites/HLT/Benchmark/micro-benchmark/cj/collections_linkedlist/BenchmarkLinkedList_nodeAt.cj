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
public class Test_LinkedList_NodeAt {
    func strategyBuilder(len: Int64) {
        @Strategy
        func strategy(): LinkedList<Int64> {
            LinkedList<Int64>(len, {x: Int64 => x})
        }
        strategy
    }

    @Bench[x in strategyBuilder(16)]
    func BenchmarkLinkedList_nodeAt_N16_p1(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(4))
    }

    @Bench[x in strategyBuilder(16)]
    func BenchmarkLinkedList_nodeAt_N16_p2(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(8))
    }

    @Bench[x in strategyBuilder(16)]
    func BenchmarkLinkedList_nodeAt_N16_p3(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(12))
    }

    @Bench[x in strategyBuilder(256)]
    func BenchmarkLinkedList_nodeAt_N256_p1(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(64))
    }

    @Bench[x in strategyBuilder(256)]
    func BenchmarkLinkedList_nodeAt_N256_p2(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(128))
    }

    @Bench[x in strategyBuilder(256)]
    func BenchmarkLinkedList_nodeAt_N256_p3(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(192))
    }

    @Bench[x in strategyBuilder(4096)]
    func BenchmarkLinkedList_nodeAt_N4096_p1(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(1024))
    }

    @Bench[x in strategyBuilder(4096)]
    func BenchmarkLinkedList_nodeAt_N4096_p2(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(2048))
    }

    @Bench[x in strategyBuilder(4096)]
    func BenchmarkLinkedList_nodeAt_N4096_p3(x: LinkedList<Int64>): Unit {
        blackBox(x.nodeAt(3072))
    }
}