/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) ASSERT: scan process_start.cj
import std.fs.*
import std.posix.*
import std.process.*
import std.time.*
import std.sync.*

var cnt = 0

@Test
class Test_start {
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_single_commander(): Unit {
        Process.start("pwd")
    }

    @TestCase
    func test_commander_and_option(): Unit {
        Process.start("ls", "-a")
    }

    @TestCase
    func test_commander_and_argument(): Unit {
        @Expect(!isDir("./test"))
        Process.start("mkdir", "test")
        sleep(Duration.millisecond * 100)
        @Expect(isDir("./test"))
        remove("./test")
    }

    @TestCase
    func test_invalid_commander1(): Unit {
        try {
            Process.start("abc")
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message.contains("Created process failed, errMessage: \"The system cannot find the file specified."))
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander2(): Unit {
        try {
            Process.start("")
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message.contains("Created process failed, errMessage: \"The parameter is incorrect."))
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander3(): Unit {
        try {
            Process.start("\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander4(): Unit {
        try {
            Process.start("echo\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"echo\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander5(): Unit {
        try {
            Process.start("ec\0ho")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Command \"ec\0ho\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander6(): Unit {
        try {
            Process.start("echo", "\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_invalid_commander7(): Unit {
        try {
            Process.start("echo", "a", "\0")
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
        }
        @Expect(cnt,1)
    }

    @TestCase
    func test_commander_argument_notmatch(): Unit {
        let sub = Process.start("ls", "abcd", stdErr: Pipe)
        var buffer = Array<Byte>(50, repeat: 0)
        sleep(Duration.second)
        let s = sub.stdErr.read(buffer)
        sub.wait()
        @Expect(String.fromUtf8(buffer), "ls: cannot access 'abcd': No such file or director")
    }

    @TestCase
    func test_longArguement(): Unit {
        creat("./test.txt", S_IRWXU)
        let file = File("./test.txt", ReadWrite)
        try {
            let sub = Process.start("echo", "abcd" * 1024 * 1024, stdOut: FromFile(file))
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message.contains("Created process failed, errMessage: \"The filename or extension is too long."))
        }
        @Expect(cnt,1)
        remove("./test.txt")
    }
}
