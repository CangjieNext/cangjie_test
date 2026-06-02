/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt --no-color --bench | compare %f

import std.time.*

var callCounter = 0
var counter: Float64 = 0.0

struct FakeTimeNow <: Measurement {
    let _convTable: MeasurementUnitTable
    private let unit: ?TimeUnit

    FakeTimeNow() {
        _convTable = TimeNow().conversionTable
        this.unit = None
    }

    init(unit: TimeUnit) {
        _convTable = TimeNow(unit).conversionTable
        this.unit = unit
    }

    public prop conversionTable: MeasurementUnitTable {
        get() {
            _convTable
        }
    }

    public prop name: String {
        get() {
            "Duration(${unit?.toString() ?? ""})"
        }
    }

    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            counter = 0.0
        }
        callCounter += 1
        counter
    }
}

@Test
@Measure[FakeTimeNow(), FakeTimeNow(TimeUnit.Nanos), FakeTimeNow(TimeUnit.Millis)]
@Configure[warmup: Duration.nanosecond, minDuration: Duration.nanosecond]
class BenchTimeFormat {
    @Bench
    func benchZero() {
        counter += 0.0
    }

    @Bench
    func benchSmall() {
        counter += 0.001
    }

    @Bench
    func benchBig() {
        counter += 1000000000000.0
    }
}

/* SCAN-IN
    | Case       | Measurement  |           Median |    Err |   Err% |             Mean |
    |:-----------|:-------------|-----------------:|-------:|-------:|-----------------:|
    | benchZero  | Duration()   |             0 ns |  ±0 ns |  ±0.0% |             0 ns |
    | benchSmall |              |         0.001 ns |  ±0 ns |  ±0.0% |         0.001 ns |
    | benchBig   |              |           1000 s |   ±0 s |  ±0.0% |           1000 s |
    |            |              |                  |        |        |                  |
    | benchZero  | Duration(ns) |             0 ns |  ±0 ns |  ±0.0% |             0 ns |
    | benchSmall |              |         0.001 ns |  ±0 ns |  ±0.0% |         0.001 ns |
    | benchBig   |              | 1000000000000 ns |  ±0 ns |  ±0.0% | 1000000000000 ns |
    |            |              |                  |        |        |                  |
    | benchZero  | Duration(ms) |             0 ms |  ±0 ms |  ±0.0% |             0 ms |
    | benchSmall |              |         1E-09 ms |  ±0 ms |  ±0.0% |         1E-09 ms |
    | benchBig   |              |       1000000 ms |  ±0 ms |  ±0.0% |       1000000 ms |
 */
