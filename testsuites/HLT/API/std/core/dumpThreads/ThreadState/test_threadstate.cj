/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args

@Test
class Test_ThreadState {
    @TestCase
    func test_toString() {
        @Assert(ThreadState.Ready.toString(), "Ready")
        @Assert(ThreadState.Running.toString(), "Running")
        @Assert(ThreadState.Pending.toString(), "Pending")
        @Assert(ThreadState.Terminated.toString(), "Terminated")
    }
}
