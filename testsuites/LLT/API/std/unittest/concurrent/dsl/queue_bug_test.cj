/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan FAILED: 1
// ASSERT: scan consistency validation failed
// ASSERT: scan NOT serializable
// ASSERT: scan Ordering: no constraints
// ASSERT: scan Actor 0
// ASSERT: scan Actor 1
// ASSERT: scan poll
// ASSERT: scan add(1)
// ASSERT: scan peek
// ASSERT: scan peek
// ASSERT: scan poll
// ASSERT: scan ✗
// ASSERT: scan ≠
// ASSERT: scan-not Executed operations:

import std.unittest.testmacro.*
import std.unittest.concurrent.*
import std.collection.concurrent.ConcurrentLinkedQueue



// todo: when the bug is fixed, we need to copy the bugged version of the queue here as a test that we can detect such bugs.
@ConcurrentTest
class TestConcurrentLinkedQueue {
    var queue = ConcurrentLinkedQueue<Int64>()

    @Operation
    func poll() { queue.remove() }

    @Operation
    func peek() { queue.peek() }

    @Operation[x in 0..10]
    func add(x: Int64): Bool { queue.add(x) }

    @StressTest[scenario in scenarios(
        maxActors: 2, maxOperationPerActor: 3
    ), iterations in [100, 20000]]
    @Configure[randomSeed: 1784806152831902714]
    func test(scenario: ScenarioBuilder<TestConcurrentLinkedQueue>, iterations: Int) {
        scenario
            .iterations(iterations)
            .consistencyModel(Serializability)
    }
}
