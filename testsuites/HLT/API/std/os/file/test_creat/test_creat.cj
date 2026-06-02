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
class Test_creat {
    @TestCase
    func test_creat_01(): Unit {
        var res: Bool
        let res1 = creat("test_open.txt", S_IRWXU)
        @Assert(res1 != -1, true)
        let res2 = isReg("test_open.txt")
        @Expect(res2, true)
        if ((res1 > 1) && res2) {
            res = true
        } else {
            res = false
        }
        close(res1)
        remove("test_open.txt")
        @Assert(res, true)
    }

    @TestCase
    func test_creat_02(): Unit {
        var count = 0
        try {
            let fd = creat("\0", S_IRWXU)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Assert(count, 1)
    }
}
