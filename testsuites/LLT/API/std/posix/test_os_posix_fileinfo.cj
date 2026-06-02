/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (LINUX) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (LINUX) EXEC: %run %run_opt %output %run_utest_opt
internal import std.posix.*
internal import std.fs.*
internal import std.collection.*
internal import std.io.*
internal import std.process.*

@When[os == "Windows"]
let testWin: Bool = true
@When[os != "Windows"]
let testWin: Bool = false
@When[os == "macOS"]
let testDarwin = true
@When[os != "macOS"]
let testDarwin = false
var user = ""
//测试目的：测试posix包中关于文件操作的方法，该文件包含支持windows系统的方法
@Test
class OsPosixFileInfoWindowsTest {
    public override func beforeAll(): Unit {
        var res: ?String = Process.current.getEnv("USER")
        match (res) {
            case None => user = ""
            case Some(u) => user = u
        }
    }

    @TestCase
    func testIsReg(): Unit {
        @Expect(isReg("/dev"), false)
        @Expect(isReg("/de\0v"), false)
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(isReg("textcase.txt"), true)
        close(fd)
    }

    @TestCase
    func testIsDir(): Unit {
        @Expect(isDir(FileInfo(Process.current.workingDirectory).path.toString()), true)
        @Expect(isDir("/notdirs"), false)
        @Expect(isDir("/notd\0irs"), false)
    }

    @TestCase
    func testIsChr(): Unit {
        var result: Bool = isChr("/dev/myttyz")
        @Expect(result, false)
        @Expect(isChr("/dev\0"), false)
    }

    @TestCase
    func testIsBlk(): Unit {
        var result: Bool = isBlk("/dev/myBlk")
        @Expect(result, false)
        @Expect(isBlk("/dev\0"), false)
    }

    @TestCase
    func testAccess(): Unit {
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(access("textcase.txt", R_OK), 0)
        @Expect(access("textcase.txt", W_OK), 0)
        match (testWin) {
            case true => @Expect(access("textcase.txt", X_OK), 0)
            case false => match (user) {
                case "root" => @Expect(access("textcase.txt", X_OK), 0)
                case _ => @Expect(access("textcase.txt", X_OK), -1)
            }
        }
        @Expect(access("textcase.txt", F_OK), 0)
        // AT_EMPTY_PATH is not supported on macOS
        if (!testDarwin) {
            @Expect(access("textcase.txt", 0x1000), -1)
        }
        @Expect(access("textcaseee.txt", F_OK), -1)
        close(fd)
    }

    @TestCase
    func testAccessInvalidInput(): Unit {
        var errCount = 0
        try {
            var result = access("textcase\0.txt", R_OK)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testUmask(): Unit {
        match (testWin) {
            // default umask: win -- 0  linux -- 0o022
            case true =>
                var result = umask(UInt32(S_IWUSR))
                @Expect(result, 0)
                result = umask(UInt32(S_IRUSR))
                @Expect(result, S_IWUSR)
                result = umask(UInt32(S_IRUSR))
                @Expect(result, S_IRUSR)
            case false =>
                var result = umask(UInt32(S_IRWXU))
                @Expect(result, 18)
                result = umask(UInt32(S_IRWXU))
                @Expect(result, S_IRWXU)
        }
    }

    @TestCase
    func testChmod(): Unit {
        @Expect(chmod("textcase.txt", UInt32(2**32 - 1)), 0)
        @Expect(access("textcase.txt", X_OK), 0)
        @Expect(chmod("textcase.txt", UInt32(0o644)), 0)
        @Expect(access("textcase.txt", R_OK), 0)
        match (testWin) {
            case true => @Expect(access("textcase.txt", X_OK), 0)
            case false => @Expect(access("textcase.txt", X_OK), -1)
        }
        @Expect(chmod("textcaseee.txt", UInt32(0o644)), -1)
    }

    @TestCase
    func testChmodInvalidInput(): Unit {
        var errCount = 0
        try {
            var result = chmod("textcase\0.txt", UInt32(644))
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testCreatandClose(): Unit {
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(fd > 0, true)
        @Expect(close(fd), 0)
        fd = creat("", S_IRWXU)
        @Expect(fd == -1, true)
        @Expect(close(fd), -1)
        fd = (creat("textc/ase.txt", S_IRWXU))
        @Expect(fd == -1, true)
    }

    @TestCase
    func testCreatInvalidInput(): Unit {
        var errCount = 0
        try {
            var fd = creat("testcase\0.txt", S_IRWXU)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testOpen(): Unit {
        var fd = `open`("textcase.txt", O_RDWR)
        @Expect(fd >= 0, true)
        close(fd)
        @Expect(`open`("textcaseee.txt", O_RDWR) == -1, true)
        fd = `open`("textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        @Expect(fd >= 0, true)
        close(fd)
        @Expect(`open`("", O_RDWR | O_APPEND | O_CREAT, S_IRWXU) == -1, true)
    }

    @TestCase
    func testOpenInvalidInput(): Unit {
        var errCount = 0
        try {
            var fd = open("textcase\0.txt", O_RDWR)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            var fd = open("textcase\0.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
    }

    @TestCase
    func testWrite(): Unit {
        var buf = unsafe { LibC.mallocCString("123456") }
        var fd = `open`("textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        var fd2 = `open`("testcase.txt", O_RDONLY)
        var fd3: Int32 = -1
        @Expect(unsafe { write(fd, buf.getChars(), UIntNative(buf.size())) }, 6)
        @Expect(unsafe { write(fd, buf.getChars(), 0) }, 0)
        @Expect(unsafe { write(fd2, buf.getChars(), UIntNative(buf.size())) }, -1)
        @Expect(unsafe { write(fd3, buf.getChars(), UIntNative(buf.size())) }, -1)
        close(fd)
        close(fd2)
        unsafe {
            LibC.free(buf)
        }
    }

    @TestCase
    func testRead(): Unit {
        var buf = unsafe { LibC.mallocCString("123456") }
        var fd = `open`("textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        var fd2 = `open`("testcase.txt", O_WRONLY)
        @Expect(unsafe { read(fd, buf.getChars(), UIntNative(1024)) }, 6)
        @Expect(unsafe { read(fd, buf.getChars(), 0) }, 0)
        @Expect(unsafe { read(fd2, buf.getChars(), UIntNative(1024)) }, -1)
        close(fd)
        close(fd2)
        unsafe {
            LibC.free(buf)
        }
    }

    @TestCase
    func testLseek(): Unit {
        var fd = `open`("textcase.txt", O_RDWR)
        var fd2: Int32 = -1
        @Expect(lseek(fd, 0, SEEK_END), 6)
        @Expect(lseek(fd2, 0, SEEK_END), -1)
        close(fd)
        close(fd2)
    }

    @TestCase
    func testDup(): Unit {
        var fd = `open`("textcase.txt", O_RDWR)
        var fd2 = dup(fd)
        var fd3: Int32 = -1
        @Expect(fd2 > fd, true)
        @Expect(dup(fd3), -1)
        close(fd)
        close(fd2)
    }

    @TestCase
    func testDup2(): Unit {
        var fd = `open`("textcase.txt", O_RDWR)
        var newFd = `open`("./test.txt", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR)
        match (testWin) {
            case true =>
                var res = dup2(fd, newFd)
                @Expect(res, 0)
            case false =>
                var fd2 = dup2(fd, newFd)
                @Expect(fd2, newFd)
                close(fd2)
        }
        @Expect(dup2(Int32(-1), newFd), -1)
        @Expect(dup2(fd, Int32(-1)), -1)
        close(fd)
        close(newFd)
    }

    @TestCase
    func testRemove(): Unit {
        var fd = `open`("./test.txt", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR)
        @Expect(isReg("./test.txt"), true)
        close(fd)
        @Expect(remove("./test.txt"), 0)
        @Expect(remove(""), -1)
    }

    @TestCase
    func testRemoveInvalid(): Unit {
        var errCount = 0
        try {
            remove("./test\0.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testRename(): Unit {
        var fd = `open`("./test.txt", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR)
        close(fd)
        @Expect(rename("./test.txt", "./testnewname.txt"), 0)
        @Expect(rename("./testnewname.txt", ""), -1)
        @Expect(rename("./test.txt", "./testnewname2.txt"), -1)
        @Expect(isReg("./testnewname.txt"), true)
        remove("./testnewname.txt")
    }

    @TestCase
    func testRenameInvalid(): Unit {
        var errCount = 0
        var fd = `open`("./test.txt", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR)
        try {
            rename("./test.txt", "./testnewname\0.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        close(fd)
        try {
            rename("./test\0.txt", "./testnewname.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
    }
}
