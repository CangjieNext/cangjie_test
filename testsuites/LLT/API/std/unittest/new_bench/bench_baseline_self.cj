/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench --no-color | compare %f
import std.time.*
import std.sync.*

var counter: Float64 = 0.0
var callCounter = 0

class TestMeasurement <: Measurement {
    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            counter = 0.0
        }
        callCounter += 1
        counter
    }
}

@Test
@Configure[minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
@Measure[TestMeasurement()]
class Test_Configure_Baseline_Self {
    @Bench[x in [ 0, 1, 2 ]]
    @Configure[baseline: "case01"]
    func case02(x: Int): Unit {
        counter += 2.0
        sleep(Duration.millisecond * 10)
    }

    @Bench[x in [ 0, 1, 2 ]]
    @Configure[baseline: "case01"]
    func case01(x: Int): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }
}

/* SCAN-IN
    | Case   | Args   | Median |    Err |   Err% |   Mean |   Ratio |
    |:-------|:-------|-------:|-------:|-------:|-------:|--------:|
    | case01 | 0      |  1.000 |     ±0 |  ±0.0% |  1.000 |    100% |
    | case01 | 1      |  1.000 |     ±0 |  ±0.0% |  1.000 |   +0.0% |
    | case01 | 2      |  1.000 |     ±0 |  ±0.0% |  1.000 |   +0.0% |
    | case02 | 0      |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | case02 | 1      |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | case02 | 2      |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
 */
