/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Linux) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %run %run_opt %output %run_utest_opt

import std.math.*
import std.process.*
import std.posix.*
import std.fs.*
import std.collection.*
import std.io.*

var user = ""
//测试目的：测试posix包中关于进程操作的方法
@Test
class OsPosixProcessInfoTest {
    public override func beforeAll(): Unit {
        var res: ?String = Process.current.getEnv("USER")
        match (res) {
            case None => user = ""
            case Some(u) => user = u
        }
    }

    @TestCase
    func testNice(): Unit {
        @Expect(nice(20), 19)
        @Expect(nice(1), 19)
        @Expect(nice(0), 19)
        match (user) {
            case "root" => @Expect(nice(-200), -20)
            case _ => @Expect(nice(-200), -1)
        }
    }

    @TestCase
    func testKill(): Unit {
        @Expect(kill(getpid(), SIGCHLD), 0)
        @Expect(kill(0, SIGCHLD), 0)
        @Expect(kill(-1, SIGCHLD), 0)
        @Expect(kill(-getpid(), SIGCHLD), 0)
        @Expect(kill(getpid(), -1), -1)
    }

    @TestCase
    func testKillpg(): Unit {
        @Expect(killpg(getpgid(0), SIGCHLD), 0)
        @Expect(killpg(0, SIGCHLD), 0)
        /*
         * Posix: If pgrp is greater than 1, killpg(pgrp, sig) shall be equivalent to kill(-pgrp, sig).
         * If pgrp is less than or equal to 1, the behavior of killpg() is undefined.
         * killpg(-getpgid(0), SIGCHLD) will return 0(MacOS) and -1(Linux)
         */
        @Expect(killpg(Int32.Max, SIGCHLD), -1)
        @Expect(killpg(getpgid(0), -1), -1)
    }

    @TestCase
    func testTtyName(): Unit {
        var fd = `open`("/dev/tty", O_RDWR)
        @Expect(ttyname(fd).isEmpty(), true)
        @Expect(ttyname(0).isEmpty(), true)
        @Expect(ttyname(65535).isEmpty(), true)
        @Expect(ttyname(-1).isEmpty(), true)
        close(fd)
    }

    @TestCase
    func testIsatty(): Unit {
        var fd = `open`("/dev/tty", O_RDWR)
        @Expect(isatty(fd), false)
        @Expect(isatty(-1), false)
        @Expect(isatty(0), false)
        @Expect(isatty(65535), false)
        close(fd)
    }
}
