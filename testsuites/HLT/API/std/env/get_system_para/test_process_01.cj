/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.math.*
import std.collection.*
import std.posix.*
import std.env.*

@Test
public class Test_env_process_01 {
    @TestCase
    func test_env_process_01(): Unit {
        @Expect(getProcessId() > 0, true)
        @Expect(getProcessId() < Int64(Int32.Max), true)
        @Expect(getProcessId(), Int64(getpid()))
        @Expect(getCommand().size > 0, true)
        @Expect(getCommandLine().size > 0, true)
        @Expect(getHomeDirectory().toString().size > 0, true)
        @Expect(getTempDirectory().toString().size > 0, true)
    }

    @TestCase
    func test_env_process_02(): Unit {
        setVariable("currentProcess", "仓颉鸿蒙")
        @Expect(getProcessId() > 0, true)
        @Expect(getProcessId() < Int64(Int32.Max), true)
        @Expect(getProcessId(), Int64(getpid()))
        @Expect(getCommand().size > 0, true)
        @Expect(getCommandLine().size > 0, true)
        @Expect(getVariable("currentProcess"), Some("仓颉鸿蒙"))
        removeVariable("currentProcess")
        @Expect(getVariable("currentProcess"), None)
        @Expect(getVariable(""), None)
    }

    @TestCase
    func test_env_process_03(): Unit {
        try {
            getVariable("\0")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path cannot contain null character!")
        }
    }
}
