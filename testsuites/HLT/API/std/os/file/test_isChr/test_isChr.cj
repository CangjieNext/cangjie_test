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
class Test_isChr {
    @TestCase
    func test_isChr_01(): Unit {
        var res = isChr("/")
        @Assert(res, false)
    }

    @TestCase
    func test_isChr_02(): Unit {
        var cre = creat("test.chr", S_IRWXU)
        @Assert(cre != -1, true)
        var res = isChr("test.chr")
        remove("test.chr")
        @Assert(res, false)
    }
}
