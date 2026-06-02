/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color --baseline-path=bench_report | compare %f

import std.time.*

var counter: Float64 = 0.0

class TestMeasurement <: Measurement {
    static var callCounter = 0
    let result: Float64 = 0.0

    TestMeasurement() {}

    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            counter = 0.0
        }

        callCounter += 1
        counter
    }

    public prop conversionTable: MeasurementUnitTable {
        get() {
            []
        }
    }
}

@Test
@Measure[TestMeasurement()]
@Configure[warmup: Duration.nanosecond, minDuration: Duration.nanosecond]
class BenchClass {
    @Bench
    func bench1() {
        counter += 1.0
    }
}

/* SCAN-IN
    | Case   | Median |    Err |   Err% |   Mean |
    |:-------|-------:|-------:|-------:|-------:|
    | bench1 |  1.000 |     ±0 |  ±0.0% |  1.000 |
 */
