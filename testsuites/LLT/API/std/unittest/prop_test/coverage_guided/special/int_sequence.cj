/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt --sanitizer-coverage-trace-pc-guard --sanitizer-coverage-trace-compares 
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color --coverage-guided | compare %f
// ASSERT: scan Expect Failed

import std.random.*
import std.unittest.prop_test.*

@Test[x in random() 
]
@Configure[randomSeed: 1, generationSteps: 1000000]
@OverflowWrapping
func triggerGCov(x: Array<Int64>) {
    if (x.size < 4) {
        return
    }
    @Expect(x[0] != 12345678 || x[1] != 0xCCCCCC || x[2] != x[0] || x[3] != -42)
}
