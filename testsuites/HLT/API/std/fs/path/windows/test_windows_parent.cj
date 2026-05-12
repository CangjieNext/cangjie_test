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
 * Test description: Test the Path.directoryName
 * Test API: public prop let directoryName: Option<Path>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_Parent {
    private var illegal_path_string = ["\0", "C:\\\0", "\\\\0.0.0.0\\a\0"]
    private var path_string_dirname: Array<(String, Path)> = [
        ("C:\\a\\b\\c", Path("C:\\a\\b")),
        ("C:\\a\\b\\", Path("C:\\a")),
        (".\\a\\b\\c", Path(".\\a\\b")),
        (".\\a\\b\\c", Path(".\\a\\b")),
        (".\\", Path(".")),
        ("..\\a\\b\\", Path("..\\a")),
        ("\\\\.\\C:\\a\\b\\c", Path("\\\\.\\C:\\a\\b")),
        ("\\\\?\\C:\\a\\b\\c", Path("\\\\?\\C:\\a\\b")),
        ("\\\\0.0.0.0\\a\\b", Path("\\\\0.0.0.0\\a\\")),
        ("\\\\?\\UNC\\0.0.0.0\\a\\b", Path("\\\\?\\UNC\\0.0.0.0\\a\\")),
        ("\\\\.\\UNC\\0.0.0.0\\a\\", Path("\\\\.\\UNC\\0.0.0.0\\a\\")),
        ("C:\\\\a\\b\\c\\\\", Path("C:\\\\a\\b")),
        ("C:\\", Path("C:\\"))
    ]

    @TestCase
    func test_parent_illegal(): Unit {
        var sum = 0
        try {
            Path("").parent
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).parent
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_parent_windows(): Unit {
        for ((str, dirname) in path_string_dirname) {
            @Expect(Path(str).parent, dirname)
        }
    }
}
