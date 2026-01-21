/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench --no-color --verbose | compare %f
// ASSERT: scan PASSED: 5
// ASSERT: scan-not Exception
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

var counter: Float64 = 0.0
var callCounter = 0

class TestMeasurement <: Measurement {
    let result: Float64 = 0.0

    public func measure(): Float64 {
        if (callCounter % 2 == 0) {
            counter = 0.0
        }
        callCounter += 1
        counter
    }
}

let longString = "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"

@Test
@Measure[TestMeasurement()]
@Configure[minDuration: Duration.nanosecond, warmup: 1000]
class TestConfigStrategies {
    @Bench[a in [ 1, 2 ], 
        b in [ 1, 2 ], 
        config.warmup in [ Duration.nanosecond * 2 ] 
    ]
    func testSleep1(a: Int64, b: Int64): Unit {
        counter += 2.0
    }
    @Bench[a in [ 1, 2 ], 
        config.warmup in [ 2000 ] 
    ]
    func testSleep2(a: Int64): Unit {
        counter += 1.0
    }
    @Bench[config.warmup in [ 2000 ], 
        a in [ longString ] 
    ]
    func testSleep3(a: String): Unit {
        counter += 2.0
    }
    @Bench[a in [ longString, longString ], b in [ "H", longString ]]
    func testSleep4(a: String, b: String): Unit {
        counter += 2.0
    }

    @Strategy[a in [ longString, longString ], 
        b in [ longString ], 
        config.warmup in [ Duration.nanosecond * 2 ], 
        config.explicitGC in [ Disabled, Light ], 
    ]
    func strategy(a: String, b: String): String {
        a + b
    }

    @Bench[a in strategy]
    func testSleep5(a: String): Unit {
        counter += 2.0
    }
}
