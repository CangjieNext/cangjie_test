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
class Test_dup {
    @TestCase
    func test_dup_01(): Unit {
        var cre = creat("textcase.txt", S_IRWXU)
        @Assert(cre != -1, true)
        var fd = `open`("textcase.txt", O_RDWR)
        @Assert(fd != -1, true)
        var fd2 = dup(fd)
        @Assert(fd2 != -1, true)
        var flag: Bool
        if (fd2 > fd) {
            flag = true
        } else {
            flag = false
        }
        close(fd)
        close(fd2)
        remove("textcase.txt")
        @Assert(flag, true)
    }

    @TestCase
    func test_dup_02(): Unit {
        var fd2 = dup(-1)
        @Assert(fd2, -1)
    }
}
