/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS and not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not OHOS and not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// (not iOS and not Windows) ASSERT: scan subprocess_waitOutput.cj
import std.fs.{File, OpenMode}
import std.posix.*
import std.process.*
import std.time.*
import std.sync.*

var cnt = 0
@When[os == "macOS"]
let ret = 1
@When[os != "macOS"]
let ret = 2

@Test
class Test_start {
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_single_commander(): Unit {
        Process.start("pwd").waitOutput()
    }

    @TestCase
    func test_commander_and_option(): Unit {
        Process.start("ls", "-a").waitOutput()
    }

    @TestCase
    func test_commander_with_option_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.start("mkdir", "-p", "test").waitOutput()
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_invalid_commander(): Unit {
        try {
            Process.start("abc").waitOutput()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,1)

        try {
            Process.start("").waitOutput()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,2)

        try {
            Process.start("\0").waitOutput()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"\0\" cannot contains null character.")
        }
        @Expect(cnt,3)

        try {
            Process.start("echo\0").waitOutput()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"echo\0\" cannot contains null character.")
        }
        @Expect(cnt,4)

        try {
            Process.start("ec\0ho").waitOutput()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"ec\0ho\" cannot contains null character.")
        }
        @Expect(cnt,5)

        try {
            Process.start("echo", "\0").waitOutput()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,6)

        try {
            Process.start("echo", "a", "\0").waitOutput()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,7)
    }

    @TestCase
    func test_commander_argument_notmatch(): Unit {
        let (exitCode, out, err) = Process.start("ls", "abcd", stdErr: Pipe).waitOutput()
        @Expect(exitCode, ret)
    }

    @TestCase
    func test_longArguement(): Unit {
        try {
            let (exitCode, out, err) = Process.start("echo", "abcd" * 1024 * 1024).waitOutput()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"Argument list too long\".")
        }
        @Expect(cnt,1)
        remove("./test.txt")
    }
}
