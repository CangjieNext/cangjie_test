/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %run %run_opt %output %run_utest_opt
import std.posix.*
import std.posix.remove as os_remove
import std.fs.*
import std.collection.*
import std.io.*
import std.process.*

@When[os != "macOS"]
const AT_EACCESS: Int32 = 0x200
@When[os == "macOS"]
const AT_EACCESS: Int32 = 0x10
var user = ""
//测试目的：测试posix包中关于文件操作的方法，该文件包含只支持linux系统的方法
@Test
class OsPosixFileInfoUnixTest {
    public override func beforeAll(): Unit {
        var res: ?String = Process.current.getEnv("USER")
        match (res) {
            case None => user = ""
            case Some(u) => user = u
        }
    }

    @TestCase
    func testIsType(): Unit {
        @Expect(isType("/notdirs", S_IFDIR), false)
        @Expect(isType("/notd\0irs", S_IFDIR), false)
        @Expect(isType(FileInfo(Process.current.workingDirectory).path.toString(), S_IFDIR), true)
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(isType("textcase.txt", S_IFREG), true)
        symlink("textcase.txt", "textcasenew.txt")
        @Expect(isType("textcasenew.txt", S_IFLNK), true)
        close(fd)
    }

    @TestCase
    func testIsFIFO(): Unit {
        var result: Bool = isFIFO("./myfifo")
        @Expect(result, false)
        @Expect(isFIFO("/dev\0"), false)
    }

    @TestCase
    func testIsLnk(): Unit {
        var result: Bool = isLnk("/opt/llvm-8/bin/lld-link/mylink")
        @Expect(result, false)
        @Expect(isLnk("dev\0"), false)
    }

    @TestCase
    func testIsSock(): Unit {
        var result: Bool = isSock("/dev")
        @Expect(result, false)
        @Expect(isLnk("dev\0"), false)
    }

    @TestCase
    func testFacessat(): Unit {
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(faccessat(AT_FDCWD, "textcase.txt", R_OK, AT_EACCESS), 0)
        @Expect(faccessat(Int32(-1), "textcase.txt", R_OK, AT_EACCESS), -1)
        @Expect(faccessat(AT_FDCWD, "textcase.txt", Int32(-1), AT_EACCESS), -1)
        @Expect(faccessat(AT_FDCWD, "textcaseee.txt", R_OK, AT_EACCESS), -1)
        close(fd)
    }

    @TestCase
    func testFacessatInvalidInput(): Unit {
        var errCount = 0
        try {
            var result = faccessat(Int32(1), "textcase\0.txt", R_OK, 512)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testChown(): Unit {
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(chown("textcase.txt", getuid(), getgid()), 0)
        @Expect(chown("textcaseee.txt", getuid(), getgid()), -1)
        close(fd)
    }

    @TestCase
    func testChownInvalidInput(): Unit {
        var errCount = 0
        try {
            var result = chown("textcase\0.txt", getuid(), getgid())
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testFchown(): Unit {
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(fchown(fd, getuid(), getgid()), 0)
        @Expect(fchown(-1, getuid(), getgid()), -1)
        close(fd)
    }

    @TestCase
    func testLchown(): Unit {
        var fd = creat("textcase.txt", S_IRWXU)
        @Expect(lchown("textcase.txt", getuid(), getgid()), 0)
        @Expect(lchown("textcasee.txt", getuid(), getgid()), -1)
        close(fd)
    }

    @TestCase
    func testLchownInvalidInput(): Unit {
        var errCount = 0
        try {
            var result = lchown("textcase\0.txt", getuid(), getgid())
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testFchownat(): Unit {
        @Expect(fchownat(AT_FDCWD, "textcase.txt", getuid(), getgid(), 0), 0)
        @Expect(fchownat(AT_FDCWD, "textcasee.txt", getuid(), getgid(), 0), -1)
        @Expect(fchownat(-1, "textcase.txt", getuid(), getgid(), 0), -1)
    }

    @TestCase
    func testFchownatInvalidInput(): Unit {
        var errCount = 0
        try {
            var result = fchownat(AT_FDCWD, "textcase\0.txt", getuid(), getgid(), 0)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testFchmod(): Unit {
        var fd = creat("textcase.txt", UInt32(0o777))
        @Expect(fchmod(fd, UInt32(2**32 - 1)), 0)
        @Expect(access("textcase.txt", X_OK), 0)
        @Expect(fchmod(fd, UInt32(0o644)), 0)
        @Expect(access("textcase.txt", R_OK), 0)
        @Expect(access("textcase.txt", X_OK), -1)
        @Expect(fchmod(-1, UInt32(0o644)), -1)
        close(fd)
    }

    @TestCase
    func testFchmodat(): Unit {
        @Expect(fchmodat(AT_FDCWD, "textcase.txt", UInt32(0o644), 0), 0)
        @Expect(access("textcase.txt", R_OK), 0)
        @Expect(access("textcase.txt", X_OK), -1)
        @Expect(fchmodat(AT_FDCWD, "textcaseee.txt", UInt32(0o644), 0), -1)
        @Expect(fchmodat(-1, "textcase.txt", UInt32(0o644), 0), -1)
    }

    @TestCase
    func testFchmodatInvalidInput(): Unit {
        var errCount = 0
        try {
            var result = fchmodat(AT_FDCWD, "textcase\0.txt", UInt32(644), 0)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testOpenat(): Unit {
        var fd = `open`(".", O_RDONLY)
        var fd2 = fd
        var fd3 = openat(fd, "textcase.txt", O_RDWR)
        var fd4 = openat(fd2, "textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU)
        @Expect(fd3 > 0, true)
        @Expect(fd4 > 0, true)
        @Expect(openat(fd, "textcasee.txt", O_RDWR) == -1, true)
        @Expect(openat(-1, "textcase.txt", O_RDWR | O_APPEND | O_CREAT, S_IRWXU) == -1, true)
        close(fd)
        close(fd2)
        close(fd3)
        close(fd4)
    }

    @TestCase
    func testOpenatInvalidInput(): Unit {
        var fd = `open`(".", O_RDONLY)
        try {
            var fd2 = openat(fd, "textcase\0.txt", O_RDWR)
            @Expect(false)
        } catch (e: IllegalArgumentException) {}
        close(fd)
    }

    @TestCase
    func testPwrite(): Unit {
        var buf = unsafe { LibC.mallocCString("123456") }
        var fd = `open`("textcase.txt", O_RDWR)
        var fd2 = `open`("testcase.txt", O_RDONLY)
        var fd3: Int32 = -1
        @Expect(unsafe { pwrite(fd, buf.getChars(), UIntNative(buf.size()), 0) }, 6)
        @Expect(unsafe { pwrite(fd, buf.getChars(), 0, 0) }, 0)
        @Expect(unsafe { pwrite(fd2, buf.getChars(), UIntNative(buf.size()), 0) }, -1)
        @Expect(unsafe { pwrite(fd3, buf.getChars(), UIntNative(buf.size()), 0) }, -1)
        close(fd)
        close(fd2)
        unsafe {
            LibC.free(buf)
        }
    }

    @TestCase
    func testPread(): Unit {
        var buf = unsafe { LibC.mallocCString("123456") }
        var fd = `open`("textcase.txt", O_RDWR)
        var fd2 = `open`("testcase.txt", O_WRONLY)
        @Expect(unsafe { pread(fd, buf.getChars(), UIntNative(1024), 0) }, 6)
        @Expect(unsafe { pread(fd, buf.getChars(), 0, 0) }, 0)
        @Expect(unsafe { pread(fd2, buf.getChars(), UIntNative(1024), 0) }, -1)
        close(fd)
        close(fd2)
        unsafe {
            LibC.free(buf)
        }
    }

    @TestCase
    func testLink(): Unit {
        @Expect(link("", ""), -1)
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        @Expect(link("./test.txt", "./testylink.txt"), 0)
        @Expect(isLnk("./testylink.txt"), false)
        @Expect(link("./test.txt", ""), -1)
        unlink("./testylink.txt")
        os_remove("./test.txt")
        close(fd)
    }

    @TestCase
    func testLinkInvalid(): Unit {
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        var errCount = 0
        try {
            link("./test\0.txt", "./testylink.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            link("./test.txt", "./testylink\0.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
        os_remove("./test.txt")
        close(fd)
    }

    @TestCase
    func testLinkat(): Unit {
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        var cwd = getcwd().toString()
        @Expect(linkat(AT_FDCWD, "test.txt", AT_FDCWD, "testylinkat.txt", AT_SYMLINK_FOLLOW), 0)
        @Expect(linkat(AT_FDCWD, "test2.txt", AT_FDCWD, "testylinkat2.txt", AT_SYMLINK_FOLLOW), -1)
        os_remove("test.txt")
        @Expect(isLnk("./testylinkat.txt"), false)
        @Expect(unlink("./testylinkat.txt"), 0)
        close(fd)
    }

    @TestCase
    func testLinkatInvalid(): Unit {
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        var errCount = 0
        try {
            linkat(AT_FDCWD, "test.txt\0", AT_FDCWD, "testylinkat.txt", AT_SYMLINK_FOLLOW)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            linkat(AT_FDCWD, "test.txt", AT_FDCWD, "testylinkat\0.txt", AT_SYMLINK_FOLLOW)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
        os_remove("./test.txt")
        close(fd)
    }

    @TestCase
    func testRenameat(): Unit {
        var fd = `open`("./test.txt", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR)
        var dirfd = `open`(getcwd(), O_RDONLY)
        @Expect(renameat(-1, "test.txt", -1, "testnewname.txt"), -1)
        @Expect(renameat(dirfd, "test.txt", dirfd, "testnewname.txt"), 0)
        @Expect(isReg("test.txt"), false)
        @Expect(renameat(dirfd, "test.txt", dirfd, "testnewname2.txt"), -1)
        @Expect(renameat(dirfd, "testnewname.txt", dirfd, ""), -1)
        @Expect(renameat(dirfd, "testnewname.txt", dirfd, "test.txt"), 0)
        @Expect(isReg("test.txt"), true)
        close(fd)
        close(dirfd)
    }

    @TestCase
    func testRenameatInvalidInput(): Unit {
        var errCount = 0
        try {
            renameat(0, "test\0.txt", 0, "testnewname.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            renameat(0, "test.txt", 0, "testnewname\0.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
    }

    @TestCase
    func testSymlink(): Unit {
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        @Expect(symlink("./test.txt", "./testrlinkat.txt"), 0)
        @Expect(isLnk("./testrlinkat.txt"), true)
        @Expect(symlink("./test.txt", ""), -1)
        @Expect(symlink("", ""), -1)
        unlink("./testrlinkat.txt")
        os_remove("./test.txt")
        close(fd)
    }

    @TestCase
    func testSymlinkInvalidInput(): Unit {
        var errCount = 0
        try {
            symlink("./test.txt\0", "./testrlinkat.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            symlink("./test.txt", "./testrlinkat\0.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 2)
    }

    @TestCase
    func testSymlinkat(): Unit {
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        var fddir = `open`(getcwd(), O_RDONLY)
        @Expect(symlinkat("test.txt", fddir, "testrlinkat.txt"), 0)
        @Expect(isLnk("./testrlinkat.txt"), true)
        @Expect(symlinkat("test.txt", fddir, ""), -1)
        @Expect(symlinkat("", fddir, ""), -1)
        @Expect(symlinkat("test.txt", -1, "testrlinkat.txt"), -1)
        @Expect(unlink("./testrlinkat.txt"), 0)
        os_remove("./test.txt")
        close(fd)
        close(fddir)
    }

    @TestCase
    func testSymlinkatInvalidInput(): Unit {
        var fddir = `open`(getcwd(), O_RDONLY)
        var errCount = 0
        try {
            symlinkat("test.txt\0", fddir, "testrlinkat.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            symlinkat("test.txt", fddir, "testrlinkat.txt\0")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        try {
            symlinkat("test.txt", -1, "testrlinkat.txt\0")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 3)
        close(fddir)
    }

    @TestCase
    func testUnlink(): Unit {
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        link("./test.txt", "./testylink.txt")
        symlink("./test.txt", "./testrlink.txt")
        @Expect(unlink("testylink.txt"), 0)
        @Expect(unlink("testrlink.txt"), 0)
        @Expect(unlink(""), -1)
        os_remove("./test.txt")
        close(fd)
    }

    @TestCase
    func testUnlinkInvalidInput(): Unit {
        var errCount = 0
        try {
            unlink("./test\0.txt")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testUnlinkat(): Unit {
        var fd = `open`("./test.txt", O_RDWR | O_CREAT, 448)
        var dirfd = `open`(getcwd(), O_RDONLY)
        link("./test.txt", "./testylink.txt")
        symlink("./test.txt", "./testrlinkat.txt")
        @Expect(unlinkat(-1, "testylink.txt", 0), -1)
        @Expect(unlinkat(dirfd, "testylink.txt", 0), 0)
        @Expect(unlinkat(dirfd, "testrlinkat.txt", 0), 0)
        @Expect(unlinkat(dirfd, "", 0), -1)
        close(fd)
        close(dirfd)
        os_remove("./test.txt")
    }

    @TestCase
    func testUnlinkatInvalidInput(): Unit {
        var errCount = 0
        try {
            unlinkat(-1, "testylink\0.txt", 0)
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }
}
