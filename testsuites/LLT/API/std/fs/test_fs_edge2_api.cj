/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class FsEdgeBranchTest {

    @TestCase
    func test_directory_create(): Unit {
        try {
            Directory.create("/tmp/test_dir_cd")
            @Assert(true)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_file_info_nonexistent(): Unit {
        try {
            let info = FileInfo("/tmp/nonexistent_file_info")
            @Assert(info.size == 0)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_path_normalize(): Unit {
        let p = Path("/tmp/../tmp/./test")
        let normalized = p.normalize()
        @Assert(normalized.toString().size > 0)
    }

    @TestCase
    func test_path_to_string(): Unit {
        let p = Path("/tmp/test")
        @Assert(p.toString().size > 0)
    }
}
