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
        @Expect(exists(Path("ifile")))
        @Expect(!exists(Path("ifileL")))
        HardLink.create(Path("ifileL"), to: Path("ifile"))
        @Expect(FileInfo(Path("ifileL")).isRegular())

        @Expect(!exists(Path("dir1fileL")))
        HardLink.create(Path("dir1fileL"), to: Path("dir1/ifile"))
        @Expect(FileInfo(Path("dir1fileL")).isRegular())
    }

    @TestCase
    func testFsException() {
        @ExpectThrows[FSException](HardLink.create(Path("dir"), to: Path("ifile_null")))
        @Expect(!exists(Path("dir1L")))
        @ExpectThrows[FSException](HardLink.create(Path("dir1L"), to: Path("dir1")))
    }

    @TestCase
    func testIllegalArgumentException() {
        @ExpectThrows[IllegalArgumentException](HardLink.create(Path("dir\02"), to: Path("ifile")))
        @ExpectThrows[IllegalArgumentException](HardLink.create(Path("ifile"), to: Path("dir\0")))
        @ExpectThrows[IllegalArgumentException](HardLink.create(Path(""), to: Path("")))
    }
}

@Test
class Test_SymbolicLink {
    @TestCase
    func test_SymbolicLink_Create() {
        @Expect(exists(Path("ifile")))
        @Expect(!exists(Path("ifileS")))
        SymbolicLink.create(Path("ifileS"), to: Path("ifile"))
        @Expect(FileInfo(Path("ifileS")).isSymbolicLink())

        @Expect(!exists(Path("dir1S")))
        SymbolicLink.create(Path("dir1S"), to: Path("dir1"))
        @Expect(FileInfo(Path("dir1S")).isSymbolicLink())

        @Expect(!exists(Path("dir1fileS")))
        SymbolicLink.create(Path("dir1fileS"), to: Path("dir1/ifile"))
        @Expect(FileInfo(Path("dir1fileS")).isSymbolicLink())
    }

    @TestCase
    func test_SymbolicLinkReadFrom() {
        var path1 = SymbolicLink.readFrom(Path("filelink2"))
        @Expect(path1.toString(), "filelink1")
        path1 = SymbolicLink.readFrom(Path("filelink1"))
        @Expect(path1.toString(), "ifile")

        path1 = SymbolicLink.readFrom(Path("filelink1"), recursive: true)
        @Expect(path1, canonicalize(Path("filelink1")))

        path1 = SymbolicLink.readFrom(Path("filelink2"), recursive: true)
        @Expect(path1, canonicalize(Path("filelink2")))

        remove(Path("filelink1"))
        @ExpectThrows[FSException](SymbolicLink.readFrom(Path("filelink2"), recursive: true))
    }

    @TestCase
    func testIllegalArgumentException() {
        @ExpectThrows[IllegalArgumentException](SymbolicLink.create(Path("dir\02"), to: Path("ifile")))
        @ExpectThrows[IllegalArgumentException](SymbolicLink.create(Path("ifile"), to: Path("dir\0")))
        @ExpectThrows[IllegalArgumentException](SymbolicLink.create(Path(""), to: Path("")))
        @ExpectThrows[IllegalArgumentException](SymbolicLink.readFrom(Path("ifile")))
    }
    @TestCase
    func testSymbolicLink() {
        File.create("./tempfile").close()
        let data: Array<Byte> = [0, 1, 2, 3, 4]
        File.appendTo("./tempfile", data)
        SymbolicLink.create(".temp", to: "./tempfile")
        File.appendTo("./tempfile", data)
        let data0: Array<Byte> = [0, 1, 2, 3, 4, 0, 1, 2, 3, 4]
        @Expect(File.readFrom(".temp"), data0)
        remove("./tempfile")
        remove(".temp")
    }
    @TestCase
    func testReadfrom() {
        File.create("./tempfile0").close()
        SymbolicLink.create("./tempfile1", to: "./tempfile0")
        SymbolicLink.create("./tempfile2", to: "./tempfile1")
        @Expect(SymbolicLink.readFrom(Path("tempfile1")), Path("tempfile0"))
        @Expect(SymbolicLink.readFrom("tempfile2"), Path("tempfile1"))
        @Expect(SymbolicLink.readFrom("tempfile2", recursive: true), canonicalize(Path("tempfile0")))
        remove("tempfile0")
        remove("tempfile1")
        remove("tempfile2")
    }
}
