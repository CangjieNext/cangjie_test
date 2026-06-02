/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output --no-color | compare %f
// ASSERT: scan PASSED: 1
// ASSERT: scan Warming up for 3.000 s.
// ASSERT: scan Warming up for 100 iterations.
// ASSERT: scan-not Exception

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

var current = Box(0)

class TestMeasurement <: Measurement {
    let delegate = TimeNow()

    public func measure(): Float64 {
        delegate.measure()
    }
}

@Test
@Measure[TestMeasurement()]
class FooTest {
    @Bench
    @Configure[
        warmup: Duration.second * 3,
        minDuration: Duration.second
    ]
    func testSleep(): Unit {
        current.value = current.value + 1
        sleep(Duration.millisecond * 30)
    }
}

@Test
@Measure[TestMeasurement()]
class FooTest2 {
    @Bench
    @Configure[
        warmup: 100,
        minDuration: Duration.second
    ]
    func testSleep2(): Unit {
        current.value = current.value + 1
        sleep(Duration.millisecond * 30)
    }
}

main() {
    let case1 = FooTest().asTestSuite()
    let configuration = Configuration()
    configuration.set(KeyVerbose.verbose, true)
    case1.runBenchmarks(configuration).reportTo(ConsoleReporter(colored: false))
    println(current.value)
    @Assert(current.value < 163)

    current = Box(0)
    let case2 = FooTest2().asTestSuite()
    case2.runBenchmarks(configuration).reportTo(ConsoleReporter(colored: false))

    println(current.value)
    @Assert(current.value < 143 && current.value > 110)
}
