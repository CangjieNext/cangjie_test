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

    @After
    func afterDuplicate() {
        if (x != 0) {
            throw Exception("After inconsistency")
        }
    }
}

/* SCAN-IN
Test framework: macro failed to expand.
Test must contain no more than one @After annotated function: after, afterDuplicate
 */
