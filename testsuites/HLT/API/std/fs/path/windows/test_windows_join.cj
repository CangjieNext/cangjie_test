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
 * Test description: Test the Path.join
 * Test API: public func join(path: String): Path
 *           public func join(path: Path): Path
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_Join {
    private var illegal_path_string = ["\0", "C:\\\0", "\\\\0.0.0.0\\a\0"]
    private var fsexc_path_string = ["\\", "C:\\", "\\\\0.0.0.0\\"]
    private var pathstring_old_new_total: Array<(String, String, String)> = [
        ("C:\\", "a\\b", "C:\\a\\b"),
        ("C:\\a", ".\\b.\\.c.\\d...", "C:\\a\\.\\b.\\.c.\\d..."),
        (".\\a", "ab\\d", ".\\a\\ab\\d"),
        (".\\a\\", ".\\b.\\.c.\\\\\\d..", ".\\a\\.\\b.\\.c.\\\\\\d.."),
        ("\\\\.\\C:\\", "a\\b", "\\\\.\\C:\\a\\b"),
        ("\\\\?\\C:\\", "a\\b", "\\\\?\\C:\\a\\b"),
        ("\\\\0.0.0.0\\", "a\\\\...b...", "\\\\0.0.0.0\\a\\\\...b..."),
        ("\\\\.\\UNC\\0.0.0.0\\", "a\\b", "\\\\.\\UNC\\0.0.0.0\\a\\b")
    ]

    @TestCase
    func test_join_illegal(): Unit {
        var sum = 0
        try {
            Path("").join("a")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path is empty.")
            sum += 1
        }
        try {
            Path("").join(Path("a"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).join(".a")
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
            try {
                Path(str).join(Path("a.b"))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
            try {
                Path("C:\\a").join(str)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
            try {
                Path("\\\\.\\C:\\a").join(Path(str))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
        }
        @Expect(sum, 14)
    }

    @TestCase
    func test_join_fsexc(): Unit {
        var sum = 0
        for (str in fsexc_path_string) {
            try {
                Path("C:\\a").join(str)
            } catch (e: FSException) {
                @Expect(e.message, "The input path `${str}` cannot be an absolute path!")
                sum += 1
            }
            try {
                Path("\\\\?\\C:\\a").join(Path(str))
            } catch (e: FSException) {
                @Expect(e.message, "The input path `${str}` cannot be an absolute path!")
                sum += 1
            }
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_join_empty(): Unit {
        @Expect(Path("C:\\").join("").join(""), Path("C:\\"))
        @Expect(Path("\\\\.\\C:\\").join(Path("")), Path("\\\\.\\C:\\"))
    }

    @TestCase
    func test_join_windows(): Unit {
        for ((oldpath, newpath, totalpath) in pathstring_old_new_total) {
            @Expect(Path(oldpath).join(newpath), Path(totalpath))
            @Expect(Path(oldpath).join(Path(newpath)), Path(totalpath))
        }
    }
}
