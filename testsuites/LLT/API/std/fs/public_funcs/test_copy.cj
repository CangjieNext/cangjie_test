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
// (Linux) EXEC: %lnfile ../ifile dir1/file_member_link
// (Linux) EXEC: %mkdir dir2 && %touch dir2/ifile2
// (Windows) EXEC: type nul > ifile && mklink filelink ifile
// (Windows) EXEC: mkdir dir1 && mklink /d dirlink dir1
// (Windows) EXEC: mklink dir1\file_member_link ..\ifile
// (Windows) EXEC: mkdir dir2 && type nul > dir2/ifile2
// EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*

@Test
class Test_FS_Copy {
    @TestCase
    func test_copy_link() {
        @Assert(!exists("filelink2"))
        copy("filelink", to: "filelink2")
        @Expect(FileInfo("filelink2", followSymlink: false).isSymbolicLink())
        @Expect(FileInfo("filelink2", followSymlink: true).isRegular())
        @Expect(SymbolicLink.readFrom("filelink2").toString(), "ifile")

        @Assert(!exists("dirlink2"))
        copy("dirlink", to: "dirlink2")
        @Expect(FileInfo("dirlink2", followSymlink: false).isSymbolicLink())
        @Expect(FileInfo("dirlink2", followSymlink: true).isDirectory())
        @Expect(SymbolicLink.readFrom("dirlink2").toString(), "dir1")

        @ExpectThrows[FSException](copy("filelink", to:"filelink2"))
        copy("filelink", to: "filelink2", overwrite: true)
    }

    @TestCase
    func test_copy_directory_preserves_symlink_member() {
        copy("dir1", to: "dir1_copy")

        @Expect(FileInfo("dir1_copy/file_member_link", followSymlink: false).isSymbolicLink())
        @Expect(FileInfo("dir1_copy/file_member_link", followSymlink: true).isRegular())
        let target = SymbolicLink.readFrom("dir1_copy/file_member_link").toString()
        @Expect(target == "../ifile" || target == "..\\ifile")
        @Expect(exists("ifile"))
    }

    @TestCase
    func test_exception() {
        @ExpectThrows[FSException](copy("ifile_null", to: "filea", overwrite: true))
        @ExpectThrows[FSException](copy("ifile", to: "dir1", overwrite: true))
        @ExpectThrows[FSException](copy("ifile", to: "ifile", overwrite: true))
        @ExpectThrows[FSException](copy("dir1", to: "dir1", overwrite: true))
        @ExpectThrows[FSException](copy("dir1", to: "ifile", overwrite: true))
        @ExpectThrows[FSException](copy("ifile", to: "dir1", overwrite: true))
        @ExpectThrows[FSException](copy("filelink", to: "dir1", overwrite: true))
    }
}
