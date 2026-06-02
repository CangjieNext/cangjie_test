/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args 
// RUN-EXEC-PIPE: %cat ./tmpBench//benchmarks/bench-default.suite_name.csv | compare %f

// ASSERT: scan-not "ns"
/* SCAN-IN
Case,Args,BatchSize,Duration,Unit,Measurement
 */

import std.unittest.*
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
}

main() {
    let configuration = Configuration()
    configuration.set<Duration>(KeyMinDuration.minDuration, Duration.second * 0.1)
    TestSuite
        .builder("suite_name")
        .add(
            Benchmark.create("myBench1", configuration: configuration, measurement: TestMeasurement()) {
                => counter += 1.0
            })
        .add(
            Benchmark.create("myBench2", configuration: configuration, measurement: TestMeasurement()) {
                => counter += 2.0
            })
        .build()
        .runBenchmarks(configuration)
        .reportTo(CsvRawReporter(Path("tmpBench")))
}
