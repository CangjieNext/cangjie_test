/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f

// ASSERT: scan Warning: configuring measurement via @Configure[measurement: <Measurement>] is deprecated and not used any more.

/* SCAN-IN
    | Case      |       Median |    Err |   Err% |         Mean |
    |:----------|-------------:|-------:|-------:|-------------:|
    | someBench | 100000000 ns |  ±0 ns |  ±0.0% | 100000000 ns |
 */

/**
 * Since benchmark measurement configuration way was changed
 * from @Configure[measurement: <Measurement>] to @Measure[<Measurement>, ...],
 * we should provide warning if a user tries to use the old way measurement.
 */

/**
 * Test checks that the old-way measurement configuration is useless and should provide a warning.
 */

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
@Measure[FakeTimeNow(Nanos)]
@Configure[measurement: FakeTimeNow(Micros)]
@Configure[batchSize: 1, minDuration: Duration.millisecond, warmup: 1]
class BenchClass {
    @Bench
    @Configure[measurement: FakeTimeNow(Millis)]
    func someBench() {
        counter += 100_000_000.0
    }
}
