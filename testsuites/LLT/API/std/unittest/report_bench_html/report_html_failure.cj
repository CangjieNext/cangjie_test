/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC-1: %run %run_opt %output %run_args --no-color --bench --report-format=html --report-path=./tmp 
// (not Windows) RUN-EXEC-PIPE: cat ./tmp/benchmarks/index.html | compare %f
// (Windows) RUN-EXEC-PIPE: type ./tmp/benchmarks/index.html | compare %f
// ASSERT: scan-2 Failed
// ASSERT: scan-2 Details
// ASSERT: scan errorCase()

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
class BenchError {
    @Bench
    func errorCase() {
        throw Exception()
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
        throw Exception()
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
