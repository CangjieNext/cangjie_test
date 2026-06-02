/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (Linux) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --bench --report-format=html --report-path=bbb


import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

var counter: Float64 = 0.0

let perf0 = Perf(PerfCounter.HW_CPU_CYCLES)
let perf1 = Perf(PerfCounter.HW_INSTRUCTIONS)
let perf2 = Perf(PerfCounter.HW_CACHE_REFERENCES)
let perf3 = Perf(PerfCounter.HW_CACHE_MISSES)
let perf4 = Perf(PerfCounter.HW_BRANCH_INSTRUCTIONS)
let perf5 = Perf(PerfCounter.HW_BRANCH_MISSES)
let perf6 = Perf(PerfCounter.HW_BUS_CYCLES)
let perf8 = Perf(PerfCounter.HW_STALLED_CYCLES_BACKEND)
let perf9 = Perf(PerfCounter.HW_REF_CPU_CYCLES)
let perf10 = Perf(PerfCounter.SW_CPU_CLOCK)
let perf11 = Perf(PerfCounter.SW_TASK_CLOCK)
let perf12 = Perf(PerfCounter.SW_PAGE_FAULTS)
let perf13 = Perf(PerfCounter.SW_CONTEXT_SWITCHES)
let perf14 = Perf(PerfCounter.SW_CPU_MIGRATIONS)
let perf15 = Perf(PerfCounter.SW_PAGE_FAULTS_MIN)
let perf16 = Perf(PerfCounter.SW_PAGE_FAULTS_MAJ)
let perf17 = Perf(PerfCounter.SW_EMULATION_FAULTS)

@Test
@Measure[perf0, perf1, perf2, perf3, perf4, perf5, perf6, perf8, perf9, perf10, perf11, perf12, perf13, perf14, perf15, perf16, perf17]
@Configure[minDuration: Duration.nanosecond, warmup: Duration.nanosecond]
class Test_CPU_01 {
    @BeforeEach
    func beforeEach() {
        counter = 0.0
    }
    
    @Bench
    func foo() {
        counter += 1.0
    }
}