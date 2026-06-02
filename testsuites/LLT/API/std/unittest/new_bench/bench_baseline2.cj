/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color --baseline-path=bench_report | compare %f
// ASSERT: scan PASSED: 4
// ASSERT: scan-not Exception
// ASSERT: scan-not previous run
// ASSERT: scan-not bench_report
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
    @Configure[baseline: "testSleep1"]
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
    @Configure[baseline: "test3"]
    func test4(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }
}
/* SCAN-IN
    | Case       | Median |    Err |   Err% |   Mean |  Ratio |
    |:-----------|-------:|-------:|-------:|-------:|-------:|
    | testSleep1 |  2.000 |     ±0 |  ±0.0% |  2.000 |   100% |
    | testSleep2 |  1.000 |     ±0 |  ±0.0% |  1.000 | -50.0% |
    |            |        |        |        |        |        |
    | test3      |  2.000 |     ±0 |  ±0.0% |  2.000 |   100% |
    | test4      |  1.000 |     ±0 |  ±0.0% |  1.000 | -50.0% |
Summary: TOTAL: 4
    PASSED: 4, SKIPPED: 0, ERROR: 0
    FAILED: 0
 */
