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

@Test[i in random(), j in random() 
]
@Configure[randomSeed: 100, generationSteps: 10000]
@OverflowWrapping
func triggerGCov(i: Int64, j: Int64) {
    if (i < 2000) {
        return
    } // exclude small value bias
    @Expect(i != j + 15)
}
