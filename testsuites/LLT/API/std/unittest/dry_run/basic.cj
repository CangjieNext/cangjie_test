/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f --test -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args --no-color --dry-run 2>&1 | compare %f
// ASSERT: scan-1 TOTAL: 4
// ASSERT: scan-4 NORUN
// ASSERT: scan-not PASSED
// ASSERT: scan-not ERROR
// ASSERT: scan-not REASON
// ASSERT: scan-1 case1
// ASSERT: scan-1 case2
// ASSERT: scan-1 case3
// ASSERT: scan-1 case4

import std.process.*

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
