/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color --dry-run 2>&1 | compare %f
// ASSERT: scan-1 TOTAL: 1, SKIPPED: 0
// ASSERT: scan-1 NORUN
// ASSERT: scan-not PASSED
// ASSERT: scan-not ERROR
// ASSERT: scan-not this tesecase1 is not run
// ASSERT: scan-not this tesecase2 is not run
// ASSERT: scan-not this tesecase3 is not run
// ASSERT: scan-not this tesecase4 is not run

import std.process.*

@Test
class Suite {
    @BeforeAll
    func lifecycle1() {
        println("this tesecase1 is not run")
    }
    @AfterAll
    func lifecycle2() {
        println("this tesecase2 is not run")
    }
    @BeforeEach
    func lifecycle3() {
        println("this tesecase3 is not run")
    }
    @AfterEach
    func lifecycl4() {
        println("this tesecase4 is not run")
    }

    @TestCase
    func case1() {}
}
