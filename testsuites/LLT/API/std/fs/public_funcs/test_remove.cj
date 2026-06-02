/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Linux) EXEC: %touch ifile && %lnfile ifile filelink
// (Linux) EXEC: %mkdir dir1 && %lnfile dir1 dirlink
// (Linux) EXEC: %mkdir dir2 && %touch dir2/file2
// (Linux) EXEC: %mkdir dir3 && %touch dir3/file3
// (Windows) EXEC: type nul > ifile && mklink filelink ifile
// (Windows) EXEC: mkdir dir1 && mklink dirlink dir1
// (Windows) EXEC: mkdir dir2 && type nul > dir2/file2
// (Windows) EXEC: mkdir dir3 && type nul > dir3/file3
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*

@Test
class Test_Fs_remove {
    @TestCase
    func test_file(): Unit {
        @Assert(exists("ifile"))
        remove("ifile")
        @Assert(!exists("ifile"))
    }

    @TestCase
    func test_dir(): Unit {
        @Assert(exists("dir1"))
        @Assert(exists("dir2"))
        remove("dir1")
        @Assert(!exists("dir1"))

        try {
            remove("dir2")
        } catch (e: FSException) {
            @Expect(exists("dir2"))
            remove("dir2", recursive: true)
            @Expect(!exists("dir2"))
            return
        }
        @Expect(false)
    }

    @TestCase
    func testcombine() {
        @Assert(exists("./dir3/file3"))
        remove("./dir3/file3")
        remove("dir3")
        @Expect(!exists("dir3"))
    }

    @TestCase
    func test_symboliclink() {
        @Assert(exists("filelink"))
        remove("filelink")
        @Assert(!exists("filelink"))
        @Assert(exists("dirlink"))
        remove("dirlink")
        @Assert(!exists("dirlink"))
    }

    @TestCase
    func test_invalid() {
        var count = 0
        try {
            remove("abc")
        } catch (_: FSException) {
            count++
        }

        try {
            remove("abc", recursive: true)
        } catch (_: FSException) {
            count++
        }

        try {
            remove("abc", recursive: false)
        } catch (_: FSException) {
            count++
        }

        @Expect(count, 3)
    }
}
