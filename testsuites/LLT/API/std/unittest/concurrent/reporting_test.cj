/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f

// ASSERT: scan === Test 1: verify failure ===
// ASSERT: scan iteration 0
// ASSERT: scan with randomSeed
// ASSERT: scan Concurrent test iteration 0 failed: verify assertion failed

// ASSERT: scan === Test 2: consistency failure ===
// ASSERT: scan consistency validation failed
// ASSERT: scan Consistency validation:
// ASSERT: scan Executed operations:
// ASSERT: scan Actor 0:
// ASSERT: scan Actor 1:
// ASSERT: scan op_0
// ASSERT: scan Sequentialization failure
// ASSERT: scan expected:
// ASSERT: scan actual:

// ASSERT: scan === Test 3: verbose progress ===
// ASSERT: scan Operation checks:

// ASSERT: scan === Test 4: multiple mismatches ===
// ASSERT: scan Sequentialization failure
// ASSERT: scan expected:
// ASSERT: scan actual:
// ASSERT: scan Actor 2: op_0 (expected:

// ASSERT: scan-not Starting concurrent scenario 'test_atomic_counter'
// ASSERT: scan-not Starting concurrent scenario 'counter_data_race'
// ASSERT: scan-not Starting concurrent scenario 'multi_mismatch_test'

import std.unittest.*
import std.unittest.concurrent.*
import std.sync.*

main(): Unit {
    println("=== Test 1: verify failure ===")
    testVerifyFailure()

    println("=== Test 2: consistency failure ===")
    testConsistencyFailure()

    println("=== Test 3: verbose progress ===")
    testVerboseProgress()

    println("=== Test 4: multiple mismatches ===")
    testMultipleMismatches()
}

func testVerifyFailure(): Unit {
    let counter = AtomicInt64(0)

    let scenarioBuilder = scenario("atomic_counter_test")
        .iterations(10)
        .actor { => counter.fetchAdd(1) }
        .actor { => counter.fetchAdd(-1) }
        .verify { => counter.load() == 1 }

    let testCase = ConcurrentTestCase.createFromBuilder(
        "test_atomic_counter",
        builder: scenarioBuilder
    )

    let report = testCase.run()
    report.reportTo(ConsoleReporter(colored: false))
}

var counter = 0
func testConsistencyFailure(): Unit {

    let scenarioBuilder = scenario("counter_data_race")
        .reset { => counter = 0 }
        .consistencyModel(Serializability)
        .actor({ => counter += 1; counter })
        .actor({ => counter -= 1; counter })
        .iterations(1000)

    let testCase = ConcurrentTestCase.createFromBuilder(
        "counter_data_race",
        builder: scenarioBuilder
    )

    let report = testCase.run()
    report.reportTo(ConsoleReporter(colored: false))
}

class AlwaysInconsistent <: Equatable<AlwaysInconsistent> & ToString {
    public operator func == (other: AlwaysInconsistent): Bool { false }
    public func toString(): String { "inconsistent" }
}

func testMultipleMismatches(): Unit {
    let scenarioBuilder = scenario("multi_mismatch_test")
        .reset { => counter = 0 }
        .consistencyModel(Serializability)
        .actor({ => counter += 1; AlwaysInconsistent() })
        .actor({ => counter += 2; AlwaysInconsistent() })
        .actor({ => counter += 3; AlwaysInconsistent() })
        .iterations(1)

    let testCase = ConcurrentTestCase.createFromBuilder(
        "multi_mismatch_test",
        builder: scenarioBuilder
    )

    let report = testCase.run()
    report.reportTo(ConsoleReporter(colored: false))
}

func testVerboseProgress(): Unit {
    let scenarioBuilder = scenario("verbose_progress_test")
        .reset { => counter = 0 }
        .consistencyModel(Serializability)
        .actor({ => counter += 1; counter })
        .actor({ => counter -= 1; counter })
        .iterations(1000)

    let config = Configuration()
    config.set(KeyVerbose.verbose, true)

    let testCase = ConcurrentTestCase.createFromBuilder(
        "verbose_progress_test",
        builder: scenarioBuilder,
        configuration: config
    )

    let report = testCase.run()
    report.reportTo(ConsoleReporter(colored: false))
}
