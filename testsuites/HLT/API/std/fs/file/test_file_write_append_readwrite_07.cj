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
class Test_file_write_append_readwrite_07 {
    var path_string = ["cangjietest", "♫♬♪♩✲", "仓颉鸿蒙", "12345678", "#$%^&&^"]

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
    func test_file_write_append_readwrite_01(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(9, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(5, {i => UInt8(i + 5)})
        var arr3: Array<Byte> = Array<Byte>(9, repeat: 0)
        @Expect(exists("cangjietest"), false)
        File.appendTo("cangjietest", arr)
        @Assert(exists("cangjietest"), true)
        var file = File(Path("cangjietest"), OpenMode.Read)
        @Expect(file.read(arr1), 9)
        var file1 = File(Path("cangjietest"), OpenMode.Write)
        file1.write(arr2)
        var file2 = File("cangjietest", OpenMode.Read)
        @Expect(file2.read(arr3), 5)
    }

    @TestCase
    func test_file_write_append_readwrite_02(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(9, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 11)})
        File.create("♫♬♪♩✲").close()
        @Assert(exists("♫♬♪♩✲"), true)
        File.appendTo("♫♬♪♩✲", arr)
        var file = File(Path("♫♬♪♩✲"), OpenMode.Append)
        file.write(arr2)
        var file1 = File(Path("♫♬♪♩✲"), OpenMode.Read)
        @Expect(file1.read(arr1), 9)
        @Expect(arr1, [1u8,2u8,3u8,4u8,5u8,6u8,7u8,8u8,9u8])
        @Expect(file1.read(arr1), 9)
        @Expect(arr1, [10u8,11u8,12u8,13u8,14u8,15u8,16u8,17u8,18u8])
        @Expect(file1.read(arr1), 2)
        @Expect(arr1, [19u8,20u8,12u8,13u8,14u8,15u8,16u8,17u8,18u8])
    }

    @TestCase
    func test_file_write_append_readwrite_03(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 11)})
        var arr4: Array<Byte> = Array<Byte>(20, repeat: 0)
        var arr5: Array<Byte> = Array<Byte>(20, {i => UInt8(i + 1)})
        File.create("仓颉鸿蒙").close()
        @Assert(exists("仓颉鸿蒙"), true)
        var file = File(Path("仓颉鸿蒙"), OpenMode.Write)
        file.write(arr)
        var file1 = File(Path("仓颉鸿蒙"), OpenMode.Read)
        file1.read(arr1)
        @Expect(arr1, arr)
        File.writeTo("仓颉鸿蒙", arr2)
        File.writeTo("仓颉鸿蒙", arr)
        var file2 = File("仓颉鸿蒙", OpenMode.Append)
        file2.write(arr2)
        var file3 = File("仓颉鸿蒙", OpenMode.Read)
        @Expect(file3.read(arr4), 20)
        @Expect(file3.read(arr4), 0)
        @Expect(arr4, arr5)
    }

    @TestCase
    func test_file_write_append_readwrite_04(): Unit {
        var arr: Array<Byte> = Array<Byte>()
        var arr1: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr3: Array<Byte> = Array<Byte>(9, {i => UInt8(i + 2)})
        @Expect(exists("12345678"), false)
        File.create("12345678").close()
        @Assert(exists("12345678"), true)
        File.appendTo("12345678", arr2)
        var file = File(Path("12345678"), OpenMode.ReadWrite)
        file.write(arr3)
        var file1 = File(Path("12345678"), OpenMode.Read)
        @Expect(file1.read(arr1), 10)
        @Expect(arr1, [2u8,3u8,4u8,5u8,6u8,7u8,8u8,9u8,10u8,10u8])
        @Expect(file1.read(arr1), 0)
    }

    @TestCase
    func test_file_write_append_readwrite_05(): Unit {
        var arr: Array<Byte> = Array<Byte>()
        var arr1: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr2: Array<Byte> = Array<Byte>(9, {i => UInt8(i + 3)})
        var arr3: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr4: Array<Byte> = Array<Byte>(10, repeat: 0)
        var arr5: Array<Byte> = Array<Byte>(18, repeat: 0)
        File.create("#$%^&&^").close()
        @Assert(exists("#$%^&&^"), true)
        var file = File(Path("#$%^&&^"), OpenMode.Write)
        file.write(arr)
        file.write(arr1)
        var file2 = File(Path("#$%^&&^"), OpenMode.ReadWrite)
        file2.read(arr4)
        @Expect(arr1, arr4)
        file2.write(arr2)
        file2.write(arr2)
        var file3 = File(Path("#$%^&&^"), OpenMode.ReadWrite)
        @Expect(file3.read(arr5), 18)
    }
}
