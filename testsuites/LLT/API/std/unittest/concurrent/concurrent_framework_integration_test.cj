/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f

// ASSERT: scan === Test 1: Direct run of ConcurrentTestCase ===
// ASSERT: scan [ PASSED ] CASE: test_atomic_counter
// ASSERT: scan PASSED: 1

// ASSERT: scan === Test 2: ConcurrentTestCase in TestSuite with lifecycle ===
// ASSERT: scan --beforeAll--
// ASSERT: scan --beforeEach: test_concurrent_lifecycle--
// ASSERT: scan --afterEach--
// ASSERT: scan --afterAll--
// ASSERT: scan [ PASSED ] CASE: test_concurrent_lifecycle
// ASSERT: scan PASSED: 1

// ASSERT: scan === Test 3: Multiple concurrent tests in TestSuite ===
// ASSERT: scan [ PASSED ] CASE: passing_test_1
// ASSERT: scan [ PASSED ] CASE: reset_test
// ASSERT: scan [ ERROR  ] CASE: failing_test
// ASSERT: scan Concurrent test iteration 0 failed
// ASSERT: scan PASSED: 2
// ASSERT: scan ERROR: 1

// ASSERT: scan === Test 4: TestGroup with concurrent tests ===
// ASSERT: scan [ PASSED ] CASE: test_1
// ASSERT: scan [ PASSED ] CASE: test_2
// ASSERT: scan PASSED: 2

// ASSERT: scan === Test 5: TestSuiteBuilder.add(concurrent) ===
// ASSERT: scan [ PASSED ] CASE: test_builder_add
// ASSERT: scan PASSED: 1

import std.unittest.*
import std.unittest.concurrent.*
import std.sync.*

main(): Unit {
    println("=== Test 1: Direct run of ConcurrentTestCase ===")
    testDirectRun()

    println("\n=== Test 2: ConcurrentTestCase in TestSuite with lifecycle ===")
    testWithLifecycle()

    println("\n=== Test 3: Multiple concurrent tests in TestSuite ===")
    testMultipleConcurrentTests()

    println("\n=== Test 4: TestGroup with concurrent tests ===")
    testTestGroup()

    println("\n=== Test 5: TestSuiteBuilder.add(concurrent) ===")
    testBuilderAddConcurrent()
}

func testDirectRun(): Unit {
    let counter = AtomicInt64(0)

    let scenarioBuilder = scenario("atomic_counter_test")
        .iterations(10)
        .actor { => counter.fetchAdd(1) }
        .actor { => counter.fetchAdd(-1) }
        .verify { => counter.load() == 0 }

    let testCase = concurrentTest(
        "test_atomic_counter",
        builder: scenarioBuilder
    )

    let report = testCase.run()
    report.reportTo(ConsoleReporter(colored: false))
}

func testWithLifecycle(): Unit {
    let counter = AtomicInt64(0)

    let scenarioBuilder = scenario("lifecycle_test")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let testCase = concurrentTest(
        "test_concurrent_lifecycle",
        builder: scenarioBuilder
    )

    let suite = TestSuite
        .builder("concurrent_suite")
        .beforeAll { => println("--beforeAll--") }
        .beforeEach { name => println("--beforeEach: ${name}--") }
        .afterEach { => println("--afterEach--") }
        .afterAll { => println("--afterAll--") }
        .add(testCase)
        .build()

    let report = suite.runTests()
    report.reportTo(ConsoleReporter(colored: false))
}

func testMultipleConcurrentTests(): Unit {
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

    let suite = TestSuite
        .builder("mixed_concurrent_suite")
        .add(concurrentTest("passing_test_1", builder: passingScenario))
        .add(concurrentTest("failing_test", builder: failingScenario))
        .add(concurrentTest("reset_test", builder: resetScenario))
        .build()

    let report = suite.runTests()
    report.reportTo(ConsoleReporter(colored: false))
}

func testTestGroup(): Unit {
    let counter = AtomicInt64(0)

    let scenario1 = scenario("group_test_1")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let scenario2 = scenario("group_test_2")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let group = TestGroup
        .builder("concurrent_group")
        .add(concurrentTest("test_1", builder: scenario1))
        .add(concurrentTest("test_2", builder: scenario2))
        .build()

    let report = group.runTests()
    report.reportTo(ConsoleReporter(colored: false))
}

func testBuilderAddConcurrent(): Unit {
    let counter = AtomicInt64(0)

    let scenarioBuilder = scenario("builder_add_test")
        .iterations(5)
        .actor { => counter.fetchAdd(1) }
        .verify { => counter.load() >= 0 }

    let testCase = ConcurrentTestCase.createFromBuilder(
        "test_builder_add",
        builder: scenarioBuilder
    )

    let suite = TestSuite
        .builder("builder_add_suite")
        .add(testCase)
        .build()

    let report = suite.runTests()
    report.reportTo(ConsoleReporter(colored: false))
}