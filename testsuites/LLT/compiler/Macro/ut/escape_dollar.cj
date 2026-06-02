// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestA {
    @TestCase
    func dollar(): Unit {
        let str = "\${classa.name}"
        @Assert(str, "\${classa.name}")
    }
}

/* SCAN-IN
    [32mPASSED[0m: 1, [32mSKIPPED[0m: 0, ERROR: 0
 */
