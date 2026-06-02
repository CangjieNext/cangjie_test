/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f

import std.unittest.*
import std.unittest.testmacro.*
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
@Configure[minDuration: Duration.nanosecond, minBatches: 1, warmup: Duration.nanosecond]
@Measure[TestMeasurement()]
class FooTest {
    @Bench[veryVeryVeryVeryLongName1 in [ "foo", "foooooooooooooooooooo" ], veryVeryVeryVeryLongName2 in [ "bar", "baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaar" ]]
    @TestCase
    func test1(veryVeryVeryVeryLongName1: String, veryVeryVeryVeryLongName2: String): Unit {
        counter += 1.5
    }
}

/* SCAN-IN
    | Case   | Args                                                      | Median |    Err |   Err% |   Mean |
    |:-------|:----------------------------------------------------------|-------:|-------:|-------:|-------:|
    | test1  | foo,bar                                                   |  1.500 |     ±0 |  ±0.0% |  1.500 |
    | test1  | foo,veryVeryVeryVeryLongName2[1]                          |  1.500 |     ±0 |  ±0.0% |  1.500 |
    | test1  | veryVeryVeryVeryLongName1[1],bar                          |  1.500 |     ±0 |  ±0.0% |  1.500 |
    | test1  | veryVeryVeryVeryLongName1[1],veryVeryVeryVeryLongName2[1] |  1.500 |     ±0 |  ±0.0% |  1.500 |
 */
