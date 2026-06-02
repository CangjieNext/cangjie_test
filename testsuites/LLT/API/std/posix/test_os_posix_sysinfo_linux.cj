/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Linux)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux)EXEC: %run %run_opt %output %run_args

import std.posix.*
import std.fs.*
import std.collection.*
import std.io.*

//测试目的：测试posix包中关于系统信息的方法，该文件包含只支持linux系统的方法
@Test
class OsPosixSysInfoLinuxTest {
    @TestCase
    func testGetos(): Unit {
        var result = getos()
        let exp_result = String.fromUtf8(File.readFrom("/proc/version"))
        println(result)
        println(exp_result)
        @Expect(result == exp_result)
    }
}
