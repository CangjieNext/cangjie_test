/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-1 Hello from hello1 to stdout
// ASSERT: scan-1 Hello from hello1 to stderr

@Test
class Tests {
    @TestCase
    func passingAndPrinting() {
        println("Hello from hello1 to stdout")
        eprintln("Hello from hello1 to stderr")
    }
}
