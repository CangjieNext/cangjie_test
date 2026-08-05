// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE-1: %export cjHeapSize=16gb && %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan FAILED: 1
// ASSERT: scan consistency validation failed
// ASSERT: scan NOT serializable
// ASSERT: scan Ordering: no constraints
// ASSERT: scan Actor 0
// ASSERT: scan Actor 1
// ASSERT: scan add1
// ASSERT: scan peek
// ASSERT: scan add3
// ASSERT: scan remove
// ASSERT: scan ✗
// ASSERT: scan ≠
// ASSERT: scan-not Executed operations:

import std.unittest.testmacro.*
import std.unittest.concurrent.*
import std.collection.concurrent.ConcurrentLinkedQueue



// todo: when the bug is fixed, we need to copy the bugged version of the queue here as a test that we can detect such bugs.
@TestBuilder
func testQueueSerializable(): TestSuite {
    let scenarioBuilder = scenario("queue_serializable_bug")
        .consistencyModel(Serializability)
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
        .iterations(50000)

    let testCase = ConcurrentTestCase.createFromBuilder(
        "parallel_iter0_fails",
        builder: scenarioBuilder
    )

    TestSuite
        .builder("testQueueSerializable")
        .add(testCase)
        .build()
}