/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Linux) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*
import std.posix.*
import std.posix.remove as os_remove
import std.process.*
import std.unittest.*
import std.unittest.testmacro.*

/**
 * Branch-oriented cases for std.posix Cangjie wrappers:
 * is* type true paths, isSock null-byte early return, ttyname success when available.
 */
@Test
public class Test_posix_branch {
    @TestCase
    func case_isChr_true(): Unit {
        @Expect(isChr("/dev/null"), true)
        @Expect(isChr("/dev/zero"), true)
        @Expect(isReg("/dev/null"), false)
    }

    @TestCase
    func case_isFIFO_true(): Unit {
        let path = "cj_posix_branch_fifo"
        os_remove(path)
        let code = execute("mkfifo", [path])
        @Expect(code, 0)
        try {
            @Expect(isFIFO(path), true)
            @Expect(isReg(path), false)
            @Expect(isDir(path), false)
        } finally {
            unlink(path)
        }
    }

    @TestCase
    func case_isBlk_true(): Unit {
        var found = false
        for (info in Directory.readFrom("/sys/block")) {
            let p = "/dev/${info.name}"
            if (isBlk(p)) {
                found = true
                @Expect(isReg(p), false)
                break
            }
        }
        if (!found) {
            let fallback = [
                "/dev/loop0",
                "/dev/loop1",
                "/dev/ram0",
                "/dev/vda",
                "/dev/sda",
                "/dev/nvme0n1"
            ]
            for (p in fallback) {
                if (isBlk(p)) {
                    found = true
                    break
                }
            }
        }
        @Expect(found, true)
    }

    @TestCase
    func case_isSock_and_isLnk_true(): Unit {
        @Expect(isSock("a\0b"), false)

        let sockCandidates = [
            "/run/dbus/system_bus_socket",
            "/var/run/dbus/system_bus_socket",
            "/run/systemd/journal/socket",
            "/run/systemd/notify"
        ]
        var sockFound = false
        for (p in sockCandidates) {
            if (isSock(p)) {
                sockFound = true
                @Expect(isReg(p), false)
                break
            }
        }

        let localSock = "cj_posix_branch.sock"
        os_remove(localSock)
        if (!sockFound) {
            let sub = launch(
                "python3",
                [
                    "-c",
                    "import socket,time;s=socket.socket(socket.AF_UNIX);s.bind('cj_posix_branch.sock');s.listen(1);time.sleep(5)"
                ]
            )
            try {
                var waited = 0
                while (waited < 50 && !isSock(localSock)) {
                    sleep(Duration.millisecond * 100)
                    waited++
                }
                @Expect(isSock(localSock), true)
                sockFound = true
            } finally {
                sub.terminate()
                unlink(localSock)
            }
        }
        @Expect(sockFound, true)

        let target = "cj_posix_branch_lnk_target"
        let linkPath = "cj_posix_branch_lnk"
        os_remove(target)
        os_remove(linkPath)
        let fd = creat(target, S_IRWXU)
        close(fd)
        try {
            @Expect(symlink(target, linkPath), 0)
            @Expect(isLnk(linkPath), true)
            @Expect(isType(linkPath, S_IFLNK), true)
        } finally {
            unlink(linkPath)
            unlink(target)
        }
    }

    @TestCase
    func case_ttyname_when_tty(): Unit {
        // Cover ttyname success path only when stdin is a real terminal.
        if (isatty(0)) {
            @Expect(!ttyname(0).isEmpty(), true)
        } else {
            @Expect(ttyname(-1).isEmpty(), true)
            @Expect(ttyname(65535).isEmpty(), true)
        }
    }

    @TestCase
    func case_checkPath_message(): Unit {
        try {
            chdir("/tmp\0")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path cannot contain null character!")
        }
    }

    @TestCase
    func case_openat64_creat_flag_null(): Unit {
        let dirFd = `open`(".", O_RDONLY)
        try {
            try {
                openat64(dirFd, "x\0y", O_RDWR | O_CREAT, S_IRWXU)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The path cannot contain null character!")
            }
        } finally {
            close(dirFd)
        }
    }
}
