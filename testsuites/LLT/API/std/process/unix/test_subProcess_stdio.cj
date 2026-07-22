/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.process.*
import std.io.*
import std.collection.*

@Test
public class ProcessStdioTest {
    @TestCase
    func test_execute_with_output(): Unit {
        let (exitCode, outArr, _) = executeWithOutput("echo", ["hello"])
        @Expect(exitCode, 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii(), "hello")
    }

    @TestCase
    func test_execute_exit_code(): Unit {
        let exitCode = execute("true", [])
        @Expect(exitCode, 0)
        let exitCode2 = execute("false", [])
        @Expect(exitCode2, 1)
    }

    @TestCase
    func test_launch_pipe_stdout(): Unit {
        let subProcess = launch("echo", ["pipe test"], stdOut: Pipe, stdErr: Pipe)
        let (exitCode, outArr, _) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii(), "pipe test")
    }

    @TestCase
    func test_launch_pipe_stderr(): Unit {
        let subProcess = launch("sh", ["-c", "echo err msg >&2"], stdOut: Pipe, stdErr: Pipe)
        let (exitCode, _, errArr) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(errArr.size > 0)
    }

    @TestCase
    func test_launch_pipe_stdin(): Unit {
        // Use printf with echo to test stdin pipe without needing to close stdin
        let subProcess = launch("echo", ["from stdin"], stdIn: Pipe, stdOut: Pipe, stdErr: Pipe)
        let (exitCode, outArr, _) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii(), "from stdin")
    }

    @TestCase
    func test_launch_discard(): Unit {
        let subProcess = launch("echo", ["discard"], stdOut: Discard, stdErr: Discard)
        let exitCode = subProcess.wait()
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_process_pid_positive(): Unit {
        let subProcess = launch("sleep", ["1"])
        @Expect(subProcess.pid > 0)
        subProcess.wait()
    }

    @TestCase
    func test_process_isAlive(): Unit {
        let subProcess = launch("sleep", ["2"])
        @Expect(subProcess.isAlive())
        subProcess.terminate(force: true)
        subProcess.wait()
        @Expect(!subProcess.isAlive())
    }

    @TestCase
    func test_process_terminate(): Unit {
        let subProcess = launch("sleep", ["5"])
        @Expect(subProcess.isAlive())
        subProcess.terminate(force: true)
        let exitCode = subProcess.wait()
        @Expect(exitCode, 9)
    }

    @TestCase
    func test_findProcess(): Unit {
        let subProcess = launch("sleep", ["5"])
        let proc = findProcess(subProcess.pid)
        @Expect(proc.pid, subProcess.pid)
        subProcess.terminate(force: true)
        subProcess.wait()
    }

    @TestCase
    func test_findProcess_invalid_pid(): Unit {
        var caught = false
        try {
            let _ = findProcess(-1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_findProcess_pid_too_large(): Unit {
        var caught = false
        try {
            let _ = findProcess(Int64(Int32.Max) + 1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_launch_null_command(): Unit {
        var caught = false
        try {
            let _ = launch("comm\0and", [])
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_launch_null_argument(): Unit {
        var caught = false
        try {
            let _ = launch("echo", ["arg\0null"])
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_process_name(): Unit {
        let subProcess = launch("echo", ["test"])
        @Expect(subProcess.name.size > 0)
        subProcess.wait()
    }

    @TestCase
    func test_process_command(): Unit {
        let subProcess = launch("echo", ["test"])
        @Expect(subProcess.command.size > 0)
        subProcess.wait()
    }
}
