/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %enableO2 -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-PIPE: %export cjHeapSize=4gb && %run %run_opt %output %run_utest_opt %run_args --bench --no-color | compare %f
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
        @Assert(!isGCRunning())
    }

    public func measure(): Float64 {
        counter
    }
}


@Test
@Configure[
    minDuration: Duration.nanosecond, 
    warmup: 10,
    minBatches: 40,
    explicitGC: Light
]
class BenchGCLight {
    @BeforeAll
    func before() {
        prevGC = getGCCount()
    } 

    @Bench
    func foo() {
        for (i in 0..1000000) {
            o = ArrayList<Int64>(8)
        }
        counter += 1.0
    }

    @AfterAll
    func after() {
        let diff = getGCCount() - prevGC
        println(diff)
        @Assert(diff >= 35) 
        @Assert(diff <= 60)
    }
}

@Test
@Configure[
    minDuration: Duration.nanosecond, 
    warmup: 10,
    minBatches: 40,
    explicitGC: Heavy
]
@Measure[TestNoGcRunning()]
class BenchGCWait {
    @BeforeAll
    func before() {
        prevGC = getGCCount()
    } 

    @Bench
    func foo() {
        for (i in 0..1000000) {
            o = ArrayList<Int64>(8)
        }
        counter += 1.0
    }

    @AfterAll
    func after() {
        let diff = getGCCount() - prevGC
        println(diff)
        @Assert(diff >= 45 && diff <= 60)
    }
}

