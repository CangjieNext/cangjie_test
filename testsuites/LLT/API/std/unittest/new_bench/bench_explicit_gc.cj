/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench --no-color | compare %f
// ASSERT: scan PASSED: 3

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.runtime.*


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
    minDuration: Duration.second * 0.1, 
    warmup: 100,
    minBatches: 200,
    explicitGC: Disabled
]
@Measure[TestNoGcRunning()]
class BenchGCDisabled {
    @BeforeAll
    func before() {
        prevGC = getGCCount()
    } 

    @Bench
    func foo() {
        counter += 1.0
    }

    @AfterAll
    func after() {
        let diff = getGCCount() - prevGC
        println(diff)
        @Assert(diff <= 10)
    }
}

@Test
@Configure[
    minDuration: Duration.second * 0.2, 
    warmup: 100,
    minBatches: 200,
    explicitGC: Light
]
class BenchGCLight {
    @BeforeAll
    func before() {
        prevGC = getGCCount()
    } 

    @Bench
    func foo() {
        o = Box(Object())
        counter += 1.0
    }

    @AfterAll
    func after() {
        let diff = getGCCount() - prevGC
        println(diff)
        @Assert(diff >= 10) 
        @Assert(diff <= 130)
    }
}

@Test
@Configure[
    minDuration: Duration.second * 0.2, 
    warmup: 100,
    minBatches: 200,
    explicitGC: Heavy
]
@Measure[TestNoGcRunning()]
class BenchGCWait {
    @BeforeAll
    func before() {
        prevGC = 0
    } 

    @Bench
    func foo() {
        o = Object()
        counter += 1.0
    }

    @AfterAll
    func after() {
        let diff = getGCCount() - prevGC
        println(diff)
        @Assert(diff >= 95 && diff <= 140)
    }
}

