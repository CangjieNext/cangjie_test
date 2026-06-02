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
 * Test description: Test the Path.isRelative
 * Test API: public func isRelative(): Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_IsRelative {
    private var illegal_path_string = ["\0", "C:\\\0", "\\\\0.0.0.0\\a\0"]
    private var path_string_isRel: Array<(String, Bool)> = [
        ("nonexist\\.\\", true),
        (".\\a\\b\\\\.\\", true),
        ("\\a\\", false),
        ("C:\\a\\.b.\\", false),
        ("\\\\.\\C:\\", false),
        ("\\\\?\\C:\\..", false),
        ("\\\\0.0.0.0\\a", false),
        ("\\\\?\\UNC\\0.0.0.0\\a", false),
        ("\\\\.\\UNC\\0.0.0.0\\a", false)
    ]

    @TestCase
    func test_isRelative_illegal(): Unit {
        var sum = 0
        try {
            Path("").isRelative()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).isRelative()
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character"))
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_isRelative_windows(): Unit {
        for ((str, isRel) in path_string_isRel) {
            @Expect(Path(str).isRelative(), isRel)
        }
    }
}
