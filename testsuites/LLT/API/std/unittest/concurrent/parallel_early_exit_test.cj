/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt %enableO2
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f

// Verifies early-exit semantics under the default parallel iteration path
// (withState => parallel). Iteration 0 always runs first sequentially; if it
// fails, the callback returns false and no parallel iterations are dispatched.
// ASSERT: scan [ PASSED ] CASE: parallel_all_pass
// ASSERT: scan [ FAILED ] CASE: parallel_iter0_fails
// ASSERT: scan Concurrent test iteration 0 failed
// ASSERT: scan testQueueSerializable
// ASSERT: scan TOTAL: 3

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.concurrent.*
import std.sync.AtomicInt64
import std.collection.concurrent.ConcurrentLinkedQueue

@TestBuilder
func testParallelAllPass(): TestSuite {
    // withState => default parallel. Linearizable counter (+1/-1), verify
    // passes (counter ends at 0). All iterations pass.
    let scenarioBuilder = scenario("parallel_all_pass_scenario")
        .withState { => AtomicInt64(0) }
        .consistencyModel(Linearizability)
        .actor { c => c.fetchAdd(1) }
        .actor { c => c.fetchSub(1) }
        .verify { c => c.load() == 0 }
        .iterations(10)

    let testCase = ConcurrentTestCase.createFromBuilder(
        "parallel_all_pass",
        builder: scenarioBuilder
    )

    TestSuite
        .builder("parallel_all_pass_suite")
        .add(testCase)
        .build()
}

@TestBuilder
func testParallelIterationZeroFails(): TestSuite {
    // withState => default parallel. verify always returns false, so iteration
    // 0 (which runs first sequentially) fails and the callback's false return
    // stops any parallel iterations from being dispatched.
    let scenarioBuilder = scenario("parallel_iter0_fails_scenario")
        .withState { => AtomicInt64(0) }
        .consistencyModel(Linearizability)
        .actor { c => c.fetchAdd(1) }
        .iterations(5)
        .verify { _ => false }

    let testCase = ConcurrentTestCase.createFromBuilder(
        "parallel_iter0_fails",
        builder: scenarioBuilder
    )

    TestSuite
        .builder("parallel_iter0_fails_suite")
        .add(testCase)
        .build()
}


@Test
func testQueueSerializable(): Unit {
    let result = scenario("queue_serializable")
        .consistencyModel(SequentialConsistency)
        .withState { => ConcurrentLinkedQueue<Int64>() }
        .actorWithOps([
            operation("add1", { queue => queue.add(1) }),
            operation("peek", { queue => queue.peek() ?? -1 }),
            operation("add3", { queue => queue.add(3) }),
        ])
        .actorWithOps([
            operation("remove", { queue => queue.remove() ?? -1 }),
            operation("peek", { queue => queue.peek() ?? -1 }),
            operation("remove", { queue => queue.remove() ?? -1 }),
        ])
        .iterations(5000)
        .build()
        .run()
    
    println(result.report())
    @Assert(result.passed)
}