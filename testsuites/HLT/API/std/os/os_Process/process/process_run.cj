/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// (not Windows) ASSERT: scan process_run.cj
import std.fs.{File, OpenMode}
import std.posix.*
import std.process.*
import std.time.*
import std.sync.*

@Test
class Test_run {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_single_commander(): Unit {
        Process.run("pwd")
    }

    @TestCase
    func test_commander_and_option(): Unit {
        Process.run("ls", "-a")
    }

    @TestCase
    func test_commander_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.run("mkdir", "test")
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_commander_with_option_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.run("mkdir", "-p", "test")
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_invalid_commander1(): Unit {
        try {
            Process.run("abc")
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander2(): Unit {
        try {
            Process.run("")
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"No such file or directory\".")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander3(): Unit {
        try {
            Process.run("\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander4(): Unit {
        try {
            Process.run("echo\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"echo\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander5(): Unit {
        try {
            Process.run("ec\0ho")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"ec\0ho\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander6(): Unit {
        try {
            Process.run("echo", "\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander7(): Unit {
        try {
            Process.run("echo", "a", "\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_commander_argument_notmatch(): Unit {
        let sub = Process.run("ls", "abcd", stdErr: Pipe)
        var flag = false
        if (sub != 0) {
            flag = true
        }
        @Expect(flag)
    }

    @TestCase
    func test_longArguement(): Unit {
        creat("./test.txt", S_IRWXU)
        let file = File("./test.txt", ReadWrite)
        try {
            let sub = Process.run("echo", "abcd" * 1024 * 1024, stdOut: FromFile(file))
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Created process failed, errMessage: \"Argument list too long\".")
        }
        @Expect(cnt,1)
        remove("./test.txt")
    }

    @TestCase
    func test_zero(): Unit {
        let res = Process.run("sleep", "1", timeout: Duration.Zero)
        @Expect(res, 0)
    }

    @TestCase
    func test_max(): Unit {
        let res = Process.run("sleep", "1", timeout: Duration.Max)
        @Expect(res, 0)
    }

    @TestCase
    func test_min(): Unit {
        let res = Process.run("sleep", "1", timeout: Duration.Min)
        @Expect(res, 0)
    }

    @TestCase
    func test_negative(): Unit {
        let res = Process.run("sleep", "1", timeout: Duration.nanosecond * -1)
        @Expect(res, 0)
    }

    @TestCase
    func test_none(): Unit {
        let res = Process.run("sleep", "1", timeout: None)
        @Expect(res, 0)
    }

    @TestCase
    func test_sleep_2(): Unit {
        let res1 = Process.run("sleep", "2", timeout: Duration.second * 3)
        @Expect(res1, 0)

        try {
            let res2 = Process.run("sleep", "5", timeout: Duration.second)
        } catch (e: TimeoutException) {
            cnt++
        }
        @Expect(cnt, 1)
    }
}
