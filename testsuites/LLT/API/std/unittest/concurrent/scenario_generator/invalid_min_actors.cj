/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args %run_utest_opt --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.concurrent.*
import std.unittest.testmacro.*

@ConcurrentTest
class TestAfterFail {
    var x: Int64 = 0

    @Group["Single"]
    @Operation
    func incDec() {
        x += 1
        x -= 1
        x
    }

    @StressTest[scenario in scenarios(
        minActors: 2, maxActors: 2, maxOperationPerActor: 3,
    )]
    func test(scenario: ScenarioBuilder<TestAfterFail>) {
        scenario
            .iterations(100)
            .consistencyModel(Linearizability)
    }
}

/* SCAN-IN
IllegalArgumentException: Maximal count of actors must be greater or equal to minimal count 2. Maximal count is limited by number of groups: 1. Due to absence of operations without groups
 */
