/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --capture-output | compare %f
// ASSERT: scan-1 STDOUT
// ASSERT: scan-begin CASE: case1, STDOUT:
// ASSERT: scan-next print: x = 1
// ASSERT: scan-next print: x = 2
// ASSERT: scan-next print: x = 3

@Test
class Tests {
    @TestCase[x in [ 1, 2, 3 ]]
    func case1(x: Int64) {
        println("print: x = ${x}")
        @Expect(x, 2)
    }
}
