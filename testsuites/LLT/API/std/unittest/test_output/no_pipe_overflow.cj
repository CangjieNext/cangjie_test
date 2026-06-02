/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color --capture-output | compare %f
// ASSERT: scan PASSED: 1

@Test
@Timeout[15 * Duration.second]
func noPipeOverflow() {
    for (_ in 0..(100 * 1024)) { // more then the linux pipe size
        print("q")
    }
    print("end", flush: true) // might get stuck here
}
