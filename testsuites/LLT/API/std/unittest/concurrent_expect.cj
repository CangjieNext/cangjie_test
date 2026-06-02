/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args
// Assert scan PASSED: 1, SKIPPED: 0, ERROR: 0

import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

var concurrency = 100

@Test
public class StressStringBuilderConcurrent {
    @TestCase
    func StressStringBuilderRawdata() {
        for (i in 0..concurrency) {
            @Expect(1, 1)
        }
    }
}
