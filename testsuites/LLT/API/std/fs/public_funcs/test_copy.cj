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
// (Windows) EXEC: mkdir dir1 && mklink dirlink dir1
// (Windows) EXEC: mkdir dir2 && type nul > dir2/ifile2
// EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*

@Test
class Test_FS_Copy {
    @TestCase
    func test_copy_link() {
        @Assert(!exists("filelink2"))
        copy("filelink", to: "filelink2")
        @Expect(FileInfo("filelink2").isSymbolicLink())
        @Expect(SymbolicLink.readFrom("filelink2").toString(), "ifile")

        @Assert(!exists("dirlink2"))
        copy("dirlink", to: "dirlink2")
        @Expect(FileInfo("dirlink2").isSymbolicLink())
        @Expect(SymbolicLink.readFrom("dirlink2").toString(), "dir1")

        @ExpectThrows[FSException](copy("filelink", to:"filelink2"))
        copy("filelink", to: "filelink2", overwrite: true)
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
