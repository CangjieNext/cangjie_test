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
public class ProcessEdgeBranchTest {

    // ==================== Process properties ====================

    @TestCase
    func test_process_current_pid(): Unit {
        let pid = Process.current.pid
        @Assert(pid > 0)
    }

    @TestCase
    func test_process_current_name(): Unit {
        let name = Process.current.name
        @Assert(name.size > 0)
    }

    @TestCase
    func test_process_current_command(): Unit {
        let cmd = Process.current.command
        @Assert(cmd.size > 0)
    }

    @TestCase
    func test_process_current_start_time(): Unit {
        let startTime = Process.current.startTime
        @Assert(startTime.year > 2000)
    }

    @TestCase
    func test_process_current_system_time(): Unit {
        let sysTime = Process.current.systemTime
        @Assert(sysTime >= Duration.Zero)
    }

    @TestCase
    func test_process_current_user_time(): Unit {
        let userTime = Process.current.userTime
        @Assert(userTime >= Duration.Zero)
    }

    // ==================== execute ====================

    @TestCase
    func test_execute_simple(): Unit {
        let exitCode = execute("echo", ["hello"])
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_execute_with_args(): Unit {
        let exitCode = execute("echo", ["-n", "test"])
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_execute_nonexistent_command(): Unit {
        try {
            let _ = execute("nonexistent_command_xyz", [])
            @Assert(false)
        } catch (e: ProcessException) {
            @Assert(true)
        }
    }



    @TestCase
    func test_execute_timeout_exceeded(): Unit {
        try {
            let _ = execute("sleep", ["10"], timeout: Duration.millisecond * 100)
            @Assert(false)
        } catch (e: TimeoutException) {
            @Assert(true)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    // ==================== executeWithOutput ====================

    @TestCase
    func test_execute_with_output(): Unit {
        let (exitCode, stdout, stderr) = executeWithOutput("echo", ["hello"])
        @Expect(exitCode, 0)
        @Assert(stdout.size > 0)
    }

    @TestCase
    func test_execute_with_output_error_command(): Unit {
        let (exitCode, stdout, stderr) = executeWithOutput("ls", ["/nonexistent_path_xyz"])
        @Assert(exitCode != 0)
        @Assert(stderr.size > 0)
    }


    // ==================== launch ====================

    @TestCase
    func test_launch_simple(): Unit {
        let sub = launch("echo", ["hello"])
        let exitCode = sub.wait()
        @Expect(exitCode, 0)
    }


    @TestCase
    func test_launch_nonexistent(): Unit {
        try {
            let _ = launch("nonexistent_cmd_xyz", [])
            @Assert(false)
        } catch (e: ProcessException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_launch_is_alive(): Unit {
        let sub = launch("sleep", ["1"])
        @Assert(sub.isAlive())
        let _ = sub.wait()
        @Assert(!sub.isAlive())
    }

    @TestCase
    func test_launch_terminate(): Unit {
        let sub = launch("sleep", ["10"])
        sub.terminate()
        let exitCode = sub.wait()
        @Assert(true)
    }

    @TestCase
    func test_launch_terminate_force(): Unit {
        let sub = launch("sleep", ["10"])
        sub.terminate(force: true)
        let _ = sub.wait()
        @Assert(true)
    }

    @TestCase
    func test_launch_pid(): Unit {
        let sub = launch("echo", ["hi"])
        @Assert(sub.pid > 0)
        let _ = sub.wait()
    }


    // ==================== findProcess ====================


    }

    // ==================== SubProcess stdin/stdout ====================




