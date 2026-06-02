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

import std.fs.*
import std.process.*

@Test
class Test_fs_filedescriptor_filehandle_01 {
    @TestCase
    func test_fs_filedescriptor_filehandle_01(): Unit {
        File.create("test")
        var file = File("test", OpenMode.Read)
        @Expect(file.fileDescriptor.fileHandle > 0 , true)
        remove("test")
    }

    @TestCase
    func test_fs_filedescriptor_filehandle_02(): Unit {
        File.create("仓颉test")
        var file = File("仓颉test", OpenMode.Read)
        @Expect(file.fileDescriptor.fileHandle > 0 , true)
        remove("仓颉test")
    }

    @TestCase
    func test_fs_filedescriptor_filehandle_03(): Unit {
        File.create("$%%&$^&(&^^&%)")
        var file = File("$%%&$^&(&^^&%)", OpenMode.Read)
        @Expect(file.fileDescriptor.fileHandle > 0 , true)
        remove("$%%&$^&(&^^&%)")
    }

    @TestCase
    func test_fs_filedescriptor_filehandle_04(): Unit {
        File.create("1234567890")
        var file = File("1234567890", OpenMode.Read)
        @Expect(file.fileDescriptor.fileHandle > 0 , true)
        remove("1234567890")
    }
}
