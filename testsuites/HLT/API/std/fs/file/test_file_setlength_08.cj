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
class Test_file_setlength_08 {
    var path_string = ["cangjietest", "♫♬♪♩✲", "仓颉鸿蒙"]

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
    func test_file_setlength_01(): Unit {
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
        file1.setLength(3)
        var file2 = File("cangjietest", OpenMode.Read)
        @Expect(file2.read(arr3), 3)
    }

    @TestCase
    func test_file_setlength_02(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(9, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(5, {i => UInt8(i + 5)})
        var arr3: Array<Byte> = Array<Byte>(9, repeat: 0)
        @Expect(exists("♫♬♪♩✲"), false)
        File.appendTo("♫♬♪♩✲", arr)
        @Assert(exists("♫♬♪♩✲"), true)
        var file = File(Path("♫♬♪♩✲"), OpenMode.Read)
        @Expect(file.read(arr1), 9)
        var file1 = File(Path("♫♬♪♩✲"), OpenMode.Write)
        file1.write(arr2)
        file1.setLength(0)
        var file2 = File("♫♬♪♩✲", OpenMode.Read)
        @Expect(file2.read(arr3), 0)
    }

    @TestCase
    func test_file_setlength_03(): Unit {
        var arr: Array<Byte> = Array<Byte>(10, {i => UInt8(i + 1)})
        var arr1: Array<Byte> = Array<Byte>(9, repeat: 0)
        var arr2: Array<Byte> = Array<Byte>(5, {i => UInt8(i + 5)})
        var arr3: Array<Byte> = Array<Byte>(12, repeat: 1)
        @Expect(exists("仓颉鸿蒙"), false)
        File.appendTo("仓颉鸿蒙", arr)
        @Assert(exists("仓颉鸿蒙"), true)
        var file = File(Path("仓颉鸿蒙"), OpenMode.Read)
        @Expect(file.read(arr1), 9)
        var file1 = File(Path("仓颉鸿蒙"), OpenMode.Write)
        file1.write(arr2)
        file1.setLength(11)
        file1.write(arr2)
        var file2 = File("仓颉鸿蒙", OpenMode.Read)
        @Expect(file2.read(arr3), 11)
        @Expect(arr3, [5u8,6u8,7u8,8u8,9u8,5u8,6u8,7u8,8u8,9u8,0u8,1u8])
    }
}
