/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f
// ASSERT: scan PASSED: 1
// ASSERT: scan-not Exception
// ASSERT: scan-not Warning: configuring measurement via @Configure[measurement: <Measurement>] is deprecated and not used any more.
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

var counter: Float64 = 0.0

class TestMeasurement <: Measurement {
    let result: Float64 = 0.0

    public func setup() {
        counter = 0.0
    }

    public func measure(): Float64 {
        counter
    }
}

@Test
@Measure[TestMeasurement()]
@Configure[batchSize: 1, minDuration: Duration.millisecond]
@Configure[warmup: 1]
class FooTest {
    @Bench
    func testSleep1(): Unit {
        counter += 2.0
        sleep(Duration.millisecond * 1.1)
    }
}
/* SCAN-IN
    | Case       | Median |    Err |   Err% |   Mean |
    |:-----------|-------:|-------:|-------:|-------:|
    | testSleep1 |  2.000 |     ±0 |  ±0.0% |  2.000 |
 */
