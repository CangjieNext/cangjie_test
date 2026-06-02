/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --capture-output | compare %f
// ASSERT: scan-not Hello from case01
// ASSERT: scan-1 Hello from case02 first
// ASSERT: scan-1 Hello from case02 second
// ASSERT: scan-1 Hello from case03
// ASSERT: scan-not Hello from case04

import std.process.*

@Test
class Test_03 {
    @TestCase
    func case01(): Unit {
        print("Hello from case01\n", flush: true)
    }

    @TestCase
    func case02(): Unit {
        print("Hello from case02 first\n", flush: true)
        print("Hello from case02 second\n", flush: true)
        Process.current.exit(12)
    }

    @TestCase
    func case03(): Unit {
        print("Hello from case03\n", flush: true)
        @Expect(1, 2)
    }

    @TestCase
    func case04(): Unit {
        print("Hello from case04\n", flush: true)
    }
}
