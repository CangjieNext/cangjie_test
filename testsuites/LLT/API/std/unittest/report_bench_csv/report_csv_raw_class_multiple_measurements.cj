/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color --bench --report-format=csv-raw --report-path=./tmp
// RUN-EXEC-PIPE: %cat ./tmp/benchmarks/bench-default.BenchClass.csv | compare %f
// ASSERT: scan Case,Args,BatchSize,Duration,Unit,Measurement
// ASSERT: scan "foo",,"10","100.000000","a","Measurement(1, a)"
// ASSERT: scan "foo",,"10","10.000000","b","Measurement(10, b)"
// ASSERT: scan "bar",,"10","200.000000","a","Measurement(1, a)"
// ASSERT: scan "bar",,"10","20.000000","b","Measurement(10, b)"
// ASSERT: scan "parameterized","true","10","30.000000","a","Measurement(1, a)"
// ASSERT: scan "parameterized","false","10","30.000000","a","Measurement(1, a)"
// ASSERT: scan "parameterized","true","10","3.000000","b","Measurement(10, b)"
// ASSERT: scan "parameterized","false","10","3.000000","b","Measurement(10, b)"

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

var counter: Float64 = 0.0

class TestMeasurement <: Measurement {
    TestMeasurement(let mult: Float64, let unit: String) {}
    public func measure(): Float64 {
        counter
    }

    public prop conversionTable: MeasurementUnitTable {
        get() {
            [(mult, unit)]
        }
    }

    public prop name: String {
        get() {
            "Measurement(${Int64(mult)}, ${unit})"
        }
    }
}

@Test
@Measure[TestMeasurement(1.0, "a"), TestMeasurement(10.0, "b")]
@Configure[
    minDuration: Duration.nanosecond,
    warmup: Duration.nanosecond,
    batchSize: 10
]
class BenchClass {
    @Bench
    func foo() {
        counter += 10.0
    }

    @Bench
    func bar() {
        counter += 20.0
    }

    @Bench[a in [ true, false ]]
    func parameterized(a: Bool) {
        counter += 3.0
    }
}
