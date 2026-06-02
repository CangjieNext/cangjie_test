/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC:  %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.process.*

@Test
class Test_file_read_write_01 {
    var path_string = ["test", "仓颉鸿蒙", "12345678", "#$%^&&^"]

    public override func beforeEach(): Unit {
        for (str in path_string) {
            removeIfExists(str, recursive: true)
        }
    }

    public override func afterEach(): Unit {
        for (str1 in path_string) {
            removeIfExists(str1, recursive: true)
        }
    }
    @TestCase
    func test_file_read_write_01(): Unit {
        var arr: Array<Byte> = Array<Byte>(9, repeat: 0)
        File.create("test").close()
        var file = File("test", OpenMode.Read)
        @Expect(file.read(arr), 0)
        @Expect(file.read(arr), 0)
    }

    @TestCase
    func test_file_read_write_02(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(9, repeat: 0)
        File.create("test").close()
        var file = File("test", OpenMode.Write)
        file.write(arr)
        var file1 = File("test", OpenMode.Read)
        @Expect(file1.read(arr1), 9)
        @Expect(file1.read(arr1), 1)
        @Expect(file1.read(arr1), 0)
    }

    @TestCase
    func test_file_read_write_03(): Unit {
        var arr: Array<Byte> = Array<Byte>(100, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(101, repeat: 0)
        File.create("仓颉鸿蒙").close()
        var file = File("仓颉鸿蒙", OpenMode.Write)
        file.write(arr)
        var file1 = File("仓颉鸿蒙", OpenMode.Read)
        @Expect(file1.read(arr1), 100)
        @Expect(file1.read(arr1), 0)
    }

    @TestCase
    func test_file_read_write_04(): Unit {
        var arr: Array<Byte> = Array<Byte>(100, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(101, repeat: 0)
        File.create("12345678").close()
        var file = File("12345678", OpenMode.Write)
        file.write(arr)
        var file1 = File("12345678", OpenMode.Read)
        @Expect(file1.read(arr1), 100)
        @Expect(file1.read(arr1), 0)
    }

    @TestCase
    func test_file_read_write_05(): Unit {
        var arr: Array<Byte> = Array<Byte>(100, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(101, repeat: 0)
        File.create("#$%^&&^").close()
        var file = File("#$%^&&^", OpenMode.Write)
        file.write(arr)
        var file1 = File("#$%^&&^", OpenMode.Read)
        @Expect(file1.read(arr1), 100)
        @Expect(file1.read(arr1), 0)
    }
}
