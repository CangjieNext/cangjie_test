/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --show-tags 2>&1 | compare %f
// ASSERT: scan-3 suiteTag
// ASSERT: scan-2 caseTag

@Test
@Tag[suiteTag]
class MySuite {
    @AfterEach
    func noTagsPrintedFor_EachMethods() {
        throw Exception()
    }

    @AfterAll
    func noTagsPrintedFor_AllMethods() {
        throw Exception()
    }
    
    @TestCase
    @Tag[caseTag]
    func case0() {}
}
