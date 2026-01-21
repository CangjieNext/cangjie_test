/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %enableO2 -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-PIPE: %export cjHeapSize=16gb && %run %run_opt %output %run_utest_opt %run_args --bench --no-color | compare %f
// ASSERT: scan PASSED: 2

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.runtime.*
import std.collection.*


var counter: Float64 = 0.0
var prevGC = 0
var o = Object()

class TestNoGcRunning <: Measurement {
    static var callCounter = 0
    let result: Float64 = 0.0

    public func setup() {
        if (prevGC == 0) {
            // doing it here and not in BeforeAll to exclude warmup
            prevGC = getGCCount()
        }
        @Assert(!isGCRunning())
    }

    public func measure(): Float64 {
        counter
    }
}


@Test
@Configure[
    minDuration: Duration.second * 0.3, 
    warmup: 10,
    minBatches: 200,
]
@Measure[TestNoGcRunning()]
class BenchGCAutoDisabled {

    @Bench
    func foo() {
        for (i in 0..100000) {
            counter += blackBox(1.0)
        }
    }

    @AfterAll
    func after() {
        let diff = getGCCount() - prevGC
        println(diff)
        @Assert(diff <= 10)
        prevGC = 0
    }
}



@Test
@Configure[
    minDuration: Duration.second * 0.3, 
    warmup: 10,
    minBatches: 200,
    explicitGC: Disabled
]
@Measure[TestNoGcRunning()]
class BenchGCDisabled {

    @Bench
    func foo() {
        for (i in 0..100000) {
            counter += blackBox(1.0)
        }
        o = ArrayList<Int64>(8)
    }

    @AfterAll
    func after() {
        let diff = getGCCount() - prevGC
        println(diff)
        @Assert(diff <= 10)
        prevGC = 0
    }
}
