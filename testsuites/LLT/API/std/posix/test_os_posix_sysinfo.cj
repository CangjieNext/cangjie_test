/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.posix.*
import std.fs.*
import std.collection.*
import std.io.*

@When[os == "Windows"]
var ChangeToPath = "C:\\"
@When[os != "Windows"]
var ChangeToPath = "/"

//测试目的：测试posix包中关于系统信息的方法，该文件包含支持windows系统的方法
@Test
class OsPosixSysInfoWindowsTest {
    @TestCase
    func testChdir(): Unit {
        var path: String = getcwd()
        var result = chdir(ChangeToPath)
        @Expect(result, 0)
        var path2: String = getcwd()
        @Expect(path2, ChangeToPath)
    }

    @TestCase
    func testChdirInvalidInput(): Unit {
        var errCount = 0
        try {
            chdir("/\0")
        } catch (e: IllegalArgumentException) {
            errCount++
        }
        @Expect(errCount, 1)
    }

    @TestCase
    func testGetcwd(): Unit {
        chdir(ChangeToPath)
        var path: String = getcwd()
        @Expect(path, ChangeToPath)
    }

    @TestCase
    func testGetpid(): Unit {
        var result: Int32 = getpid()
        @Expect(result >= 0, true)
    }
}
