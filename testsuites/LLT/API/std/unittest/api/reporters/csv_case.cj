/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// (Unix)EXEC: export cjHeapSize=512MB && %run %run_opt %output %run_args
// (Windows)EXEC: (set cjHeapSize=512MB) && %run %run_opt %output %run_args
// RUN-EXEC-PIPE: %cat ./tmpBench//benchmarks/bench-default.TestCase_myBench.csv | compare %f

/* SCAN-IN
Case,Args,Median,Err,Err%,Mean,Unit,Measurement
"myBench","true","1.000000","0.000000","0.0","1.000000","","TestMeasurement"
"myBench","false","1.000000","0.000000","0.0","1.000000","","TestMeasurement"
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.fs.*

var counter: Float64 = 0.0

class TestMeasurement <: Measurement {
    static var callCounter = 0
    let result: Float64 = 0.0

    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            counter = 0.0
        }
        callCounter += 1
        counter
    }

    public prop name: String {
        get() {
            "TestMeasurement"
        }
    }
}

main() {
    let configuration = Configuration()
    configuration.set<Duration>(KeyMinDuration.minDuration, Duration.second * 0.1)
    let benchmark = Benchmark.createParameterized<Bool>("myBench", [true, false], configuration: configuration,
        measurement: TestMeasurement()) {
        b => counter += 1.0
    }
    benchmark.run().reportTo(CsvReporter(Path("tmpBench")))
}
