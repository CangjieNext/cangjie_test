/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Directory.apis when input is unc_path,
 * Test API: Apis in Class Directory
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Directory_DirPath {
    private var dirpath = canonicalize(Path(".\\")).join("tmp").toString()
    private var dirpaths = ["\\\\.\\" + dirpath + "\\dir1", dirpath + "\\dir2", "\\\\?\\" + dirpath + "\\dir3"]
    private var sum = 0

    public override func beforeEach(): Unit {
        Directory.create(dirpath)
        @Assert(exists(dirpath), true)
        sum = 0
    }

    public override func afterEach(): Unit {
        remove(dirpath, recursive: true)
    }

    @TestCase
    func test_path_copy_move(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        rename(dirpaths[0], to: dirpaths[1], overwrite: false)
        @Expect(exists(dirpaths[0]), false)
        @Expect(exists(dirpaths[1]), true)

        copy(dirpaths[1], to: dirpaths[0], overwrite: true)
        @Expect(exists(dirpaths[0]), true)
        @Expect(exists(dirpaths[1]), true)
    }

    @TestCase
    func test_path_copy(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        copy(dirpaths[0], to: dirpaths[1], overwrite: false)
        @Expect(exists(dirpaths[0]), true)
        @Expect(exists(dirpaths[1]), true)
    }
}
