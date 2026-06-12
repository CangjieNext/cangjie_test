/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not iOS and not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not Windows or OHOS)RUN-EXEC: touch file0101 && ln -s file0101 link01_F && ln -s link01_F link02_L && %run %run_opt %output %run_utest_opt %run_args 
// (not iOS and not Windows or OHOS)RUN-EXEC: rm -rf link02_L link01_F file0101

/*
 * Test description: Test the Path.== , !=
 * Test API: public operator func ==(that: Path): Bool
 *           public operator func !=(that: Path): Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@When[os == "macOS"]
let flag1 = true
@When[os == "macOS"]
let flag2 = false
@When[os != "macOS"]
let flag1 = false
@When[os != "macOS"]
let flag2 = true

@Test
class Test_Path_Equal_Unequal {
    public override func beforeAll(): Unit {
        var path0 = canonicalize(Path("./"))
        var dir_file_path = path0.join("file_temp_01")
        var dir_dir_path = path0.join("dir_temp_01")
        if (exists(dir_file_path)) {
            remove(dir_file_path, recursive: true)
        }
        if (exists(dir_dir_path)) {
            remove(dir_dir_path, recursive: true)
        }
        Directory.create(dir_file_path, recursive: true)
        @Assert(exists(dir_file_path), true)
        Directory.create(dir_dir_path, recursive: true)
        @Assert(exists(dir_dir_path), true)
        File.create(dir_file_path.join("仓颉Cj")).close()
        @Assert(exists(dir_file_path.join("仓颉Cj")), true)
        Directory.create(dir_dir_path.join("仓颉cj"))
        @Assert(exists(dir_dir_path.join("仓颉cj")), true)
    }

    public override func afterAll(): Unit {
        var path0 = canonicalize(Path("./"))
        var dir_file_path = path0.join("file_temp_01")
        var dir_dir_path = path0.join("dir_temp_01")
        if (exists(dir_file_path)) {
            remove(dir_file_path, recursive: true)
        }
        if (exists(dir_dir_path)) {
            remove(dir_dir_path, recursive: true)
        }
        @Assert(exists(dir_file_path), false)
        @Assert(exists(dir_dir_path), false)
    }

    @TestCase
    func test_nonexist(): Unit {
        var pathbody = ["/home/a/b/none.a.b.c"]
        var pathbody_rel = ["/home/a/b/../b/none.a.b.c"]
        for (i in 0..1) {
            @Expect(Path(pathbody[i]) == Path(pathbody[i]), true)
            @Expect(Path(pathbody[i]) == Path(pathbody_rel[i]), true)
            @Expect(Path(pathbody_rel[i]) == Path(pathbody_rel[i]), true)
            @Expect(Path(pathbody[i]) != Path(pathbody[i]), false)
            @Expect(Path(pathbody[i]) != Path(pathbody_rel[i]), false)
            @Expect(Path(pathbody_rel[i]) != Path(pathbody_rel[i]), false)
        }
    }

    @TestCase
    func test_directory_path(): Unit {
        var p0 = Path("./dir_temp_01/仓颉cj")
        var p1 = Path("./dir_temp_01/../dir_temp_01/../dir_temp_01/仓颉cj")
        var p2 = Path("./dir_temp_01/仓颉Cj")
        println(p0)
        println(p1)
        println(p2)
        @Expect(p0 == p1, true)
        @Expect(p0 != p1, false)
        @Expect(p0 == p2, false)
        @Expect(p0 != p2, true)
    }

    @TestCase
    func test_file_path_permission(): Unit {
        var p0 = Path("./file_temp_01/仓颉Cj")
        var p1 = Path("./file_temp_01/../file_temp_01/仓颉Cj")
        var f1 = FileInfo(p1)
        @Expect(f1.setExecutable(false), true)
        @Expect(f1.setReadable(false), true)
        @Expect(f1.setWritable(false), true)
        @Expect(p0 == p1, true)
        @Expect(p0 != p1, false)
        f1.setExecutable(true)
        f1.setReadable(true)
        f1.setWritable(true)
    }

    @TestCase
    func test_symbolicLink_path(): Unit {
        var p0 = Path("./file0101")
        var p1 = Path("./link01_F")
        var p2 = Path("./link02_L")
        @Expect(canonicalize(p0) == canonicalize(p1), true)
        @Expect(canonicalize(p0) == canonicalize(p2), true)
        @Expect(canonicalize(p0) != canonicalize(p1), false)
        @Expect(canonicalize(p0) != canonicalize(p2), false)
    }
}
