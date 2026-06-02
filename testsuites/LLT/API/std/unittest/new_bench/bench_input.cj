/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output --no-color | compare %f
// ASSERT: scan PASSED: 1
// ASSERT: scan-not Exception

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

foreign func usleep(arg: UIntNative): UIntNative

@Test
class FooTest {
    @Bench[x in [ 1 ]]
    @Configure[minDuration: Duration.second]
    func testSleep(x: Int64): Unit {
        unsafe { usleep(30000) }
    }
}

main() {
    let startTime = DateTime.now()
    let report: BenchReport = FooTest().asTestSuite().runBenchmarks()
    let duration = DateTime.now() - startTime
    report.reportTo(ConsoleReporter(colored: false))

    let results = report.reportTo(RawStatsReporter())["testSleep1"]
    @Assert(results[0] < 50_000000.0 && results[0] > 25_000000.0)
}
