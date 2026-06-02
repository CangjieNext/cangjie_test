/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix)EXEC: %run %run_opt %output %run_args

import std.process.*
import std.posix.*
import std.fs.*
import std.collection.*
import std.io.*

var user = ""
//测试目的：测试posix包中关于系统信息的方法
@Test
class OsPosixSysInfoUnixTest {
    public override func beforeAll(): Unit {
        var res: ?String = Process.current.getEnv("USER")
        match (res) {
            case None => user = ""
            case Some(u) => user = u
        }
    }

    @TestCase
    func testhostnameValid(): Unit {
        match (user) {
            case "root" =>
                var res = sethostname("test")
                @Expect(res, 0)
                var hname = gethostname()
                @Expect(hname, "test")
                var res2 = sethostname("")
                @Expect(res2, 0)
                var hname2 = gethostname()
                @Expect(hname2, "")
            case _ =>
                var res = sethostname("test")
                @Expect(res, -1)
                var hname = gethostname()
                @Expect(hname == "test", false)
        }
    }

    @TestCase
    func testhostnameInvalid(): Unit {
        var errCount = 0
        try {
            var res = sethostname("test\0")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testGetlogin(): Unit {
        var loginName = getlogin()
        if (!loginName.isEmpty() && user.isEmpty()) {
            @Expect(user, loginName)
        }
    }

    @TestCase
    func testFchdir(): Unit {
        var fd = `open`("/", O_RDONLY)
        var path: String = getcwd()
        @Expect(!path.isEmpty(), true)
        var result = fchdir(fd)
        @Expect(result, 0)
        var path2: String = getcwd()
        @Expect(path2, "/")
    }

    @TestCase
    func testGetgid(): Unit {
        var result: UInt32 = getgid()
        @Expect(result >= 0, true)
    }

    @TestCase
    func testSetgid(): Unit {
        @Expect(setgid(getgid()) > -1, true)
    }

    @TestCase
    func testGetuid(): Unit {
        var result: UInt32 = getuid()
        @Expect(result >= 0, true)
    }

    @TestCase
    func testSetuid(): Unit {
        @Expect(setuid(getuid()) > -1, true)
    }

    @TestCase
    func testGetpgid(): Unit {
        var result: Int32 = getpgid(0)
        @Expect(result >= 0, true)
        var result2: Int32 = getpgid(-1)
        @Expect(result2, -1)
    }

    @TestCase
    func testGetgroups(): Unit {
        unsafe {
            var cp: CPointer<UInt32> = CPointer<UInt32>()
            var getg = getgroups(0, cp)
            var s: String = ""
            for (i in 0..getg * 4) {
                s = s + "\0"
            }
            @Expect(getg > 0, true)
            var arr2: CString = unsafe { LibC.mallocCString(s) }
            var a2: CPointer<UInt8> = arr2.getChars()
            var cp2: CPointer<UInt32> = CPointer<UInt32>(a2)
            var getg2 = getgroups(getg, cp2)
            var local: UInt32 = 0
            for (temp in 0..getg) {
                local = cp2.read(Int64(temp))
            }
            unsafe { LibC.free(arr2) }
            @Expect(getg2 > 0, true)

            var getg3 = getgroups(-1, CPointer<UInt32>())
            @Expect(getg3, -1)

            var getg4 = getgroups(getg, CPointer<UInt32>())
            @Expect(getg4, -1)
        }
    }

    @TestCase
    func testGetppid(): Unit {
        var result: Int32 = getppid()
        @Expect(result >= 0, true)
    }

    @TestCase
    func testGetpgrp(): Unit {
        var result: Int32 = getpgrp()
        @Expect(result > 0, true)
    }

    @TestCase
    func testSetpgrp(): Unit {
        var result: Int32 = setpgrp()
        @Expect(result >= -1, true)
    }

    @TestCase
    func testSetpgid(): Unit {
        var result: Int32 = setpgid(0, 0)
        @Expect(result >= -1, true)
        var result2: Int32 = setpgid(Int32(-1), getppid())
        @Expect(result2, -1)
        var result3: Int32 = setpgid(0, -1)
        @Expect(result3, -1)
    }
}
