/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not OHOS and not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// (not Windows) ASSERT: scan subprocess_wait.cj
import std.fs.{File, OpenMode}
import std.posix.*
import std.process.*
import std.time.*
import std.sync.*

@When[os == "macOS"]
let ret = 1
@When[os != "macOS"]
let ret = 2

@Test
class Test_start {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_single_commander(): Unit {
        Process.start("pwd").wait()
    }

    @TestCase
    func test_commander_and_option(): Unit {
        Process.start("ls", "-a").wait(timeout: Duration.Zero)
    }

    @TestCase
    func test_commander_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.start("mkdir", "test").wait(timeout: Duration.nanosecond * -1)
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_commander_with_option_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.start("mkdir", "-p", "test").wait(timeout: Duration.Min)
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_invalid_commander(): Unit {
        try {
            Process.start("abc").wait()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,1)

        try {
            Process.start("").wait()
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,2)

        try {
            Process.start("\0").wait()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"\0\" cannot contains null character.")
        }
        @Expect(cnt,3)

        try {
            Process.start("echo\0").wait()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"echo\0\" cannot contains null character.")
        }
        @Expect(cnt,4)

        try {
            Process.start("ec\0ho").wait()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"ec\0ho\" cannot contains null character.")
        }
        @Expect(cnt,5)

        try {
            Process.start("echo", "\0").wait()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,6)

        try {
            Process.start("echo", "a", "\0").wait()
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,7)
    }

    @TestCase
    func test_commander_argument_notmatch(): Unit {
        let sub = Process.start("ls", "abcd", stdErr: Pipe).wait(timeout: Duration.Max)
        @Expect(sub, ret)
    }

    @TestCase
    func test_longArguement(): Unit {
        creat("./test.txt", S_IRWXU)
        let file = File("./test.txt", ReadWrite)
        try {
            let sub = Process.start("echo", "abcd" * 1024 * 1024, stdOut: FromFile(file))
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"Argument list too long\".")
        }
        @Expect(cnt,1)
        remove("./test.txt")
    }

    @TestCase
    func test_2_second(): Unit {
        try {
            let sub1 = Process.start("sleep", "2").wait(timeout: Duration.second)
            @Expect(false)
        } catch (e: TimeoutException) {
        }

        let sub2 = Process.start("sleep", "2").wait(timeout: Duration.second * 3)
        @Expect(sub2, 0)
    }
}
