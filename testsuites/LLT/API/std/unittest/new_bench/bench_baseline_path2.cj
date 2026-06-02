/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %run %run_opt %output --bench --no-color --report-path=bench_report --baseline-path=bench_report >> output 
// (Linux) EXEC: %run %run_opt %output %run_utest_opt --bench --no-color --baseline-path=bench_report >> output 
// (Linux) EXEC-PIPE: cat output | compare %f
// ASSERT: scan-2 PASSED: 4
// ASSERT: scan-1 100% = bench_report

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

var counter: Float64 = 0.0
var callCounter = 0

class TestMeasurement <: Measurement {
    let result: Float64 = 0.0

    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            counter = 0.0
        }
        callCounter += 1
        counter
    }
}

@Test
@Measure[TestMeasurement()]
@Configure[warmup: Duration.nanosecond, minDuration: Duration.nanosecond]
class FooTest {
    @Bench
    func testSleep1(): Unit {
        counter += 2.0
        sleep(Duration.millisecond * 10)
    }
    @Bench
    func testSleep2(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }

    @Bench
    func test3(): Unit {
        counter += 2.0
        sleep(Duration.millisecond * 10)
    }
    @Bench
    func test4(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }
}
/* SCAN-IN
    100% = bench_report
    | Case       | Median |    Err |   Err% |   Mean |  Ratio |
    |:-----------|-------:|-------:|-------:|-------:|-------:|
    | testSleep1 |  2.000 |     ±0 |  ±0.0% |  2.000 |  +0.0% |
    | testSleep2 |  1.000 |     ±0 |  ±0.0% |  1.000 |  +0.0% |
    | test3      |  2.000 |     ±0 |  ±0.0% |  2.000 |  +0.0% |
    | test4      |  1.000 |     ±0 |  ±0.0% |  1.000 |  +0.0% |
Summary: TOTAL: 4
    PASSED: 4, SKIPPED: 0, ERROR: 0
    FAILED: 0
 */

/* SCAN-IN
    100% = bench_report
    | Case       | Median |    Err |   Err% |   Mean |  Ratio |
    |:-----------|-------:|-------:|-------:|-------:|-------:|
    | testSleep1 |  2.000 |     ±0 |  ±0.0% |  2.000 |  +0.0% |
    | testSleep2 |  1.000 |     ±0 |  ±0.0% |  1.000 |  +0.0% |
    | test3      |  2.000 |     ±0 |  ±0.0% |  2.000 |  +0.0% |
    | test4      |  1.000 |     ±0 |  ±0.0% |  1.000 |  +0.0% |
Summary: TOTAL: 4
    PASSED: 4, SKIPPED: 0, ERROR: 0
    FAILED: 0
 */
