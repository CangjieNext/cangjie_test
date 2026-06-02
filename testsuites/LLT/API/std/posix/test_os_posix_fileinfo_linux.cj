/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Linux) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %run %run_opt %output %run_utest_opt
import std.process.*
import std.posix.*
import std.fs.*
import std.collection.*
import std.io.*

var user = ""
//测试目的：测试posix包中关于文件操作的方法，该文件包含只支持linux系统的方法
@Test
class OsPosixFileInfoLinuxTest {
    public override func beforeAll(): Unit {
        var res: ?String = Process.current.getEnv("USER")
        match (res) {
            case None => user = ""
            case Some(u) => user = u
        }
    }

    @TestCase
    func testOpen64(): Unit {
        var fd = open64("textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        @Expect(fd > 0, true)
        close(fd)
        chmod("textcase.txt", UInt32(0o644))
        fd = open64("textcase.txt", O_RDWR)
        @Expect(fd > 0, true)
        close(fd)
        @Expect(open64("textcaseee.txt", O_RDWR) == -1, true)
        @Expect(open64("", O_RDWR | O_APPEND | O_CREAT, S_IRWXU) == -1, true)
    }

    @TestCase
    func testOpen64InvalidInput(): Unit {
        var errCount = 0
        try {
            var fd = open64("textcase\0.txt", O_RDWR)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            var fd = open64("textcase\0.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
    }

    @TestCase
    func testOpenat64(): Unit {
        var fd = `open`(".", O_RDONLY)
        var fd2 = fd
        var fd3 = openat64(fd, "textcase.txt", O_RDWR)
        var fd4 = openat64(fd2, "textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        @Expect(fd3 > 0, true)
        @Expect(fd4 > 0, true)
        @Expect(openat64(fd, "textcasee.txt", O_RDWR) == -1, true)
        @Expect(openat64(-1, "textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU) == -1, true)
        close(fd)
        close(fd2)
        close(fd3)
        close(fd4)
    }

    @TestCase
    func testOpenat64InvalidInput(): Unit {
        var fd = `open`(".", O_RDONLY)
        try {
            var fd2 = openat64(fd, "textcase\0.txt", O_RDWR)
            @Expect(false)
        } catch (e: IllegalArgumentException) {}
        close(fd)
    }
}
