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
// ASSERT: scan failreason_01
// ASSERT: scan failreason_02
// ASSERT: scan failreason_03
// ASSERT: scan-not case not interrupt here

@Test
public class Test_FailExpect {
    @TestCase[message in [ "", "failreason_01", "failreason_02", "failreason_03" ]]
    func test01(message: String): Unit {
        @Fail(message)
        println("case not interrupt here")
    }
}
