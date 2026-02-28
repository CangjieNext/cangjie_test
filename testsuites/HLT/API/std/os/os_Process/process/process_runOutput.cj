/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 
import std.fs.{File, OpenMode}
import std.posix.*
import std.process.*
import std.time.*
import std.sync.*

@When[os == "macOS"]
let ret = "ls: abcd: No such file or directory\n"
@When[os != "macOS"]
let ret = "No such file or directory\n"

@Test
class Test_runOutput {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_value_blank(): Unit {
        let (exitCode, out, err) = Process.runOutput("echo", "")
        @Expect(exitCode,0)
        @Expect(String.fromUtf8(out),"\n")
        @Expect(String.fromUtf8(err),"")
    }

    @TestCase
    func test_single_commander(): Unit {
        let (exitCode, out, err) = Process.runOutput("pwd")
        @Expect(exitCode,0)
        @Expect(String.fromUtf8(out).contains("runOutput_cj"))
        @Expect(String.fromUtf8(err),"")
    }

    @TestCase
    func test_commander_and_option(): Unit {
        let (exitCode, out, err) = Process.runOutput("ls", "-a")
        @Expect(exitCode,0)
        @Expect(String.fromUtf8(out).contains("runOutput.cj"))
        @Expect(String.fromUtf8(err),"")
    }

    @TestCase
    func test_commander_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.runOutput("mkdir", "test")
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_commander_with_option_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.runOutput("mkdir", "-p", "test")
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_invalid_commander1(): Unit {
        try {
            Process.runOutput("abc")
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander2(): Unit {
        try {
            Process.runOutput("")
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander3(): Unit {
        try {
            Process.runOutput("\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander4(): Unit {
        try {
            Process.runOutput("echo\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"echo\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander5(): Unit {
        try {
            Process.runOutput("ec\0ho")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"ec\0ho\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander6(): Unit {
        try {
            Process.runOutput("echo", "\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander7(): Unit {
        try {
            Process.runOutput("echo", "a", "\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_commander_argument_notmatch(): Unit {
        let (exitCode, out, err) = Process.runOutput("ls", "abcd", stdErr: Pipe)
        var flag = false
        if (exitCode != 0) {
            flag = true
        }
        @Expect(flag)
    }

    @TestCase
    func test_longArguement(): Unit {
        try {
            let sub = Process.runOutput("echo", "abcd" * 1024 * 1024)
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"Argument list too long\".")
        }
        @Expect(cnt,1)
        remove("./test.txt")
    }

    @TestCase
    func test_err_check(): Unit {
        let (exitCode, out, err) = Process.runOutput("ls", "abcd")
        @Expect(String.fromUtf8(out),"")
        println(String.fromUtf8(err))
        @Expect(String.fromUtf8(err).contains(ret))
    }

    @TestCase
    func test_out_check(): Unit {
        let (exitCode, out, err) = Process.runOutput("echo", "abcd")
        @Expect(String.fromUtf8(out),"abcd\n")
        @Expect(String.fromUtf8(err),"")
    }
}
