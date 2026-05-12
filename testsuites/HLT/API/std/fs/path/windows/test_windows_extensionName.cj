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
 * Test description: Test the Path.extensionName
 * Test API: public prop let extensionName: Option<String>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_ExtensionName {
    private var illegal_path_string = ["\0", "C:\\\0", "\\\\0.0.0.0\\a\0"]
    private var path_string_extensionName: Array<(String, String)> = [
        ("C:\\a\\b\\c", ""),
        ("C:\\a\\b\\", ""),
        (".\\a\\b\\.c", "c"),
        (".\\a\\b\\c.", ""),
        (".\\", ""),
        ("..\\a\\.b\\", "b"),
        ("\\\\.\\C:\\a\\b\\.c.d", "d"),
        ("\\\\?\\C:\\a\\b\\c.d", "d"),
        ("\\\\0.0.0.0\\a\\...b", "b"),
        ("\\\\?\\UNC\\0.0.0.0\\a\\\\..b.", ""),
        ("\\\\.\\UNC\\0.0.0.0\\a\\", ""),
        ("C:\\\\a\\b\\c\\\\....", "")
    ]

    @TestCase
    func test_extensionName_illegal(): Unit {
        var sum = 0
        try {
            Path("").extensionName
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).extensionName
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_extensionName_windows(): Unit {
        for ((str, extensionName) in path_string_extensionName) {
            @Expect(Path(str).extensionName, extensionName)
        }
    }
}
