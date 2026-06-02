/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan Test case ended with timeout

@Test
public class Test_Timeout_Cancelation_03 {
    @TestCase
    @Timeout[Duration.second]
    func case001(): Unit {
        while (true) {
            @PowerAssert(1, 1)
        }
    }
}
