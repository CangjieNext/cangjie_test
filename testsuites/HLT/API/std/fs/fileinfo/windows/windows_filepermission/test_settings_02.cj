/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

var dirpath = canonicalize(Path("./"))
var suffixs = ["file0001.cj", "file0001", "file0001.sys", "file0001.7z"]

@Test
public class Test_Settings_02 {
    public override func beforeAll(): Unit {
        var path0 = canonicalize(Path("./"))
        var dir_file_path = path0.join("file_temp_set_01")
        if (exists(dir_file_path)) {
            remove(dir_file_path, recursive: true)
        }
        let dir_file = Directory.create(dir_file_path, recursive: true)
        @Assert(exists(dir_file_path), true)
        File.create(dir_file_path.join("file0001.cj")).close()
        @Assert(exists(dir_file_path.join("file0001.cj")), true)
        File.create(dir_file_path.join("file0001")).close()
        @Assert(exists(dir_file_path.join("file0001")), true)
        File.create(dir_file_path.join("file0001.sys")).close()
        @Assert(exists(dir_file_path.join("file0001.sys")), true)
        File.create(dir_file_path.join("file0001.7z")).close()
        @Assert(exists(dir_file_path.join("file0001.7z")), true)
    }

    public override func afterAll(): Unit {
        var path0 = canonicalize(Path("./"))
        var dir_file_path = path0.join("file_temp_set_01")
        if (exists(dir_file_path)) {
            remove(dir_file_path, recursive: true)
        }
        @Assert(exists(dir_file_path), false)
    }

    //Directory Path Init
    @TestCase
    func case1(): Unit {
        var f1 = FileInfo(dirpath)
        @Expect(f1.canExecute(), true)
        @Expect(f1.canRead(), true)
        @Expect(f1.canWrite(), true)
    }

    //Directory Path settings1
    @TestCase
    func case2(): Unit {
        var f1 = FileInfo(dirpath)
        @Expect(f1.setExecutable(true),false)
        @Expect(f1.setReadable(true),true)
        @Expect(f1.setWritable(true),false)
        @Expect(f1.canExecute(), true)
        @Expect(f1.canRead(), true)
        @Expect(f1.canWrite(), true)
    }

    //Directory Path settings2
    @TestCase
    func case3(): Unit {
        var f1 = FileInfo(dirpath)
        @Expect(f1.setExecutable(false),false)
        @Expect(f1.setReadable(false),false)
        @Expect(f1.setWritable(false),false)
        @Expect(f1.canExecute(), true)
        @Expect(f1.canRead(), true)
        @Expect(f1.canWrite(), true)
    }

    //File Path
    @TestCase
    func case4(): Unit {
        for (suffix in suffixs) {
            var s1 = dirpath.join("file_temp_set_01").join(suffix)
            var f1 = FileInfo(s1)
            @Expect(f1.canExecute(), false)
            @Expect(f1.canRead(), true)
            @Expect(f1.canWrite(), true)
        }
    }

    //File Path settings1
    @TestCase
    func case5(): Unit {
        for (suffix in suffixs) {
            var s1 = dirpath.join("file_temp_set_01").join(suffix)
            var f1 = FileInfo(s1)
            @Expect(f1.setExecutable(false),false)
            @Expect(f1.setReadable(false),false)
            @Expect(f1.setWritable(false),true)
            @Expect(f1.canExecute(), false)
            @Expect(f1.canRead(), true)
            @Expect(f1.canWrite(), false)
        }
    }

    //File Path settings2
    @TestCase
    func case6(): Unit {
        for (suffix in suffixs) {
            var s1 = dirpath.join("file_temp_set_01").join(suffix)
            var f1 = FileInfo(s1)
            @Expect(f1.setExecutable(true),false)
            @Expect(f1.setReadable(true),true)
            @Expect(f1.setWritable(true),true)
            @Expect(f1.canExecute(), false)
            @Expect(f1.canRead(), true)
            @Expect(f1.canWrite(), true)
        }
    }
}
