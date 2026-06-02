/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f

import std.time.*

var counter: Float64 = 0.0
var justCalled = false

class TestMeasurement <: Measurement {
    static var callCounter = 0
    let result: Float64 = 0.0

    TestMeasurement(let step: Int64) {}

    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            counter = 0.0
        }
        if (justCalled) {
            counter += Float64(step)
            justCalled = false
        }

        callCounter += 1
        counter
    }
}

@Test
@Measure[TestMeasurement(0), TestMeasurement(1), TestMeasurement(5)]
@Configure[warmup: Duration.nanosecond, minDuration: Duration.nanosecond]
class BenchClass {
    @Bench
    func bench1() {
        counter += 1.0
        justCalled = true
    }
}

/* SCAN-IN
    | Case   | Median |    Err |   Err% |   Mean |
    |:-------|-------:|-------:|-------:|-------:|
    | bench1 |  1.000 |     ±0 |  ±0.0% |  1.000 |
    | bench1 |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | bench1 |  6.000 |     ±0 |  ±0.0% |  6.000 |
 */
