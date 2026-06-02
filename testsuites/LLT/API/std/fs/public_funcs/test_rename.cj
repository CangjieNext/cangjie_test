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
class Test_FS_Rename {
    @TestCase
    func test_Rename_link() {
        @Assert(!exists("filelink2"))
        rename("filelink", to: "filelink2")
        @Assert(!exists("filelink"))
        @Expect(FileInfo("filelink2").isSymbolicLink())
        @Expect(SymbolicLink.readFrom("filelink2").toString(), "ifile")

        @Assert(!exists("dirlink2"))
        rename("dirlink", to: "dirlink2")
        @Assert(!exists("dirlink"))
        @Expect(FileInfo("dirlink2").isSymbolicLink())
        @Expect(SymbolicLink.readFrom("dirlink2").toString(), "dir1")

        @ExpectThrows[FSException](rename("dirlink2", to:"filelink2"))
        rename("dirlink2", to: "filelink2", overwrite: true)
        @Assert(!exists("dirlink2"))
    }

    @TestCase
    func test_exception() {
        @ExpectThrows[FSException](rename("ifile_null", to: "filea", overwrite: true))
        @ExpectThrows[FSException](rename("ifile", to: "dir1", overwrite: false))
        @ExpectThrows[FSException](rename("ifile", to: "ifile", overwrite: true))
        @ExpectThrows[FSException](rename("dir1", to: "dir1", overwrite: true))
        @ExpectThrows[FSException](rename("dir1", to: "ifile", overwrite: false))
        @ExpectThrows[FSException](rename("ifile", to: "dir1", overwrite: false))
        @ExpectThrows[FSException](rename("filelink", to: "dir1", overwrite: false))
    }

    @TestCase
    func test_rename_file() {
        File.create("filea").close()
        File.create("fileb").close()
        @Expect(exists("filea"))
        @Expect(exists("fileb"))
        @ExpectThrows[FSException](rename("filea", to:"fileb"))
        rename("filea", to: "fileb", overwrite: true)
        @Expect(!exists("filea"))
        @Expect(exists("fileb"))

        Directory.create("dira/dirb", recursive: true)
        @Expect(FileInfo("dira/dirb").isDirectory())
        @ExpectThrows[FSException](rename("fileb", to:"dira"))
        rename("fileb", to: "dira", overwrite: true)
        @Expect(!exists("fileb"))
        @Expect(!exists("dira/dirb"))
        @Expect(FileInfo("dira").isRegular())

        rename("dira", to: "filea")
        @Expect(FileInfo("filea").isRegular())

        remove("filea")
    }

    @TestCase
    func test_rename_directory() {
        Directory.create("dira")
        Directory.create("dirb")
        Directory.create("dirb/dirc")
        @ExpectThrows[FSException](rename("dira", to:"dirb"))
        rename("dirb", to: "dird")
        @Expect(!exists("dirb"))
        @Expect(exists("dird"))
        @Expect(FileInfo("dird/dirc").isDirectory())

        File.create("filea").close()
        @Expect(exists("filea"))
        rename("dird", to: "filea", overwrite: true)
        @Expect(FileInfo("filea").isDirectory())
        @Expect(!exists("dird"))
        @Expect(exists("filea/dirc"))

        rename("filea", to: "dirb", overwrite: true)
        @Expect(FileInfo("dirb").isDirectory())
        @Expect(FileInfo("dirb/dirc").isDirectory())
        remove("dirb", recursive: true)
    }
}
