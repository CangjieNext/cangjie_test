/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f
// ASSERT: scan PASSED: 2
// ASSERT: scan-not Exception
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

var batches: Int64 = 0
var counter: Float64 = 0.0
var callCounter = 0

class TestMeasurement <: Measurement {
    let result: Float64 = 0.0

    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            batches += 1
            counter = 0.0
        }
        callCounter += 1
        counter
    }
}

@Test
@Measure[TestMeasurement()]
@Configure[
    minBatches: 20,
    minDuration: Duration.second,
    warmup: Duration.Zero
]
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

    @AfterEach
    func afterEach() {
        if (batches < 20) {
            throw Exception("test failed")
        }
    }
}
/* SCAN-IN
    | Case       | Median |    Err |   Err% |   Mean |
    |:-----------|-------:|-------:|-------:|-------:|
    | testSleep1 |  2.000 |     ±0 |  ±0.0% |  2.000 |
    | testSleep2 |  1.000 |     ±0 |  ±0.0% |  1.000 |
 */
