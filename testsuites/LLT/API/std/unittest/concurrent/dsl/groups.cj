// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan [ PASSED ] CASE: test
// ASSERT: scan [ FAILED ] CASE: testFailed
// ASSERT: scan Consistency validation: NOT linearizable

import std.unittest.*
import std.unittest.concurrent.*
import std.unittest.testmacro.*

import std.sync.AtomicBool

class BusyException <: Exception {}

class Section {
    let busy = AtomicBool(false)
    
    func enter() {
        if (!busy.compareAndSwap(false, true)) {
            throw BusyException()
        }
        busy.store(false)
    }
}

@ConcurrentTest
class Test {
    var section = Section()

    @Group["A"]
    @Operation
    func op1() { section.enter() }

    @Group["A"]
    @Operation
    func op2() { section.enter() }

    @Operation
    func noop() { () }

    @StressTest[scenario in scenarios(
        maxActors: 2, maxOperationPerActor: 3,
    )]
    func test(scenario: ScenarioBuilder<Test>) {
        scenario
            .iterations(1000)
            .consistencyModel(Linearizability)
    }
}

@ConcurrentTest
class TestFailed {
    var section = Section()

    @Operation
    func op1() { section.enter() }

    @Operation
    func op2() { section.enter() }

    @Operation
    func noop() { () }

    @StressTest[scenario in scenarios(
        maxActors: 2, maxOperationPerActor: 3,
    )]
    func testFailed(scenario: ScenarioBuilder<TestFailed>) {
        scenario
            .iterations(1000)
            .consistencyModel(Linearizability)
    }
}
