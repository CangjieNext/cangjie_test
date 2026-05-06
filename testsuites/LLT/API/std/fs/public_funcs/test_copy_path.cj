/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %touch ifile && %lnfile ifile filelink
// (Linux) EXEC: %mkdir dir1 && %lnfile dir1 dirlink
// (Linux) EXEC: %mkdir dir2 && %touch dir2/ifile2
// (Windows) EXEC: type nul > ifile && mklink filelink ifile
// (Windows) EXEC: mkdir dir1 && mklink /d dirlink dir1
// (Windows) EXEC: mkdir dir2 && type nul > dir2/ifile2
// EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*

@Test
class Test_FS_Copy {
    @TestCase
    func test_copy_link() {
        @Assert(!exists(Path("filelink2")))
        copy(Path("filelink"), to: Path("filelink2"))
        @Expect(FileInfo(Path("filelink2"), followSymlink: false).isSymbolicLink())
        @Expect(FileInfo(Path("filelink2"), followSymlink: true).isRegular())
        @Expect(SymbolicLink.readFrom(Path("filelink2")).toString(), "ifile")

        @Assert(!exists(Path("dirlink2")))
        copy(Path("dirlink"), to: Path("dirlink2"))
        @Expect(FileInfo(Path("dirlink2"), followSymlink: false).isSymbolicLink())
        @Expect(FileInfo(Path("dirlink2"), followSymlink: true).isDirectory())
        @Expect(SymbolicLink.readFrom(Path("dirlink2")).toString(), "dir1")

        @ExpectThrows[FSException](copy(Path("filelink"), to: Path("filelink2")))
        copy(Path("filelink"), to: Path("filelink2"), overwrite: true)
    }

    @TestCase
    func test_copy_directory_preserves_symlink_member() {
        SymbolicLink.create(Path("dir1/file_member_link"), to: Path("../ifile"))
        copy(Path("dir1"), to: Path("dir1_copy"))

        @Expect(FileInfo(Path("dir1_copy/file_member_link"), followSymlink: false).isSymbolicLink())
        @Expect(FileInfo(Path("dir1_copy/file_member_link"), followSymlink: true).isRegular())
        @Expect(SymbolicLink.readFrom(Path("dir1_copy/file_member_link")).toString(), "../ifile")
        @Expect(exists(Path("ifile")))
    }

    @TestCase
    func test_exception() {
        @ExpectThrows[FSException](copy(Path("ifile_null"), to: Path( "filea"), overwrite: true))
        @ExpectThrows[FSException](copy(Path("ifile"), to: Path( "dir1"), overwrite: true))
        @ExpectThrows[FSException](copy(Path("ifile"), to: Path( "ifile"), overwrite: true))
        @ExpectThrows[FSException](copy(Path("dir1"), to: Path( "dir1"), overwrite: true))
        @ExpectThrows[FSException](copy(Path("dir1"), to: Path( "ifile"), overwrite: true))
        @ExpectThrows[FSException](copy(Path("ifile"), to: Path( "dir1"), overwrite: true))
        @ExpectThrows[FSException](copy(Path("filelink"), to: Path( "dir1"), overwrite: true))
    }
}
