/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.posix.*

@Test
class Test_isReg {
    @TestCase
    func test_isReg_01(): Unit {
        var cre = creat("textcase.txt", S_IRWXU)
        @Assert(cre != -1, true)
        var res = isReg("textcase.txt")
        remove("textcase.txt")
        @Assert(res, true)
    }

    @TestCase
    func test_isReg_02(): Unit {
        var res = isReg("/")
        @Assert(res, false)
    }

    @TestCase
    func test_isReg_03(): Unit {
        var res = isReg("\0")
        @Assert(res, false)
    }
}
