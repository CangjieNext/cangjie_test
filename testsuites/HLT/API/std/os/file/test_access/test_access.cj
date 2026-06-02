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
class Test_access {
    public override func beforeAll(): Unit {
        user = Process.current.getEnv("USER")
    }

    @TestCase
    func test_access_01(): Unit {
        var cre = creat("file.txt", S_IRUSR)
        @Assert(cre != -1, true)
        let res = access("file.txt", R_OK)
        let res1 = access("file.txt", W_OK)
        remove("file.txt")
        @Expect(res, 0)
        match (user) {
            case Some("root") => @Expect(res1, 0)
            case _ => @Expect(res1, -1)
        }
    }

    @TestCase
    func test_access_02(): Unit {
        var cre = creat("file.txt", S_IRUSR)
        @Assert(cre != -1, true)
        let res = access("file.txt", W_OK)
        remove("file.txt")
        match (user) {
            case Some("root") => @Expect(res, 0)
            case _ => @Expect(res, -1)
        }
    }

    @TestCase
    func test_access_03(): Unit {
        var cre = creat("file.txt", S_IWUSR)
        @Assert(cre != -1, true)
        let res = access("file.txt", W_OK)
        let res1 = access("file.txt", R_OK)
        remove("file.txt")
        @Expect(res, 0)
        match (user) {
            case Some("root") => @Expect(res1, 0)
            case _ => @Expect(res1, -1)
        }
    }

    @TestCase
    func test_access_04(): Unit {
        var cre = creat("file.txt", S_IWUSR)
        @Assert(cre != -1, true)
        let res = access("file.txt", R_OK)
        remove("file.txt")
        match (user) {
            case Some("root") => @Expect(res, 0)
            case _ => @Expect(res, -1)
        }
    }

    @TestCase
    func test_access_05(): Unit {
        var cre = creat("file.txt", S_IXUSR)
        @Assert(cre != -1, true)
        let res = access("file.txt", X_OK)
        let res1 = access("file.txt", R_OK)
        remove("file.txt")
        @Expect(res, 0)
        match (user) {
            case Some("root") => @Expect(res1, 0)
            case _ => @Expect(res1, -1)
        }
    }

    @TestCase
    func test_access_06(): Unit {
        var cre = creat("file.txt", S_IXUSR)
        @Assert(cre != -1, true)
        let res = access("file.txt", R_OK)
        remove("file.txt")
        match (user) {
            case Some("root") => @Expect(res, 0)
            case _ => @Expect(res, -1)
        }
    }

    @TestCase
    func test_access_07(): Unit {
        var count = 0
        try {
            let res = access("\0", R_OK)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Expect(count, 1)
    }
}
