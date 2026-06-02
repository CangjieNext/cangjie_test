/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-1 SKIPPED: 3
// ASSERT: scan-1 TOTAL: 4
// ASSERT: scan-1 case1
// ASSERT: scan-not case2
// ASSERT: scan-not case3
// ASSERT: scan-not case4

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.common.*

@Test
class Suite1 {
    @TestCase
    func case1() {}

    @TestCase
    @Tag[slow]
    func case2() {}
}

@Test
class Suite2 {
    @TestCase
    func case3() {}

    @TestCase
    func case4() {}
}

main() {
    let config = Configuration()
    config.set(KeyFilter.filter, "Suite1.*")
    config.set(KeyExcludeTags.excludeTags, "slow")
    TestGroup
        .builder("group")
        .add(Suite1().asTestSuite())
        .add(Suite2().asTestSuite())
        .build()
        .runTests(config)
        .reportTo(ConsoleReporter(colored: false))
}
