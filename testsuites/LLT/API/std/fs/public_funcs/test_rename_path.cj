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
    func test_rename_link() {
        @Assert(!exists(Path("filelink2")))
        rename(Path("filelink"), to: Path("filelink2"))
        @Assert(!exists(Path("filelink")))
        @Expect(FileInfo(Path("filelink2")).isSymbolicLink())
        @Expect(SymbolicLink.readFrom(Path("filelink2")).toString(), "ifile")

        @Assert(!exists(Path("dirlink2")))
        rename(Path("dirlink"), to: Path("dirlink2"))
        @Assert(!exists(Path("dirlink")))
        @Expect(FileInfo(Path("dirlink2")).isSymbolicLink())
        @Expect(SymbolicLink.readFrom(Path("dirlink2")).toString(), "dir1")

        @ExpectThrows[FSException](rename(Path("dirlink2"), to: Path("filelink2")))
        rename(Path("dirlink2"), to: Path("filelink2"), overwrite: true)
        @Assert(!exists(Path("dirlink2")))
    }

    @TestCase
    func test_exception() {
        @ExpectThrows[FSException](rename(Path("ifile_null"), to: Path( "filea"), overwrite: true))
        @ExpectThrows[FSException](rename(Path("ifile"), to: Path( "dir1"), overwrite: false))
        @ExpectThrows[FSException](rename(Path("ifile"), to: Path( "ifile"), overwrite: true))
        @ExpectThrows[FSException](rename(Path("dir1"), to: Path( "dir1"), overwrite: true))
        @ExpectThrows[FSException](rename(Path("dir1"), to: Path( "ifile"), overwrite: false))
        @ExpectThrows[FSException](rename(Path("ifile"), to: Path( "dir1"), overwrite: false))
        @ExpectThrows[FSException](rename(Path("filelink"), to: Path( "dir1"), overwrite: false))
    }
}
