/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Path.join
 * Test API: public func join(path: String): Path
 *           public func join(path: Path): Path
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_Join {
    private var illegal_path_string = ["\0", "/home/bin\0/a"]
    private var fsexc_path_string = ["/", "/home", "///"]
    private var pathstring_old_new_total: Array<(String, String, String)> = [
        ("/a/b", "c/d", "/a/b/c/d"),
        ("/a/b", "./c/d..", "/a/b/./c/d.."),
        ("./a/b", "./c/d", "./a/b/./c/d"),
        ("./a/b", "./c/d.e", "./a/b/./c/d.e")
    ]

    @TestCase
    func test_join_illegal(): Unit {
        var sum = 0
        try {
            Path("").join("a")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The rawPath is an empty string.")
            sum += 1
        }
        try {
            Path("").join(Path("a"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The rawPath is an empty string.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).join("a")
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The rawPath value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
            try {
                Path(str).join(Path("a"))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The rawPath value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
            try {
                Path("/a").join(str)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The path value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
            try {
                Path("/a").join(Path(str))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The path value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
        }
        @Expect(sum, 10)
    }

    @TestCase
    func test_join_fsexc(): Unit {
        var sum = 0
        for (str in fsexc_path_string) {
            try {
                Path("/a").join(str)
            } catch (e: FSException) {
                @Expect(e.message, "The path `${str}` cannot be an absolute path!")
                sum += 1
            }
            try {
                Path("./a").join(Path(str))
            } catch (e: FSException) {
                @Expect(e.message, "The path `${str}` cannot be an absolute path!")
                sum += 1
            }
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_join_empty(): Unit {
        @Expect(Path("/a").join(""), Path("/a/"))
        @Expect(Path("a").join(Path("")), Path("a/"))
        @Expect(Path("/").join("").join(""), Path("/"))
    }

    @TestCase
    func test_join_linux(): Unit {
        for ((oldpath, newpath, totalpath) in pathstring_old_new_total) {
            @Expect(Path(oldpath).join(newpath), Path(totalpath))
            @Expect(Path(oldpath).join(Path(newpath)), Path(totalpath))
        }
    }

    @TestCase
    func test_root(): Unit {
        @Expect(Path("/").join("a/b"), Path("/a/b"))
        @Expect(Path("/").join("../.a/b.."), Path("/../.a/b.."))
    }
}
