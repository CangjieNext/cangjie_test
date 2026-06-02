/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color --bench --report-format=csv --report-path=./tmp
// RUN-EXEC-PIPE: %cat ./tmp/benchmarks/bench-default.BenchClass.csv | compare %f

/* SCAN-IN
Case,Args,Median,Err,Err%,Mean,Unit,Measurement
"foo",,"1.000000","0.000000","0.0","1.000000","a","Measurement(a)"
"bar",,"2.000000","0.000000","0.0","2.000000","a","Measurement(a)"
"parameterized","true","3.000000","0.000000","0.0","3.000000","a","Measurement(a)"
"parameterized","false","3.000000","0.000000","0.0","3.000000","a","Measurement(a)"
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

var counter: Float64 = 0.0

class TestMeasurement <: Measurement {
    public func measure(): Float64 {
        counter
    }

    public prop name: String {
        get() {
            "Measurement(a)"
        }
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
class BenchClass {
    @BeforeEach
    func beforeEach() {
        counter = 0.0
    }

    @Bench
    func foo() {
        counter += 1.0
    }

    @Bench
    func bar() {
        counter += 2.0
    }

    @Bench[a in [ true, false ]]
    func parameterized(a: Bool) {
        counter += 3.0
    }
}
