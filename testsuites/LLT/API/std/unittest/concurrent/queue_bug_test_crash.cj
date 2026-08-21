// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE-1: %export cjHeapSize=16gb && %run %run_opt %output %run_args %run_utest_opt --no-color --death-aware | compare %f
// ASSERT: scan REASON: Crashed
// ASSERT: scan ERROR: 1


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
@TestBuilder
func testQueueSerializable(): TestSuite {
    let scenarioBuilder = scenario("queue_serializable_bug")
        .consistencyModel(Serializability)
        .withState { => ConcurrentLinkedQueue<Data>() }
        .actorWithOps([
            operation("add1", { queue => queue.add(Data(Box(1))) }),
            operation("peek", { queue => queue.peek() }),
            operation("add3", { queue => queue.add(Data(Box(3))) }),
        ])
        .actorWithOps([ 
            operation("remove", { queue => queue.remove() }),
            operation("peek", { queue => queue.peek() }),
            operation("remove", { queue => queue.remove() }),
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