/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-1 TOTAL: 4, SKIPPED: 0
// ASSERT: scan-4 NORUN
// ASSERT: scan-not PASSED
// ASSERT: scan-not ERROR

import std.process.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
class Suite1 {
    @TestCase
    func case1() {}

    @TestCase
    func case2() {}
}

@Test
class Suite2 {
    @TestCase
    func case3() {}

    @TestCase
    func case4() {
        Process.current.exit(42)
    }
}

main(): Unit {
    let conf = Configuration()
    conf.set(KeyDryRun.dryRun, true)
    TestGroup
        .builder("group")
        .add(Suite1().asTestSuite())
        .add(Suite2().asTestSuite())
        .build()
        .runTests(conf)
        .reportTo(ConsoleReporter(colored: false))
}
