/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output --no-color | compare %f
// ASSERT: scan PASSED: 1
// ASSERT: scan Warmup disabled.

import std.unittest.*
import std.unittest.testmacro.*


class TestMeasurement <: Measurement {
    let delegate = TimeNow()

    public func measure(): Float64 {
        delegate.measure()
    }
}

@Test
@Measure[TestMeasurement()]
class BarTest {
    @Bench
    @Configure[
        warmup: 0,
        minDuration: Duration.second,
        batchSize: 1
    ]
    func testSleep(): Unit {
        sleep(Duration.millisecond * 30)
    }
}

main(){
    let case1 = BarTest().asTestSuite()
    let configuration = Configuration()
    configuration.set(KeyVerbose.verbose, true)
    case1.runBenchmarks(configuration).reportTo(ConsoleReporter(colored: false))
}
