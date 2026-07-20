/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f

// ASSERT: scan [ PASSED ] CASE: test_atomic_counter
// ASSERT: scan [ PASSED ] CASE: test_concurrent_lifecycle
// ASSERT: scan --beforeAll--
// ASSERT: scan --beforeEach: test_concurrent_lifecycle--
// ASSERT: scan --afterEach--
// ASSERT: scan --afterAll--
// ASSERT: scan [ PASSED ] CASE: passing_test_1
// ASSERT: scan [ PASSED ] CASE: reset_test
// ASSERT: scan [ FAILED ] CASE: failing_test
// ASSERT: scan Concurrent test iteration 0 failed
// ASSERT: scan [ PASSED ] CASE: test_1
// ASSERT: scan [ PASSED ] CASE: test_2
// ASSERT: scan [ PASSED ] CASE: test_builder_add
// ASSERT: scan [ FAILED ] CASE: data_race
// ASSERT: scan Ordering: per-actor + real-time (------- = barrier, ... = bridge)
// ASSERT: scan Actor 0     Actor 1         
// ASSERT: scan op_0: 1 ✓   op_0: -1 ≠ 0 ✗  
// ASSERT: scan PASSED: 7
// ASSERT: scan FAILED: 2
// ASSERT: scan TOTAL: 9

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.concurrent.*
import std.sync.*

@TestBuilder
func testDirectRun(): TestSuite {
    let counter = AtomicInt64(0)

    let scenarioBuilder = scenario("atomic_counter_test")
        .iterations(10)
        .actor { => counter.fetchAdd(1) }
        .actor { => counter.fetchAdd(-1) }
        .verify { => counter.load() == 0 }

    let testCase = ConcurrentTestCase.createFromBuilder(
        "test_atomic_counter",
        builder: scenarioBuilder
    )

    TestSuite
        .builder("direct_run_suite")
        .add(testCase)
        .build()
}

@TestBuilder
func testWithLifecycle(): TestSuite {
    let counter = AtomicInt64(0)

    let scenarioBuilder = scenario("lifecycle_test")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let testCase = ConcurrentTestCase.createFromBuilder(
        "test_concurrent_lifecycle",
        builder: scenarioBuilder
    )

    TestSuite
        .builder("concurrent_suite")
        .beforeAll { => println("--beforeAll--") }
        .beforeEach { name => println("--beforeEach: ${name}--") }
        .afterEach { => println("--afterEach--") }
        .afterAll { => println("--afterAll--") }
        .add(testCase)
        .build()
}

@TestBuilder
func testMultipleConcurrentTests(): TestSuite {
    let counter = AtomicInt64(0)

    let passingScenario = scenario("passing_test")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let failingScenario = scenario("failing_test")
        .iterations(1)
        .actor { => counter.fetchAdd(1) }
        .verify { => false }

    let resetScenario = scenario("reset_test")
        .iterations(1)
        .actor { => counter.store(0) }
        .verify { => counter.load() == 0 }

    TestSuite
        .builder("mixed_concurrent_suite")
        .add(ConcurrentTestCase.createFromBuilder("passing_test_1", builder: passingScenario))
        .add(ConcurrentTestCase.createFromBuilder("failing_test", builder: failingScenario))
        .add(ConcurrentTestCase.createFromBuilder("reset_test", builder: resetScenario))
        .build()
}

@TestBuilder
func testTestGroup(): TestSuite {
    let counter = AtomicInt64(0)

    let scenario1 = scenario("group_test_1")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let scenario2 = scenario("group_test_2")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    TestSuite
        .builder("concurrent_group")
        .add(ConcurrentTestCase.createFromBuilder("test_1", builder: scenario1))
        .add(ConcurrentTestCase.createFromBuilder("test_2", builder: scenario2))
        .build()
}

@TestBuilder
func testBuilderAddConcurrent(): TestSuite {
    let counter = AtomicInt64(0)

    let scenarioBuilder = scenario("builder_add_test")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let testCase = ConcurrentTestCase.createFromBuilder(
        "test_builder_add",
        builder: scenarioBuilder
    )

    TestSuite
        .builder("builder_add_suite")
        .add(testCase)
        .build()
}

var counter = 0

@TestBuilder
func testDataRaceReport(): TestSuite {

    let scenarioBuilder = scenario("data_race_not_linearizable")
        .consistencyModel(Linearizability)
        .reset { => counter = 0 }
        .actor({ => counter += 1; counter })
        .actor({ => counter -= 1; counter })
        .iterations(1000)

    let testCase = ConcurrentTestCase.createFromBuilder(
        "data_race",
        builder: scenarioBuilder
    )

    TestSuite
        .builder("data_race_suite")
        .add(testCase)
        .build()
}
