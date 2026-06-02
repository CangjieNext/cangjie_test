/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color --bench --report-format=csv --report-path=./tmp

// EXEC-PIPE: %cat ./tmp/benchmarks/bench-default.BenchClass1.csv ./tmp/benchmarks/bench-default.BenchClass2.csv | compare %f
// ASSERT: regex-begin Case,Args,Median,Err,Err%,Mean,Unit,Measurement
// ASSERT: regex-next "foo",,"1.000000","0.000000","0.0","1.000000","a","Measurement"
// ASSERT: regex-next Case,Args,Median,Err,Err%,Mean,Unit,Measurement
// ASSERT: regex-after "barbase",,"2.000000","0.000000","0.0","2.000000","a","Measurement"
// ASSERT: regex-after "bar",,"3.000000","0.000000","0.0","3.000000","a","Measurement"
// ASSERT: regex-end

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

var counter: Float64 = 0.0

class TestMeasurement <: Measurement {
    public func measure(): Float64 {
        counter
    }

    public prop conversionTable: MeasurementUnitTable {
        get() {
            [(1.0, "a")]
        }
    }
}

@Test
@Measure[TestMeasurement()]
@Configure[minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
class BenchClass1 {
    @Bench
    func foo() {
        counter += 1.0
    }
}

@Test
@Measure[TestMeasurement()]
@Configure[baseline: "barbase", minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
class BenchClass2 {
    @BeforeEach
    func beforeEach() {
        counter = 0.0
    }

    @Bench
    func barbase() {
        counter += 2.0
    }

    @Bench
    func bar() {
        counter += 3.0
    }
}
