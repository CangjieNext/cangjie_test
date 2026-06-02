/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f
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
@Configure[baseline: "case01"]
@Configure[warmup: Duration.nanosecond, minDuration: Duration.nanosecond]
class Test_Configure_Baseline_01 {
    @AfterEach
    func afterEach() {
        counter = 0.0
    }

    // baseline: case02
    @Bench
    @Configure[baseline: "case01"]
    func case01(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }

    // baseline: case01
    @Bench
    func case02(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }

    // baseline: case01
    @Bench
    @Configure[baseline: "case01"]
    func case03(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }

    // baseline: case02
    @Bench
    @Configure[baseline: "case02"]
    func case04(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }

    // baseline: case01
    @Bench
    @Configure[baseline: "case0"]
    func case05(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }

    // baseline: case03
    @Bench
    @Configure[baseline: "case02"]
    @Configure[baseline: "case03"]
    func case06(): Unit {
        counter += 1.0
        sleep(Duration.millisecond * 10)
    }
}
/* SCAN-IN
    | Case   | Median |    Err |   Err% |   Mean |    Ratio |
    |:-------|-------:|-------:|-------:|-------:|---------:|
    | case01 |  1.000 |     ±0 |  ±0.0% |  1.000 |     100% |
    | case02 |  1.000 |     ±0 |  ±0.0% |  1.000 |    +0.0% |
    | case03 |  1.000 |     ±0 |  ±0.0% |  1.000 |    +0.0% |
    |        |        |        |        |        |          |
    | case02 |  1.000 |     ±0 |  ±0.0% |  1.000 |     100% |
    | case04 |  1.000 |     ±0 |  ±0.0% |  1.000 |    +0.0% |
    |        |        |        |        |        |          |
    | case03 |  1.000 |     ±0 |  ±0.0% |  1.000 |     100% |
    | case06 |  1.000 |     ±0 |  ±0.0% |  1.000 |    +0.0% |
    |        |        |        |        |        |          |
    | case05 |  1.000 |     ±0 |  ±0.0% |  1.000 | NotFound |
 */
