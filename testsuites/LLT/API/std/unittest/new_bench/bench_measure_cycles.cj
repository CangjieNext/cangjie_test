/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (x86) EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// (x86) RUN-EXEC-PIPE: %run %run_opt %output %run_args --no-color --bench | compare %f
// (x86) ASSERT: scan-52 cycles
// (x86) ASSERT: scan PASSED: 3,

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

var counter: Float64 = 0.0

@Test
@Measure[CpuCycles()]
@Configure[minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
class BenchClass {
    @BeforeEach
    func beforeEach() {
        counter = 0.0
    }

    @Bench
    func foo() {
        counter += 1.0
    }

    @Bench
    func bar() {
        counter += 2.0
    }

    @Bench[a in [ true, false ]]
    func parameterized(a: Bool) {
        counter += 3.0
    }
}
