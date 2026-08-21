/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

import std.unittest.*
import std.unittest.concurrent.*
import std.unittest.testmacro.*

@ConcurrentTest
class TestAfterFail {
    var x: Int64 = 0

    // FIXME: Group only with @Operation
    @Group["Invalid"]
    func foo() {}

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
Test framework: macro failed to expand.
@Group macro must be used together with @Operation macro
 */
