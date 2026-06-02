/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC: export USER=`whoami` && %run %run_opt %output %run_utest_opt %run_args
import std.unittest.*
import std.unittest.testmacro.*
import std.process.*
import std.posix.*

var user = Option<String>.None

@Test
class Test_fchmodat {
    @TestCase
    func test_fchmodat_01(): Unit {
        user = Process.current.getEnv("USER")
        var cre = creat("test.txt", S_IRWXU)
        @Assert(cre != -1, true)
        let fd = `open`("./", O_RDONLY)
        @Assert(fd != -1, true)
        let res = fchmodat(fd, "test.txt", 256, 0)
        let res1 = access("test.txt", W_OK)
        let res2 = access("test.txt", R_OK)
        @Expect(res, 0)
        @Expect(res2, 0)
        match (user) {
            case Some("root") => @Expect(res1, 0)
            case _ => @Expect(res1, -1)
        }
    }

    @TestCase
    func test_fchmodat_02(): Unit {
        let res = fchmodat(900, "test.txt", 0, 0)
        @Expect(res, -1)
    }

    @TestCase
    func test_fchmodat_03(): Unit {
        var count = 0
        try {
            let res = fchmodat(900, "\0", 0, 0)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 1)
    }
}
