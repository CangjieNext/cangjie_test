/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*

@Test
class Test_RemoveIfExists {
    @TestCase
    func remove_files_01() {
        File.create("tempfile").close()
        @Assert(exists("tempfile"), true)
        removeIfExists("tempfile")
        @Expect(exists("tempfile"), false)
    }

    @TestCase
    func remove_files_02() {
        File.create("tempfile.a...b..c").close()
        @Assert(exists("tempfile.a...b..c"), true)
        removeIfExists("./tempfile.a...b..c")
        @Expect(exists("tempfile.a...b..c"), false)
    }

    @TestCase
    func remove_files_02_01() {
        File.create("tempfile.a...b..c").close()
        @Assert(exists("tempfile.a...b..c"), true)
        removeIfExists("./tempfile.a...b..c", recursive: true)
        @Expect(exists("tempfile.a...b..c"), false)
    }

    @TestCase
    func remove_files_03() {
        File.create("tempfile").close()
        @Assert(exists("tempfile"), true)
        removeIfExists(canonicalize(Path("tempfile")))
        @Expect(exists("tempfile"), false)
    }

    @TestCase
    func remove_dir_01() {
        Directory.create("tempdir")
        @Assert(exists("tempdir"), true)
        removeIfExists("tempdir")
        @Expect(exists("tempdir"), false)
    }

    @TestCase
    func remove_dir_02() {
        Directory.create("tempdir.a.b...c")
        @Assert(exists("tempdir.a.b...c"), true)
        removeIfExists("./tempdir.a.b...c")
        @Expect(exists("tempdir.a.b...c"), false)
    }

    @TestCase
    func remove_dir_03() {
        Directory.create("tempdir")
        @Assert(exists("tempdir"), true)
        removeIfExists(canonicalize(Path("tempdir")))
        @Expect(exists("tempdir"), false)
    }

    @TestCase
    func remove_dir_03_01() {
        Directory.create("tempdir")
        @Assert(exists("tempdir"), true)
        removeIfExists(canonicalize(Path("tempdir")), recursive: true)
        @Expect(exists("tempdir"), false)
    }
}
