/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: touch file0101
// (not Windows or OHOS)RUN-EXEC: ln -s file0101 link01_F
// (not Windows or OHOS)RUN-EXEC: ln -s link01_F link02_L
// (not Windows or OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (not Windows or OHOS)RUN-EXEC: rm -rf link02_L link01_F file0101

/*
 * Test description: Test the canonicalize Path.hashCode
 * Test API: public func canonicalize(): Path
 *           public func hashCode(): Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_ToCanonical_HashCode {
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
    func test_empty_path(): Unit {
        var sum = 0
        try {
            canonicalize(Path(""))
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_null_character(): Unit {
        var sum = 0
        var pathbody = ["\0", "/home/\0", "/a\0\0"]
        for (str in pathbody) {
            try {
                canonicalize(Path(str))
            } catch (e: IllegalArgumentException) {
                sum += 1
            }
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_nonexist(): Unit {
        var sum = 0
        var pathbody = ["/home/a/b/none.a.b.c", "./a/b/none.a.b.c", "nonenone.txt"]
        for (str in pathbody) {
            try {
                canonicalize(Path(str))
            } catch (e: FSException) {
                @Expect(e.message.contains("Failed to canonical: the input path " +'`${pathbody[sum]}`'+" may not exist or permission denied!"))
                sum += 1
            }
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_directory_path(): Unit {
        var p0 = Path("./dir_temp_01/仓颉cj")
        var p1 = Path("./dir_temp_01/../dir_temp_01/../dir_temp_01/仓颉cj")
        @Expect(canonicalize(p0), canonicalize(p1))
        @Expect(p0.hashCode(), p1.hashCode())
    }

    @TestCase
    func test_file_path_permission(): Unit {
        var p0 = Path("./file_temp_01/仓颉Cj")
        var p1 = Path("./file_temp_01/../file_temp_01/仓颉Cj")
        var f1 = FileInfo(p1)
        @Expect(f1.setExecutable(false), true)
        @Expect(f1.setReadable(false), true)
        @Expect(f1.setWritable(false), true)
        @Expect(canonicalize(p0), canonicalize(p1))
        @Expect(p0.hashCode(), p1.hashCode())
        f1.setExecutable(true)
        f1.setReadable(true)
        f1.setWritable(true)
    }

    @TestCase
    func test_symbolicLink_path(): Unit {
        var p0 = Path("./file0101")
        var p1 = Path("./link01_F")
        var p2 = Path("./link02_L")
        @Expect(canonicalize(p0), canonicalize(p1))
        @Expect(canonicalize(p0), canonicalize(p2))
    }

    @TestCase
    func test_hashCode_illegal(): Unit {
        var illegal_pathString = ["", "\0", "/home\0", "\0\0"]
        for (str in illegal_pathString) {
            @Expect(Path(str).hashCode(), Path(str).hashCode())
        }
    }
}
