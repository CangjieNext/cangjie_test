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
 * Test description: Test the Path.fileNameWithoutExtension
 * Test API: public prop let fileNameWithoutExtension: Option<String>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_FileNameWithoutExtension {
    private var illegal_path_string = ["\0", "/home\0"]
    private var path_string_fileNameWithoutExtension: Array<(String, String)> = [
        ("/a/b/c", "c"),
        ("/a/b/.", ""),
        ("/a.", "a"),
        ("/", ""),
        ("./a/..b", "."),
        ("./", ""),
        (".", ""),
        (".none", ""),
        ("a.txt", "a"),
        ("./a/..b/", "."),
        ("../a///b", "b"),
        ("/a/b////c...", "c.."),
        (".///a//b//", "b"),
        ("./.a..b.c", ".a..b")
    ]

    @TestCase
    func test_fileNameWithoutExtension_illegal(): Unit {
        var sum = 0
        try {
            Path("").fileNameWithoutExtension
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).fileNameWithoutExtension
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The path value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_fileNameWithoutExtension_linux(): Unit {
        for ((str, fileNameWithoutExtension) in path_string_fileNameWithoutExtension) {
            @Expect(Path(str).fileNameWithoutExtension, fileNameWithoutExtension)
        }
    }
}
