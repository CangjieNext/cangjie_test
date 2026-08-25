/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan [ FAILED ] CASE: testAfterFail
// ASSERT: scan Consistency validation: Linearizable validation error: After inconsistency
// ASSERT: scan [ FAILED ] CASE: testVerifyFail
// ASSERT: scan verify assertion failed

import std.unittest.*
import std.unittest.concurrent.*
import std.unittest.testmacro.*

@ConcurrentTest
class TestAfterFail {
    var x: Int64 = 0

    @Operation
    func incDec() {
        x += 1
        x -= 1
    }

    @StressTest[scenario in scenarios(
        maxActors: 2, maxOperationPerActor: 3,
    )]
    func testAfterFail(scenario: ScopedScenarioBuilder) {
        scenario
            .iterations(1000)
            .consistencyModel(Linearizability)
    }

    @After
    func after() {
        if (x != 0) {
            throw Exception("After inconsistency")
        }
    }
}

@ConcurrentTest
class TestVerifyFail {
    var x: Int64 = 0

    @Operation
    func incDec() {
        x += 1
        x -= 1
    }

    @StressTest[scenario in scenarios(
        maxActors: 2, maxOperationPerActor: 3,
    )]
    func testVerifyFail(scenario: ScopedScenarioBuilder) {
        scenario
            .iterations(1000)
            .consistencyModel(Linearizability)
    }

    @Verify
    func verify() {
        x == 0
    }
}
