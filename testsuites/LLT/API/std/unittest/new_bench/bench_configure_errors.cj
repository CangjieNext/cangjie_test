/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --bench --no-color | compare %f
// ASSERT: scan Number of warmup iterations must be non negative
// ASSERT: scan PASSED: 0

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*


var current = Box(0)

class TestMeasurement <: Measurement {
    let delegate = TimeNow()

    public func measure(): Float64 {
        delegate.measure()
    }
}

@Test
@Measure[TestMeasurement()]
class FooTest {
    @Bench
    @Configure[
        warmup: -1,
        minDuration: Duration.second
    ]
    func testSleep(): Unit {
        current.value = current.value + 1
        sleep(Duration.millisecond * 30)
    }
}
