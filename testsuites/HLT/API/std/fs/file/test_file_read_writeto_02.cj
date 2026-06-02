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
class Test_file_read_writeto_02 {
    var path_string = ["cangjietest", "test", "仓颉鸿蒙", "12345678", "#$%^&&^"]

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
    func test_file_read_writeto_01(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(9, repeat: 0)
        @Expect(exists("cangjietest"), false)
        File.writeTo("cangjietest", arr)
        @Expect(exists("cangjietest"), true)
        var file = File("cangjietest", OpenMode.Read)
        @Expect(file.read(arr1), 9)
        @Expect(arr1, [1u8,2u8,3u8,4u8,5u8,6u8,7u8,8u8,9u8])
        @Expect(file.read(arr1), 1)
        @Expect(arr1, [10u8,2u8,3u8,4u8,5u8,6u8,7u8,8u8,9u8])
    }

    @TestCase
    func test_file_read_writeto_02(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(9, repeat: 0)
        File.create("test").close()
        @Expect(exists("test"), true)
        File.writeTo("test", arr)
        var file = File("test", OpenMode.Read)
        @Expect(file.read(arr1), 9)
        @Expect(arr1, [1u8,2u8,3u8,4u8,5u8,6u8,7u8,8u8,9u8])
        @Expect(file.read(arr1), 1)
        @Expect(arr1, [10u8,2u8,3u8,4u8,5u8,6u8,7u8,8u8,9u8])
    }

    @TestCase
    func test_file_read_writeto_03(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 2)})
        File.create("仓颉鸿蒙").close()
        @Expect(exists("仓颉鸿蒙"), true)
        var file = File("仓颉鸿蒙", OpenMode.Write)
        file.write(arr)
        var file1 = File("仓颉鸿蒙", OpenMode.Read)
        file1.read(arr1)
        @Expect(arr1, arr)
        File.writeTo("仓颉鸿蒙", arr2)
        var file2 = File("仓颉鸿蒙", OpenMode.Read)
        @Expect(file2.read(arr1), 10)
        @Expect(arr1, arr2)
        @Expect(file2.read(arr1), 0)
    }

    @TestCase
    func test_file_read_writeto_04(): Unit {
        var arr: Array<Byte> = Array<Byte>()
        var arr1: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(9, {i => UInt8(i + 1)})
        @Expect(exists("12345678"), false)
        File.create("12345678").close()
        @Expect(exists("12345678"), true)
        File.writeTo("12345678", arr)
        var file = File("12345678", OpenMode.Read)
        @Expect(file.read(arr1), 0)
        @Expect(arr1[0] , 0)
        File.writeTo("12345678", arr2)
        var file1 = File("12345678", OpenMode.Read)
        @Expect(file1.read(arr1), 9)
        @Expect(arr1, [1u8,2u8,3u8,4u8,5u8,6u8,7u8,8u8,9u8,0u8])
        @Expect(file1.read(arr1), 0)
    }

    @TestCase
    func test_file_read_writeto_05(): Unit {
        var arr: Array<Byte> = Array<Byte>()
        var arr1: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr2: Array<Byte> = Array<Byte>(9, {i => UInt8(i + 3)})
        var arr3: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr4: Array<Byte> = Array<Byte>(10, repeat: 0)
        File.create("#$%^&&^").close()
        @Expect(exists("#$%^&&^"), true)
        var file = File("#$%^&&^", OpenMode.Write)
        file.write(arr)
        file.write(arr1)
        var file2 = File("#$%^&&^", OpenMode.Read)
        file2.read(arr4)
        @Expect(arr1, arr4)
        File.writeTo("#$%^&&^", arr2)
        var file1 = File("#$%^&&^", OpenMode.Read)
        @Expect(file1.read(arr3), 9)
        @Expect(arr3, [3u8,4u8,5u8,6u8,7u8,8u8,9u8,10u8,11u8,0u8])
        @Expect(file1.read(arr3), 0)
    }

    @TestCase
    func test_file_read_writeto_06(): Unit {
        var arr: Array<Byte> = Array<Byte>()
        var arr1: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr2: Array<Byte> = Array<Byte>(9, {i => UInt8(i + 3)})
        var arr3: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr4: Array<Byte> = Array<Byte>(10, repeat: 0)
        File.create("#$%^&&^").close()
        @Expect(exists("#$%^&&^"), true)
        var file = File("#$%^&&^", OpenMode.Write)
        file.write(arr)
        file.write(arr1)
        var file2 = File("#$%^&&^", OpenMode.Read)
        file2.read(arr4)
        @Expect(arr1, arr4)
        file.write(arr2)
        var file1 = File("#$%^&&^", OpenMode.Read)
        @Expect(file1.read(arr3), 10)
        @Expect(arr3, arr1)
        @Expect(file1.read(arr3), 9)
        @Expect(arr3, [3u8, 4u8, 5u8, 6u8, 7u8, 8u8, 9u8, 10u8,11u8, 10u8])
    }
}
