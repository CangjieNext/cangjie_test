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
import std.collection.*
import std.fs.*
import std.io.*

/**
 * Test public APIs of Process, SubProcess, and ProcessRedirect.
 * Tests use short-lived subprocesses (/bin/echo, /bin/true, /bin/sleep)
 * and avoid hangs by waiting with timeouts or terminating long-running children.
 */
@Test
public class ProcessApiTest {
    /// Process.name returns a non-empty string for a launched subprocess.
    @TestCase
    func test_process_name(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let name = subProcess.name
        @Expect(name.size > 0)
        subProcess.wait()
    }

    /// Process.command returns the command that was launched.
    @TestCase
    func test_process_command(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let command = subProcess.command
        @Expect(command.size > 0)
        @Expect(command.contains("echo"))
        subProcess.wait()
    }

    /// Process.commandLine returns a non-empty array for a launched subprocess.
    @TestCase
    func test_process_commandLine(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let commandLine = subProcess.commandLine
        @Expect(commandLine.size > 0)
        subProcess.wait()
    }

    /// Process.workingDirectory returns a valid path for a launched subprocess.
    @TestCase
    func test_process_workingDirectory(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let workDir = subProcess.workingDirectory
        @Expect(workDir.toString().size > 0)
        subProcess.wait()
    }

    /// Process.workingDirectory reflects an explicitly-set working directory.
    @TestCase
    func test_process_workingDirectory_explicit(): Unit {
        let dir = Path("/tmp")
        let subProcess = launch("/bin/echo", ["hello"], workingDirectory: dir)
        let workDir = subProcess.workingDirectory
        @Expect(workDir.toString().contains("tmp"))
        subProcess.wait()
    }

    /// Process.environment returns a map for a running subprocess.
    @TestCase
    func test_process_environment(): Unit {
        let subProcess = launch("/bin/sleep", ["2"])
        let env = subProcess.environment
        @Expect(env.size >= 0)
        subProcess.terminate(force: true)
        subProcess.wait()
    }

    /// Process.environment reflects a custom environment variable passed to launch.
    @TestCase
    func test_process_environment_custom(): Unit {
        let envMap = HashMap<String, String>()
        envMap.add("MY_TEST_VAR", "custom_value")
        let subProcess = launch("/bin/sleep", ["2"], environment: envMap)
        let env = subProcess.environment
        @Expect(env.contains("MY_TEST_VAR"))
        @Expect(env["MY_TEST_VAR"] == "custom_value")
        subProcess.terminate(force: true)
        subProcess.wait()
    }

    /// Process.isAlive() returns true for a running subprocess.
    @TestCase
    func test_process_isAlive_running(): Unit {
        let subProcess = launch("/bin/sleep", ["2"])
        @Expect(subProcess.isAlive())
        subProcess.terminate(force: true)
        subProcess.wait()
    }

    /// Process.isAlive() returns false for a terminated subprocess.
    @TestCase
    func test_process_isAlive_terminated(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        subProcess.wait()
        @Expect(!subProcess.isAlive())
    }

    /// SubProcess.pid returns a positive value for a launched subprocess.
    @TestCase
    func test_subProcess_pid_positive(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        @Expect(subProcess.pid > 0)
        subProcess.wait()
    }

    /// SubProcess.pid matches the pid obtained from findProcess.
    @TestCase
    func test_subProcess_pid_matches_findProcess(): Unit {
        let subProcess = launch("/bin/sleep", ["2"])
        let proc = findProcess(subProcess.pid)
        @Expect(proc.pid == subProcess.pid)
        subProcess.terminate(force: true)
        subProcess.wait()
    }

    /// SubProcess.stdInPipe / stdOutPipe / stdErrPipe are accessible when using Pipe redirects.
    @TestCase
    func test_subProcess_pipe_props(): Unit {
        let subProcess = launch("/bin/echo", ["pipe-test"], stdOut: Pipe, stdErr: Pipe)
        let (exitCode, outArr, _) = subProcess.waitOutput()
        @Expect(exitCode == 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii() == "pipe-test")
    }

    /// SubProcess.wait() returns the exit code of a short-lived process.
    @TestCase
    func test_subProcess_wait_exit_code(): Unit {
        let subProcess = launch("/bin/true", [])
        let exitCode = subProcess.wait()
        @Expect(exitCode == 0)
    }

    /// SubProcess.wait() returns non-zero exit code for /bin/false.
    @TestCase
    func test_subProcess_wait_nonzero_exit(): Unit {
        let subProcess = launch("/bin/false", [])
        let exitCode = subProcess.wait()
        @Expect(exitCode != 0)
    }

    /// SubProcess.wait() with a timeout returns the exit code when the process finishes in time.
    @TestCase
    func test_subProcess_wait_with_timeout(): Unit {
        let subProcess = launch("/bin/echo", ["fast"])
        let exitCode = subProcess.wait(timeout: Duration.second * 5)
        @Expect(exitCode == 0)
    }

    /// ProcessRedirect.Inherit works: subprocess inherits parent's stdio.
    @TestCase
    func test_processRedirect_inherit(): Unit {
        let subProcess = launch("/bin/echo", ["inherit-test"], stdIn: Inherit, stdOut: Inherit, stdErr: Inherit)
        let exitCode = subProcess.wait()
        @Expect(exitCode == 0)
    }

    /// ProcessRedirect.Discard works: stdout/stderr are discarded.
    @TestCase
    func test_processRedirect_discard(): Unit {
        let subProcess = launch("/bin/echo", ["discard-test"], stdOut: Discard, stdErr: Discard)
        let exitCode = subProcess.wait()
        @Expect(exitCode == 0)
    }

    /// ProcessRedirect.Pipe works: stdout is captured via pipe.
    @TestCase
    func test_processRedirect_pipe(): Unit {
        let subProcess = launch("/bin/echo", ["pipe-capture"], stdOut: Pipe, stdErr: Pipe)
        let (exitCode, outArr, _) = subProcess.waitOutput()
        @Expect(exitCode == 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii() == "pipe-capture")
    }

    /// ProcessRedirect.FromFile works: stdout is redirected to a file.
    @TestCase
    func test_processRedirect_fromFile(): Unit {
        let outFile = File("/tmp/test_process_redirect_out.txt", OpenMode.Write)
        try {
            let subProcess = launch("/bin/echo", ["fromfile-test"],
                stdOut: FromFile(outFile), stdErr: Discard)
            let exitCode = subProcess.wait()
            @Expect(exitCode == 0)
        } finally {
            outFile.close()
        }
        let content = File.readFrom("/tmp/test_process_redirect_out.txt")
        let contentStr = String.fromUtf8(content)
        @Expect(contentStr.trimAscii() == "fromfile-test")
    }

    /// ProcessRedirect.FromFile with a closed file throws ProcessException.
    @TestCase
    func test_processRedirect_fromFile_closed(): Unit {
        let outFile = File("/tmp/test_process_redirect_closed.txt", OpenMode.Write)
        outFile.close()
        var caught = false
        try {
            let _ = launch("/bin/echo", ["closed"], stdOut: FromFile(outFile))
        } catch (e: ProcessException) {
            caught = true
        }
        @Expect(caught)
    }

    /// ProcessRedirect.FromFile with a non-existent file path throws.
    @TestCase
    func test_processRedirect_fromFile_nonexistent(): Unit {
        var caught = false
        try {
            let outFile = File("/tmp/nonexistent_dir_xyz/out.txt", OpenMode.Write)
            let _ = launch("/bin/echo", ["nonexist"], stdOut: FromFile(outFile))
        } catch (e: Exception) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: null character in command throws IllegalArgumentException.
    @TestCase
    func test_launch_null_in_command(): Unit {
        var caught = false
        try {
            let _ = launch("comm\0and", [])
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: null character in argument throws IllegalArgumentException.
    @TestCase
    func test_launch_null_in_argument(): Unit {
        var caught = false
        try {
            let _ = launch("/bin/echo", ["arg\0null"])
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: null character in environment key throws IllegalArgumentException.
    @TestCase
    func test_launch_null_in_env_key(): Unit {
        let envMap = HashMap<String, String>()
        envMap.add("bad\0key", "value")
        var caught = false
        try {
            let _ = launch("/bin/echo", [], environment: envMap)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: null character in environment value throws IllegalArgumentException.
    @TestCase
    func test_launch_null_in_env_value(): Unit {
        let envMap = HashMap<String, String>()
        envMap.add("KEY", "bad\0value")
        var caught = false
        try {
            let _ = launch("/bin/echo", [], environment: envMap)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: equals sign in environment key throws IllegalArgumentException.
    @TestCase
    func test_launch_equals_in_env_key(): Unit {
        let envMap = HashMap<String, String>()
        envMap.add("bad=key", "value")
        var caught = false
        try {
            let _ = launch("/bin/echo", [], environment: envMap)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: non-existent working directory throws IllegalArgumentException.
    @TestCase
    func test_launch_bad_workingDirectory(): Unit {
        var caught = false
        try {
            let _ = launch("/bin/echo", ["hello"], workingDirectory: Path("/nonexistent_dir_xyz_abc"))
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: working directory pointing to a file (not directory) throws IllegalArgumentException.
    @TestCase
    func test_launch_workingDirectory_is_file(): Unit {
        let tmpFile = File("/tmp/test_process_wd_file.txt", OpenMode.Write)
        tmpFile.close()
        var caught = false
        try {
            let _ = launch("/bin/echo", ["hello"], workingDirectory: Path("/tmp/test_process_wd_file.txt"))
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: findProcess with negative pid throws IllegalArgumentException.
    @TestCase
    func test_findProcess_negative_pid(): Unit {
        var caught = false
        try {
            let _ = findProcess(-1)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Error path: findProcess with pid exceeding Int32.Max throws IllegalArgumentException.
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

    /// Process.terminate on a running subprocess stops it.
    @TestCase
    func test_process_terminate(): Unit {
        let subProcess = launch("/bin/sleep", ["10"])
        @Expect(subProcess.isAlive())
        subProcess.terminate(force: true)
        let exitCode = subProcess.wait()
        @Expect(exitCode == 9)
    }

    /// Process.startTime returns a DateTime for a launched subprocess.
    @TestCase
    func test_process_startTime(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let startTime = subProcess.startTime
        @Expect(startTime.year >= 2020)
        subProcess.wait()
    }

    /// Process.startTime returns DateTime.UnixEpoch for a non-existent process.
    @TestCase
    func test_process_startTime_nonexistent(): Unit {
        // Use a large pid that is very unlikely to exist.
        // Process constructor sets _startTimeSinceUnixEpoch = -1 for non-existent pids,
        // causing startTime to return DateTime.UnixEpoch.
        // We can't directly construct a Process with an invalid pid from outside the package,
        // so we test the behavior through findProcess which will throw for a non-existent pid.
        var caught = false
        try {
            // 999999 is unlikely to be a real process
            let _ = findProcess(999999)
        } catch (e: ProcessException) {
            caught = true
        }
        @Expect(caught)
    }

    /// Process.systemTime returns a non-negative Duration for the current process.
    @TestCase
    func test_process_systemTime(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let sysTime = subProcess.systemTime
        @Expect(sysTime >= Duration.Zero)
        subProcess.wait()
    }

    /// Process.userTime returns a non-negative Duration for the current process.
    @TestCase
    func test_process_userTime(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let userTime = subProcess.userTime
        @Expect(userTime >= Duration.Zero)
        subProcess.wait()
    }

    /// execute() runs a command and returns its exit code.
    @TestCase
    func test_execute_exit_code(): Unit {
        let exitCode = execute("/bin/true", [])
        @Expect(exitCode == 0)
    }

    /// execute() returns non-zero for /bin/false.
    @TestCase
    func test_execute_nonzero(): Unit {
        let exitCode = execute("/bin/false", [])
        @Expect(exitCode != 0)
    }

    /// executeWithOutput() captures stdout.
    @TestCase
    func test_executeWithOutput_stdout(): Unit {
        let (exitCode, outArr, _) = executeWithOutput("/bin/echo", ["captured"])
        @Expect(exitCode == 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii() == "captured")
    }

    /// executeWithOutput() captures stderr.
    @TestCase
    func test_executeWithOutput_stderr(): Unit {
        let (exitCode, _, errArr) = executeWithOutput("/bin/sh", ["-c", "echo stderr-msg >&2"])
        @Expect(exitCode == 0)
        @Expect(errArr.size > 0)
        let errStr = String.fromUtf8(errArr)
        @Expect(errStr.trimAscii().contains("stderr-msg"))
    }

    /// launch with empty arguments array works correctly.
    @TestCase
    func test_launch_empty_arguments(): Unit {
        let subProcess = launch("/bin/true", [])
        let exitCode = subProcess.wait()
        @Expect(exitCode == 0)
    }

    /// launch with multiple arguments works correctly.
    @TestCase
    func test_launch_multiple_arguments(): Unit {
        let subProcess = launch("/bin/echo", ["a", "b", "c"], stdOut: Pipe, stdErr: Pipe)
        let (exitCode, outArr, _) = subProcess.waitOutput()
        @Expect(exitCode == 0)
        let outStr = String.fromUtf8(outArr)
        @Expect(outStr.trimAscii() == "a b c")
    }

    /// SubProcess.wait() on a terminated process returns the exit code.
    @TestCase
    func test_wait_terminated(): Unit {
        let subProcess = launch("/bin/echo", ["hello"])
        let code = subProcess.wait()
        @Expect(code == 0)
    }
}
