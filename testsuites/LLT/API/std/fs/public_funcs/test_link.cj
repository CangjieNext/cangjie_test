/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %touch ifile && %lnfile ifile filelink1 && %lnfile filelink1 filelink2
// (Linux) EXEC: %mkdir dir1 && %touch dir1/ifile
// (Windows) EXEC: type nul > ifile && mklink filelink1 ifile && mklink filelink2 filelink1
// (Windows) EXEC: mkdir dir1 && type nul > dir1/ifile
// EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*

@Test
class Test_HardLink {
    @TestCase
    func test_HardLink() {
        @Expect(exists("ifile"))
        @Expect(!exists("ifileL"))
        HardLink.create("ifileL", to: "ifile")
        @Expect(FileInfo("ifileL").isRegular())

        @Expect(!exists("dir1fileL"))
        HardLink.create("dir1fileL", to: "dir1/ifile")
        @Expect(FileInfo("dir1fileL").isRegular())
    }

    @TestCase
    func testFsException() {
        @ExpectThrows[FSException](HardLink.create("dir", to: "ifile_null"))
        @Expect(!exists("dir1L"))
        @ExpectThrows[FSException](HardLink.create("dir1L", to: "dir1"))
    }

    @TestCase
    func testIllegalArgumentException() {
        @ExpectThrows[IllegalArgumentException](HardLink.create("dir\02", to: "ifile"))
        @ExpectThrows[IllegalArgumentException](HardLink.create("ifile", to: "dir\0"))
        @ExpectThrows[IllegalArgumentException](HardLink.create("", to: ""))
    }
}

@Test
class Test_SymbolicLink {
    @TestCase
    func test_SymbolicLink_Create() {
        @Expect(exists("ifile"))
        @Expect(!exists("ifileS"))
        SymbolicLink.create("ifileS", to: "ifile")
        @Expect(FileInfo("ifileS").isSymbolicLink())

        @Expect(!exists("dir1S"))
        SymbolicLink.create("dir1S", to: "dir1")
        @Expect(FileInfo("dir1S").isSymbolicLink())

        @Expect(!exists("dir1fileS"))
        SymbolicLink.create("dir1fileS", to: "dir1/ifile")
        @Expect(FileInfo("dir1fileS").isSymbolicLink())
    }

    @TestCase
    func test_SymbolicLinkReadFrom() {
        var path1 = SymbolicLink.readFrom("filelink2")
        @Expect(path1.toString(), "filelink1")
        path1 = SymbolicLink.readFrom("filelink1")
        @Expect(path1.toString(), "ifile")

        path1 = SymbolicLink.readFrom("filelink1", recursive: true)
        @Expect(path1, canonicalize("filelink1"))

        path1 = SymbolicLink.readFrom("filelink2", recursive: true)
        @Expect(path1, canonicalize("filelink2"))

        remove("filelink1")
        @ExpectThrows[FSException](SymbolicLink.readFrom("filelink2", recursive: true))
    }

    @TestCase
    func testIllegalArgumentException() {
        @ExpectThrows[IllegalArgumentException](SymbolicLink.create("dir\02", to: "ifile"))
        @ExpectThrows[IllegalArgumentException](SymbolicLink.create("ifile", to: "dir\0"))
        @ExpectThrows[IllegalArgumentException](SymbolicLink.create("", to: ""))
        @ExpectThrows[IllegalArgumentException](SymbolicLink.readFrom("ifile"))
    }
}
