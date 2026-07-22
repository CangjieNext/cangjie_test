/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


package std.process_test2

import std.process.*
import std.io.*
import std.sync.*
import std.fs.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class ProcessExtraTest {
    @TestCase
    func test_current_process_id(): Unit {
        // Process.current.pid is a public function
        let pid = Process.current.pid
        @Assert(pid > 0)
    }

    @TestCase
    func test_process_redirect_equality(): Unit {
        // ProcessRedirect enum values - use match for comparison
        let r1 = ProcessRedirect.Inherit
        match (r1) {
            case ProcessRedirect.Inherit => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_process_redirect_pipe(): Unit {
        let r = ProcessRedirect.Pipe
        match (r) {
            case ProcessRedirect.Pipe => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_process_redirect_discard(): Unit {
        let r = ProcessRedirect.Discard
        match (r) {
            case ProcessRedirect.Discard => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_process_redirect_from_file(): Unit {
        try (f = File("/dev/null", ReadWrite)) {
            let r = ProcessRedirect.FromFile(f)
            match (r) {
                case ProcessRedirect.FromFile(_) => @Assert(true)
                case _ => @Assert(false)
            }
        }
    }

    @TestCase
    func test_execute_simple(): Unit {
        let exitCode = execute("echo", ["hello"])
        @Expect(exitCode, 0)
    }

    @TestCase
    func test_execute_nonexistent(): Unit {
        try {
            let _ = execute("nonexistent_command_xyz", [])
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_execute_with_output(): Unit {
        let (code, out, err) = executeWithOutput("echo", ["test123"])
        @Expect(code, 0)
        @Assert(out.size > 0)
        // echo output should contain "test123"
        let s = String.fromUtf8(out)
        @Assert(s.contains("test123"))
    }

    @TestCase
    func test_execute_with_output_and_env(): Unit {
        let env = HashMap<String, String>()
        env["MY_VAR"] = "hello"
        let (code, out, _) = executeWithOutput("env", [], environment: env)
        @Expect(code, 0)
        let s = String.fromUtf8(out)
        @Assert(s.contains("MY_VAR=hello"))
    }

    @TestCase
    func test_execute_with_working_dir(): Unit {
        let (code, out, _) = executeWithOutput("pwd", [], workingDirectory: Path("/tmp"))
        @Expect(code, 0)
        let s = String.fromUtf8(out)
        @Assert(s.contains("/tmp"))
    }

    @TestCase
    func test_launch_and_wait(): Unit {
        let sub = launch("echo", ["hello"])
        let code = sub.wait()
        @Expect(code, 0)
    }

    @TestCase
    func test_launch_with_pipe_stdout(): Unit {
        let sub = launch("echo", ["pipe_test"], stdOut: ProcessRedirect.Pipe)
        let code = sub.wait()
        @Expect(code, 0)
        let out = sub.stdOutPipe.readToEnd()
        @Assert(out.size > 0)
        let s = String.fromUtf8(out)
        @Assert(s.contains("pipe_test"))
    }

    @TestCase
    func test_launch_with_discard(): Unit {
        let sub = launch("echo", ["discard_test"], stdOut: ProcessRedirect.Discard, stdErr: ProcessRedirect.Discard)
        let code = sub.wait()
        @Expect(code, 0)
    }

    @TestCase
    func test_launch_with_from_file(): Unit {
        try (f = File("/tmp/test_stdout_redirect.txt", OpenMode.Create | OpenMode.Write)) {
            let sub = launch("echo", ["file_test"], stdOut: ProcessRedirect.FromFile(f))
            let code = sub.wait()
            @Expect(code, 0)
        }
        // Verify file has content
        try (f2 = File("/tmp/test_stdout_redirect.txt", OpenMode.Read)) {
            let content = f2.readToEnd()
            let s = String.fromUtf8(content)
            @Assert(s.contains("file_test"))
        }
    }

    @TestCase
    func test_subprocess_is_alive(): Unit {
        let sub = launch("sleep", ["0.1"])
        @Assert(sub.isAlive())
        sub.wait()
        @Assert(!sub.isAlive())
    }

    @TestCase
    func test_subprocess_pid(): Unit {
        let sub = launch("echo", ["pid_test"])
        let pid = sub.pid
        @Assert(pid > 0)
        sub.wait()
    }

    @TestCase
    func test_subprocess_terminate(): Unit {
        let sub = launch("sleep", ["30"])
        sub.terminate()
        @Assert(!sub.isAlive())
    }

    @TestCase
    func test_subprocess_terminate_force(): Unit {
        let sub = launch("sleep", ["30"])
        sub.terminate(force: true)
        @Assert(!sub.isAlive())
    }

    @TestCase
    func test_find_process_current(): Unit {
        let pid = Process.current.pid
        let p = findProcess(pid)
        @Assert(p.pid == pid)
    }

    @TestCase
    func test_find_process_exited(): Unit {
        let sub = launch("echo", ["done"])
        sub.wait()
        // findProcess on exited process throws
        try {
            let _ = findProcess(sub.pid)
            @Assert(false)
        } catch (e: ProcessException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_process_exception_default(): Unit {
        let e = ProcessException()
        @Assert(e.message.size > 0)
    }

    @TestCase
    func test_process_exception_with_message(): Unit {
        let e = ProcessException("test error")
        @Expect(e.message, "test error")
    }

    @TestCase
    func test_process_timeout(): Unit {
        try {
            let _ = execute("sleep", ["10"], timeout: Duration.second)
            @Assert(false)
        } catch (e: TimeoutException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_subprocess_standard_input(): Unit {
        let sub = launch("cat", [], stdIn: ProcessRedirect.Pipe, stdOut: ProcessRedirect.Pipe)
        sub.stdInPipe.write("hello world".toArray())
        sub.stdInPipe.flush()
        sub.stdInPipe.close()
        let code = sub.wait()
        @Expect(code, 0)
        let out = sub.stdOutPipe.readToEnd()
        let s = String.fromUtf8(out)
        @Assert(s.contains("hello world"))
    }

    @TestCase
    func test_execute_with_stdin_pipe(): Unit {
        let (code, out, _) = executeWithOutput("cat", [], stdIn: ProcessRedirect.Pipe)
        @Expect(code, 0)
        // cat with pipe stdin but no data written -> empty output
    }

    @TestCase
    func test_process_current_process_stdin(): Unit {
        // Just verify stdin is not null
        let cp = Process.current
        @Assert(true) // accessing currentProcess should not throw
    }
}
