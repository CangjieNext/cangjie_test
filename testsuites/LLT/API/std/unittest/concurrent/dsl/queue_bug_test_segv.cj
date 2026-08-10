/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE-139: %run %run_opt %output %run_args %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan Segmentation fault

import std.unittest.testmacro.*
import std.unittest.concurrent.*
import std.collection.concurrent.ConcurrentLinkedQueue



struct Data <: Equatable<Data> {
    Data(let v: Box<Int64>) {} 

    public operator func ==(other: Data): Bool {
        v.value == other.v.value
    }
}

// todo: when the bug is fixed, we need to copy the bugged version of the queue here as a test that we can detect such bugs.
@ConcurrentTest
class TestConcurrentLinkedQueue {
    var queue = ConcurrentLinkedQueue<Data>()

    @Operation
    func poll() { queue.remove() }

    @Operation
    func peek() { queue.peek() }

    @Operation[x in 0..10]
    func add(x: Int64): Bool { queue.add(Data(Box(x))) }

    @StressTest[scenario in scenarios(
        maxActors: 2, maxOperationPerActor: 3
    ), iterations in [5000]]
    @Configure[randomSeed: 1784806152831902714]
    func test(scenario: ScenarioBuilder<TestConcurrentLinkedQueue>, iterations: Int) {
        scenario
            .iterations(iterations)
            .consistencyModel(Serializability)
    }
}

