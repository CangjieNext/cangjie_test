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

@Test
class Test_RemoveIfExists {
    @TestCase
    func remove_file() {
        File.create("./tempfile").close()
        @Assert(exists("./tempfile"), true)
        removeIfExists("./tempfile")
        @Expect(exists("./tempfile"), false)
    }

    @TestCase
    func remove_recursive_dir() {
        Directory.create("./tempdir")
        Directory.create(Path("./tempdir").join("tempsubdir"))
        @Assert(exists("./tempdir/tempsubdir"), true)
        removeIfExists("./tempdir", recursive: true)
        @Expect(exists("./tempdir"), false)
    }
}
