/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-not running case01
// ASSERT: scan running case02
// ASSERT: scan-not Err%

/*
 * Test description:
 *      test @Bench without --bench modified
 * Test API:
 *      @Bench
 */

@Test
class Test_Bench_01 {
    @Bench
    func case01(): Unit {
        println("running case01")
    }

    @TestCase
    @Bench
    func case02(): Unit {
        println("running case02")
    }
}
