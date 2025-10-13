/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./%n
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -p %n -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

/* SCAN-IN
Summary: TOTAL: 2
    PASSED: 1, SKIPPED: 0, ERROR: 0
    FAILED: 1, listed below:
            TCS: TestArticleController, CASE: testSuccessfullyUpdatedUi
*/

/* SCAN-IN
    REASON: Verification failed
        Unexpected invocation.
        Expected: ui.setLoading(false) expected by statement at ui_test.cj:39.
        Actual: ui.showOnTop(...) invoked at article_ui.cj:79.
*/

