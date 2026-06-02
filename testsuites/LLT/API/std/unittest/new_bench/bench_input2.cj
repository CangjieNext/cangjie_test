/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color --verbose | compare %f
// ASSERT: scan PASSED: 9, SKIPPED: 0, ERROR: 0
// ASSERT: scan Starting the benchmark `TestOutputWithParameters.testSleep1(1,1)`.
// ASSERT: scan Starting the benchmark `TestOutputWithParameters.testSleep1(1,2)`.
// ASSERT: scan Starting the benchmark `TestOutputWithParameters.testSleep3(a[0])`.
// ASSERT: scan-not Exception

import std.time.*

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

let longString = "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"

@Test
@Measure[TestMeasurement()]
@Configure[minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
class TestOutputWithParameters {
    @Bench[a in [ 1, 2 ], b in [ 1, 2 ]]
    func testSleep1(a: Int64, b: Int64): Unit {
        counter += 2.0
    }
    @Bench[a in [ 1, 2 ]]
    func testSleep2(a: Int64): Unit {
        counter += 1.0
    }
    @Bench[a in [ longString ]]
    func testSleep3(a: String): Unit {
        counter += 2.0
    }
    @Bench[a in [ longString, longString ], b in [ "H", longString ]]
    func testSleep4(a: String, b: String): Unit {
        counter += 2.0
    }
}
/* SCAN-IN
    | Case       | Args      | Median |    Err |   Err% |   Mean |
    |:-----------|:----------|-------:|-------:|-------:|-------:|
    | testSleep1 | 1,1       |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | testSleep1 | 1,2       |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | testSleep1 | 2,1       |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | testSleep1 | 2,2       |  2.000 |     ±0 |  ±0.0% |  2.000 |
    |            |           |        |        |        |        |
    | testSleep2 | 1         |  1.000 |     ±0 |  ±0.0% |  1.000 |
    | testSleep2 | 2         |  1.000 |     ±0 |  ±0.0% |  1.000 |
    |            |           |        |        |        |        |
    | testSleep4 | a[0],H    |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | testSleep4 | a[0],b[1] |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | testSleep4 | a[1],H    |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | testSleep4 | a[1],b[1] |  2.000 |     ±0 |  ±0.0% |  2.000 |
    |            |           |        |        |        |        |
    | testSleep3 | a[0]      |  2.000 |     ±0 |  ±0.0% |  2.000 |
 */
@Test
@Measure[TestMeasurement()]
@Configure[minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
class TestBaselineWithParameters {
    @Bench
    func baseline1(): Unit {
        counter += 1.0
    }
    @Bench[a in [ 1, 2 ], b in [ 1, 2 ]]
    @Configure[baseline: "baseline1"]
    func testSleep1(a: Int64, b: Int64): Unit {
        counter += 2.0
    }

    @Bench[a in [ 1, 2 ]]
    func baseline2(a: Int64): Unit {
        counter += 1.0
    }
    @Bench[a in [ 1, 2 ], b in [ 1, 2 ]]
    @Configure[baseline: "baseline2"]
    func testSleep2(a: Int64, b: Int64): Unit {
        counter += 2.0
    }

    @Bench[a in [ 1, 2 ]]
    func separate(a: Int64): Unit {
        counter += 1.0
    }
}
/* SCAN-IN
    | Case       | Args   | Median |    Err |   Err% |   Mean |   Ratio |
    |:-----------|:-------|-------:|-------:|-------:|-------:|--------:|
    | baseline1  | -      |  1.000 |     ±0 |  ±0.0% |  1.000 |    100% |
    | testSleep1 | 1,1    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | testSleep1 | 1,2    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | testSleep1 | 2,1    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | testSleep1 | 2,2    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    |            |        |        |        |        |        |         |
    | baseline2  | 1      |  1.000 |     ±0 |  ±0.0% |  1.000 |    100% |
    | baseline2  | 2      |  1.000 |     ±0 |  ±0.0% |  1.000 |   +0.0% |
    | testSleep2 | 1,1    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | testSleep2 | 1,2    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | testSleep2 | 2,1    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    | testSleep2 | 2,2    |  2.000 |     ±0 |  ±0.0% |  2.000 | +100.0% |
    |            |        |        |        |        |        |         |
    | separate   | 1      |  1.000 |     ±0 |  ±0.0% |  1.000 |       - |
    | separate   | 2      |  1.000 |     ±0 |  ±0.0% |  1.000 |       - |
 */
