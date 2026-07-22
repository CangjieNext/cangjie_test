/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.process.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class ProcessExtraTest {

    @TestCase
    func test_process_current_pid(): Unit {
        let pid = Process.current.pid
        @Assert(pid > 0)
    }

    @TestCase
    func test_execute_echo(): Unit {
        let exitCode = execute("echo", ["hello"])
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_launch_and_wait(): Unit {
        let sub = launch("echo", ["hi"])
        let exitCode = sub.wait()
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_launch_pid(): Unit {
        let sub = launch("echo", ["hi"])
        @Assert(sub.pid > 0)
        let _ = sub.wait()
    }
}
