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
 * Test description: Test the Path.isAbsolute
 * Test API: public func isAbsolute(): Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_IsAbsolute {
    private var illegal_path_string = ["\0", "C:\\\0", "\\\\0.0.0.0\\a\0"]
    private var path_string_isAbs: Array<(String, Bool)> = [
        ("nonexist\\.\\", false),
        (".\\a\\b\\\\.\\", false),
        ("\\a\\", true),
        ("C:\\a\\.b.\\", true),
        ("\\\\.\\C:\\", true),
        ("\\\\?\\C:\\..", true),
        ("\\\\0.0.0.0\\a", true),
        ("\\\\?\\UNC\\0.0.0.0\\a", true),
        ("\\\\.\\UNC\\0.0.0.0\\a", true)
    ]

    @TestCase
    func test_isAbsolute_illegal(): Unit {
        var sum = 0
        try {
            Path("").isAbsolute()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).isAbsolute()
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_isAbsolute_windows(): Unit {
        for ((str, isAbs) in path_string_isAbs) {
            @Expect(Path(str).isAbsolute(), isAbs)
        }
    }
}
