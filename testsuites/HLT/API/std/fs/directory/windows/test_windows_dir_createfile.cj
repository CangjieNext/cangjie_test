/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Dir_CreateFile {
    @TestCase
    func test_createfile(): Unit {
        File.create("test_temp").close()
        @Expect(exists("test_temp"), true)
        remove("test_temp")
    }

    @TestCase
    func test_createfile_illegal(): Unit {
        var sum = 0
        try {
            File.create("test\0")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("contains null character"))
            sum += 1
        }
    }

    @TestCase
    func test_createfile_fs_exception(): Unit {
        var sum = 0
        File.create("test_temp001")
        @Assert(exists("test_temp001"), true)
        try {
            File.create("test_temp001")
        } catch (e: FSException) {
            @Expect(e.message, "The file `test_temp001` is already exists.")
            sum += 1
        }
        @Expect(sum, 1)
        remove("test_temp001")
    }
}
