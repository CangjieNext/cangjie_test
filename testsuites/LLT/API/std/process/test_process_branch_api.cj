/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.fs.*
import std.process.*
import std.io.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class ProcessBranchApiTest {

    // === ProcessRedirect enum ===
    @TestCase
    func test_redirect_inherit(): Unit {
        let r = ProcessRedirect.Inherit
        match (r) {
            case ProcessRedirect.Inherit => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_redirect_pipe(): Unit {
        let r = ProcessRedirect.Pipe
        match (r) {
            case ProcessRedirect.Pipe => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_redirect_discard(): Unit {
        let r = ProcessRedirect.Discard
        match (r) {
            case ProcessRedirect.Discard => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_redirect_from_file(): Unit {
        let path = "/tmp/cj_test_redirect.txt"
        let f = File.create(path)
        let r = ProcessRedirect.FromFile(f)
        match (r) {
            case ProcessRedirect.FromFile(file) => @Assert(true)
            case _ => @Assert(false)
        }
        f.close()
        remove(path)
    }

    // === ProcessException ===
    @TestCase
    func test_process_exception(): Unit {
        let e = ProcessException("test error")
        @Assert(e.message.contains("test error"))
    }

    @TestCase
    func test_process_exception_as_ioexception(): Unit {
        let e = ProcessException("io error")
        // ProcessException <: IOException
        @Assert(e.message.size > 0)
    }

    // === execute with timeout ===
    @TestCase
    func test_execute_with_timeout(): Unit {
        // execute with a timeout should complete or timeout
        let exitCode = execute("echo", ["timeout test"], timeout: Duration.second * 5)
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_execute_timeout_kill(): Unit {
        // Execute a long-running process with short timeout - throws TimeoutException
        var caught = false
        try {
            let _ = execute("sleep", ["10"], timeout: Duration.millisecond * 100)
        } catch (e: TimeoutException) {
            caught = true
        }
        @Assert(caught)
    }

    // === launch with working directory ===
    @TestCase
    func test_launch_with_working_dir(): Unit {
        let subProcess = launch("pwd", [], workingDirectory: Path("/tmp"), stdOut: Pipe, stdErr: Pipe)
        let (exitCode, outArr, _) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii(), "/tmp")
    }

    // === launch with environment ===
    @TestCase
    func test_launch_with_environment(): Unit {
        let env = HashMap<String, String>()
        env["MY_TEST_VAR"] = "hello123"
        let subProcess = launch("sh", ["-c", "echo $MY_TEST_VAR"], environment: env, stdOut: Pipe, stdErr: Pipe)
        let (exitCode, outArr, _) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii(), "hello123")
    }

    // === launch with FromFile redirect ===
    @TestCase
    func test_launch_from_file_stdout(): Unit {
        let path = "/tmp/cj_test_fromfile.txt"
        let f = File.create(path)
        let subProcess = launch("echo", ["file test"], stdOut: ProcessRedirect.FromFile(f))
        subProcess.wait()
        f.close()
        let data = File.readFrom(path)
        let outStr = String.fromUtf8(data)
        @Expect(outStr.trimAscii(), "file test")
        remove(path)
    }

    // === launch with Discard redirect ===
    @TestCase
    func test_launch_discard_stdout(): Unit {
        let subProcess = launch("echo", ["discard test"], stdOut: Discard, stdErr: Discard)
        let exitCode = subProcess.wait()
        @Expect(exitCode, 0)
    }

    // === SubProcess.stdInPipe/stdOutPipe/stdErrPipe properties ===
    @TestCase
    func test_subprocess_pipe_props(): Unit {
        let subProcess = launch("echo", ["pipe props"], stdIn: Pipe, stdOut: Pipe, stdErr: Pipe)
        // Just verify the pipe properties are accessible
        let _ = subProcess.stdInPipe
        let _ = subProcess.stdOutPipe
        let _ = subProcess.stdErrPipe
        subProcess.wait()
    }

    // === Process properties ===
    @TestCase
    func test_process_name(): Unit {
        let subProcess = launch("echo", ["name test"])
        @Assert(subProcess.name.size > 0)
        subProcess.wait()
    }

    @TestCase
    func test_process_command(): Unit {
        let subProcess = launch("echo", ["cmd test"])
        @Assert(subProcess.command.size > 0)
        subProcess.wait()
    }

    @TestCase
    func test_process_environment(): Unit {
        let subProcess = launch("echo", ["env test"])
        // environment property may throw ProcessException for SubProcess
        var caught = false
        try {
            let env = subProcess.environment
            @Assert(env.size > 0)
        } catch (e: ProcessException) {
            caught = true
        }
        @Assert(caught)
        subProcess.wait()
    }

    @TestCase
    func test_process_working_directory(): Unit {
        let subProcess = launch("echo", ["wd test"])
        let wd = subProcess.workingDirectory
        @Assert(wd.toString().size > 0)
        subProcess.wait()
    }

    @TestCase
    func test_process_command_line(): Unit {
        let subProcess = launch("echo", ["cmd line test"])
        let cl = subProcess.commandLine
        @Assert(cl.size > 0)
        subProcess.wait()
    }

    @TestCase
    func test_process_arguments(): Unit {
        let subProcess = launch("echo", ["arg1", "arg2", "arg3"])
        let args = subProcess.arguments
        @Expect(args.size, 3)
        @Expect(args[0], "arg1")
        @Expect(args[2], "arg3")
        subProcess.wait()
    }

    // === terminate non-force ===
    @TestCase
    func test_terminate_normal(): Unit {
        let subProcess = launch("sleep", ["5"])
        @Assert(subProcess.isAlive())
        subProcess.terminate() // non-force
        let exitCode = subProcess.wait()
        @Assert(exitCode != 0)
    }

    // === findProcess with process that exited ===
    @TestCase
    func test_findProcess_after_exit(): Unit {
        let subProcess = launch("echo", ["done"])
        let pid = subProcess.pid
        subProcess.wait()
        // findProcess on an exited process throws ProcessException
        var caught = false
        try {
            let _ = findProcess(pid)
        } catch (e: ProcessException) {
            caught = true
        }
        @Assert(caught)
    }

    // === execute with environment ===
    @TestCase
    func test_execute_with_environment(): Unit {
        let env = HashMap<String, String>()
        env["TEST_ENV_42"] = "value42"
        let exitCode = execute("sh", ["-c", "test -n \"$TEST_ENV_42\""], environment: env)
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_execute_with_working_dir(): Unit {
        let exitCode = execute("pwd", [], workingDirectory: Path("/tmp"))
        @Expect(exitCode, 0)
    }

    // === executeWithOutput with redirects ===
    @TestCase
    func test_execute_with_output_inherit(): Unit {
        let (exitCode, outArr, _) = executeWithOutput("echo", ["inherit test"], stdOut: Pipe)
        @Expect(exitCode, 0)
        @Assert(outArr.size > 0)
    }

    @TestCase
    func test_execute_with_output_discard(): Unit {
        let (exitCode, _, _) = executeWithOutput("echo", ["discard out"], stdOut: Discard, stdErr: Discard)
        @Expect(exitCode, 0)
    }

    // === launch non-existent command ===
    @TestCase
    func test_launch_nonexistent_command(): Unit {
        var caught = false
        try {
            let _ = launch("/nonexistent/command/that/does/not/exist", [])
        } catch (e: Exception) {
            caught = true
        }
        @Assert(caught)
    }
}
